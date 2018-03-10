package com.fb.exportorder.module.customer.controllers;

import static org.mockito.Matchers.intThat;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.assertj.core.util.Lists;
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
			}
			
			model.addAttribute("starRate", rate);
		}
		
		
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
			return json;
		}
		
		HttpSession session = request.getSession();
		
		Customer customer = customerService.getCustomerById(Long.parseLong(session.getAttribute("customerId").toString()));
		Rating ratings = productService.findRatingById(id);

		List<Review> reviewList = productService.findAllByUsername(customer.getUsername());
		
		if(!reviewList.isEmpty()) {
			double rate = ratings.getRate();
			rate = (rate - reviewList.get(0).getRate()) + rating;
			ratings.setRate(rate);
			
			for(Review rev : reviewList) {
				rev.setRate(rating);
				
				productService.saveReview(rev);
			}
			
			
		}else {
			double rate = ratings.getRate();
			rate += rating;
			ratings.setRate(rate);
			
		}
		
		reviewList.add(addReview(review, rating, customer.getUsername()));
		
		reviewList.removeAll(ratings.getReviews());
		ratings.getReviews().addAll(reviewList);
		
		productService.saveRating(ratings);
		
		return "Success";
	}
	
	public Review addReview(String review, double rating, String username) {
		Review reviews = new Review();
		
		reviews.setDescription(review);
		reviews.setRate(rating);
		reviews.setUsername(username);
		reviews.setDate(new Date());
		
		productService.saveReview(reviews);
	
		return reviews;
	}
	
	public List<String> validate(Double rate, String review){
		List<String> errors = new ArrayList<>();
		
		if(rate == null)
			errors.add("Please rate the product.");
		
		if(StringUtils.isEmpty(review))
			errors.add("Please add your review, comment or feedback.");
		
		return errors;
	}
	
}
