package com.fb.exportorder.module.customer.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Review;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.ProductService;
import com.google.gson.Gson;

@Controller
public class ViewProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerService customerService;
	
	private DateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy");
	private Map<String, Double> mapAverage = new HashMap<>();
	
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
	
	@RequestMapping(value="/view-product/{id}", method=RequestMethod.GET)
	public String viewProduct(@PathVariable long id,
							  Model model,
							  HttpServletRequest request) {
		Product product = productService.findProductById(id);
		
		Date datePosted = product.getDatePosted();
		
		if(product == null) 
			return "redirect:/";
		
		/*increment the review count*/
		Rating rating = productService.findRatingById(id);
		int view = rating.getViews() + 1;
		rating.setViews(view);
		
		productService.saveRating(rating);
		/*increment the review count*/
		
		List<Review> reviewList = rating.getReviews();
		Collections.reverse(reviewList);
		
		List<Customer> customerList = new ArrayList<>();
		
		rating.getReviews().forEach((review) -> {
			Customer c = productService.findCustomerByUsername(review.getUsername());
			if(!customerList.contains(c)) {
				customerList.add(c);
			}
			
		});
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("customerId") != null) {
			double rate = 0.0;
			
			int i = 0;
			while(i < reviewList.size() ) {
				Review review = reviewList.get(i);
				if(review.getUsername().equals(session.getAttribute("customerUsername"))) {
					rate = review.getRate();
					break;
				}
				++i;
			}
			
			model.addAttribute("starRate", rate);
		}
		
		double average = getAverage(product.getRating().getReviews());
		
		model.addAttribute("averageRate", Double.isNaN(average) ? 0.00 : Double.parseDouble(String.format("%.2f", average)) );
		model.addAttribute("rates", mapAverage);
		model.addAttribute("customerList", customerList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("product", product);
		model.addAttribute("datePosted", dateFormat.format(datePosted).toString());
		return "view-product";
	}
	
	@RequestMapping(value="/review-product/{id}", method=RequestMethod.POST)
	@ResponseBody
	public String productReview(@PathVariable long id,
								Double rating,
								String review,
								HttpServletRequest request,
								Model model) {
		List<String> errors = validate(rating, review);
		if(!errors.isEmpty()) {
			Gson gson = new Gson();
			String json = gson.toJson(errors);
			System.out.println(json);
			return json;
		}
		
		HttpSession session = request.getSession();
		
		Customer customer = customerService.getCustomerById(Long.parseLong(session.getAttribute("customerId").toString()));
		
		Rating ratings = productService.findRatingById(id);
		
		List<Review> reviewList = productService.findAllByUsername(customer.getUsername());
		
		if((ratings.getRate() == 0 ) || reviewList.isEmpty()) {

			double rates = ratings.getRate();
			rates += rating;
			ratings.setRate(rates);
			System.out.println("Pasok " + rates);
			
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
		
		
		addReview(review, rating, customer.getUsername(), ratings);
		
		getAverage(ratings.getReviews());
		
		Gson jsonRate = new Gson();
		String rateJson = jsonRate.toJson(mapAverage);
		
		return rateJson;
	}
	
	public void addReview(String review, double rate, String username, Rating ratings) {
		Rating rating = ratings;
		Review rev = new Review();
	
		
		rev.setDescription(review);
		rev.setRate(rate);
		rev.setUsername(username);
		rev.setDate(new Date());
		
		rating.getReviews().add(rev);
		
		productService.saveRating(rating);
	}
	
	public List<String> validate(Double rate, String review){
		List<String> errors = new ArrayList<>();
		
		if(rate == null)
			errors.add("Please rate the product.");
		
		if(StringUtils.isEmpty(review))
			errors.add("Please add your review, comment or feedback.");
		
		return errors;
	}
	
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
	
}
