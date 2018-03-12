package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Review;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
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
	public List<Customer> sortedCustomerComments(Rating rating) {
		List<Review> reviewList = rating.getReviews();
		Collections.reverse(reviewList);
		
		List<Customer> customerList = new ArrayList<>();
		
		rating.getReviews().forEach((review) -> {
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
			
		mapAverage.forEach((k,v) -> mapAverage.put(k, 0.0));
		
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
	
		
		rev.setDescription(review);
		rev.setRate(rate);
		rev.setUsername(username);
		rev.setDate(new Date());
		
		rating.getReviews().add(rev);
		
		ratingRepository.save(rating);
	}

}
