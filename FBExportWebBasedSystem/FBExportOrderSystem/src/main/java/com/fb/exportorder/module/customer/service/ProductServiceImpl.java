package com.fb.exportorder.module.customer.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Review;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.models.enums.ProductStatus;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.OrderRepository;
import com.fb.exportorder.module.customer.repository.ProductRepository;
import com.fb.exportorder.module.customer.repository.RatingRepository;
import com.fb.exportorder.module.customer.repository.ReviewRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private RatingRepository ratingRepository;
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	public Map<String, Double> mapAverage = new HashMap<>();
	
	@PostConstruct
	public void init() {
		mapAverage.put("CountTotal", 0.0);
		mapAverage.put("1.0", 0.0);
		mapAverage.put("2.0", 0.0);
		mapAverage.put("3.0", 0.0);
		mapAverage.put("4.0", 0.0);
		mapAverage.put("5.0", 0.0);
		mapAverage.put("Total", 0.0);
		mapAverage.put("Count1.0", 0.0);
		mapAverage.put("Count2.0", 0.0);
		mapAverage.put("Count3.0", 0.0);
		mapAverage.put("Count4.0", 0.0);
		mapAverage.put("Count5.0", 0.0);
		mapAverage.put("Average", 0.0);
		mapAverage.put("lastReviewId", 0.0);
	}

	@Override
	public Product findProductById(long id) {
		return productRepository.findOne(id);
	}

	@Override
	public Rating findRatingById(long id) {
		return ratingRepository.findOne(id);
	}

	@Override
	public void saveRating(Rating rating) {
		int view = rating.getViews() + 1;
		rating.setViews(view);
		
		ratingRepository.save(rating);
	}

	@Override
	public void saveReview(Rating ratings, Double rating, List<Review> reviewList, String review, String username) {
		if((ratings.getRate() == 0 ) || reviewList.isEmpty()) {

			double rates = ratings.getRate();
			rates += rating;
			ratings.setRate(rates);
			
		} else{
			double rate = ratings.getRate();
			for(Review rev : reviewList) {
				for(Review r : ratings.getReviews()) {
					if(rev.getReviewId().equals(r.getReviewId())) {
						ratings.setRate((rate - rev.getRate()) + rating);
						
						rev.setRate(rating);
					}
				}
			}
		}
		
		
		addReview(review, rating, username, ratings);
		
	}

	@Override
	public List<Review> findAllByUsername(String username) {
		return reviewRepository.findReviewByUsername(username);
	}

	@Override
	public List<Customer> sortedCustomerComments(int records, int offset, long id) {
		
		List<Review> reviewList = this.getReviews(records, offset, id);
		
		List<Customer> customerList = new ArrayList<>();
		
		reviewList.forEach((review) -> {
			System.out.println(review.getDescription() + " " + review.getDate().toString());
			Customer c = customerRepository.findAccountByUsername(review.getUsername());
			if(!customerList.contains(c)) {
				customerList.add(c);
			}
			
		});
		
		
		return customerList;
	}

	@Override
	public double getRate(HttpSession session, Rating rating) {
		double rate = 0.0;
		
		int i = 0;
		while(i < rating.getReviews().size() ) {
			Review review = rating.getReviews().get(i);
			if(review.getUsername().equals(session.getAttribute("customerUsername"))) {
				rate = review.getRate();
				break;
			}
			++i;
		}
		return rate;
	}

	@Override
	public double getAverage(List<Review> reviewList) {
			
		mapAverage.forEach((k,v) -> { if(!k.equals("lastReviewId")) mapAverage.put(k, 0.0); });
		
		Collection<Review> reviewCollection = reviewList.stream()
				   .<Map<String, Review>> collect(HashMap::new,(m,e)->m.put(e.getUsername(), e), Map::putAll)
				   .values();
		
		reviewCollection.forEach((review) ->{
			double rate = review.getRate();
			String countString = String.format("Count%s",String.valueOf(rate));
			
			mapAverage.put(String.valueOf(rate), mapAverage.get(String.valueOf(rate)) + rate);
			mapAverage.put(countString, mapAverage.get(countString) + 1);
			mapAverage.put("Total", mapAverage.get("Total") + rate);
			mapAverage.put("CountTotal", mapAverage.get("CountTotal") + 1);
		});
		
		double average = ((5 * mapAverage.get("5.0")) + (4 * mapAverage.get("4.0")) + (3 * mapAverage.get("3.0")) + (2 * mapAverage.get("2.0")) + (1 * mapAverage.get("1.0"))) / mapAverage.get("Total");
		
		mapAverage.put("Average", Double.parseDouble(String.format("%.2f", average)));
		
		return average;
	}

	@Override
	public Map<String, Double> getMapAverage() {
		return this.mapAverage;
	}
	
	@Override
	public List<String> validate(Double rate, String review){
		List<String> errors = new ArrayList<>();
		
		if(rate == null)
			errors.add("Please rate the product.");
		
		if(StringUtils.isEmpty(review))
			errors.add("Please add your review, comment or feedback.");
		
		return errors;
	}
	
	public void addReview(String review, double rate, String username, Rating ratings) {
		Rating rating = ratings;
		Review rev = new Review();
		List<Review> reviewList = rating.getReviews();
		
		rev.setDescription(review);
		rev.setRate(rate);
		rev.setUsername(username);
		rev.setDate(new Date());
		
		reviewList.add(rev);
		
		ratingRepository.save(rating);
		
		Rating r = ratingRepository.findOne(rating.getRatingId());
		long id = r.getReviews().get(reviewList.size() - 1).getReviewId();

		mapAverage.put("lastReviewId", Double.valueOf(id));
		System.out.println(mapAverage.get("lastReviewId"));
	}

	@Override
	public void deleteReviewById(long ratingid, long reviewid) {
		Rating rating = ratingRepository.findOne(ratingid);
		List<Review> reviewList = rating.getReviews();
		
		reviewList.remove(reviewRepository.findOne(reviewid));
		
		ratingRepository.save(rating);
		
		getAverage(rating.getReviews());
		
	}

	@Override
	public List<Review> getReviews(int records, int offset, long id) {
		List<Object[]> rawResultSet = reviewRepository.getCustomerReviewsRecordsAndOffset(records, offset, id);
		List<Review> reviewList = new ArrayList<>();
		
		for (Object[] rawRow : rawResultSet) {
			
			Review review = new Review();
			
			review.setReviewId(((BigInteger)rawRow[0]).longValue());
			review.setDate((Date)rawRow[1]);
			review.setDescription((String)rawRow[2]);
			review.setRate((double)rawRow[3]);
			review.setUsername((String)rawRow[4]);
			
			reviewList.add(review);
		}
		return reviewList;
	}

	@Override
	public int getReviewCount(long id) {
		return reviewRepository.getReviewCount(id);
	}

	@Override
	public Map<String, List<Review>> getCustomerReviews(List<Customer> customerList, List<Review> reviewList) {
		Map<String, List<Review>> customerReview = new HashMap<>();
		
		customerList.forEach((customer) -> {
			customerReview.put(customer.getProfileImageLink(), new ArrayList<Review>());
		});
		
		customerList.forEach((customer) -> {
			reviewList.forEach((review) -> {
				if(review.getUsername().equals(customer.getUsername())) {
					customerReview.get(customer.getProfileImageLink()).add(review);
				}
			});
		});
		return customerReview;
	}
	
	@Override
	public List<Rating> getTopThreeMostRatedProduct() {
		return ratingRepository.getTopThreeMostRatedProduct();
	}

	@Override
	public List<Rating> getTopThreeMostViewedProduct() {
		return ratingRepository.getTopThreeMostViewedProduct();
	}

	@Override
	public Map<Product, Integer> getTopPaidProduct() {
		List<Order> orderList = orderRepository.getPaidOrders();
		
		Map<Product, Integer> mostPaid = new HashMap<>();
		
		orderList.forEach((order) -> {
			order.getCart().getItems().forEach((item) -> {
				Product product = item.getProduct();
				mostPaid.put(product, mostPaid.containsKey(product) ? mostPaid.get(product) + 1 : 1);
			});
		});
		
		return sortByComparator(mostPaid);
	}
	
	@Override
	public Map<Product, Integer> getPaidProductPreviousMonths() {
		List<Order> orderList = orderRepository.getPaidOrdersPreviousMonths();
		
		Map<Product, Integer> paidProduct = new HashMap<>();
		
		orderList.forEach((order) -> {
			order.getCart().getItems().forEach((item) -> {
				Product product = item.getProduct();
				//mostPaid.put(product, mostPaid.containsKey(product) ? mostPaid.get(product) + 1 : 1);
			});
		});
		return null;
	}
	
	private Map<Product, Integer> sortByComparator(Map<Product, Integer> unsortMap) {

		List<Entry<Product, Integer>> list = new LinkedList<Entry<Product, Integer>>(
		        unsortMap.entrySet());

		    Collections.sort(list, new Comparator<Entry<Product,Integer>>() {

				@Override
				public int compare(Entry<Product, Integer> o1, Entry<Product, Integer> o2) {
					return o2.getValue().compareTo(o1.getValue());
				}
		    	
		    });

		    Map<Product, Integer> sortedMap = new LinkedHashMap<Product, Integer>();
		    
		    list.forEach((entry) -> {
		    	if(sortedMap.size() < 3 ) {
		    		sortedMap.put(entry.getKey(), entry.getValue());
		    	}
		    });
		    
		    return sortedMap;
	}
}
