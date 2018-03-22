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
import org.springframework.web.bind.annotation.RequestParam;
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
		
		productService.saveRating(rating);
		/*increment the review count*/
		
		List<Customer> customerList = productService.sortedCustomerComments(3,0,id);
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("customerId") != null) {
			model.addAttribute("starRate", productService.getRate(session, rating));
		}
		
		double average = productService.getAverage(product.getRating().getReviews());
		
		model.addAttribute("averageRate", Double.isNaN(average) ? 0.00 : Double.parseDouble(String.format("%.2f", average)) );
		model.addAttribute("rates", productService.getMapAverage());
		
		model.addAttribute("product", product);
		model.addAttribute("datePosted", dateFormat.format(datePosted).toString());
		
		model.addAttribute("reviewCount", productService.getReviewCount(id));
		model.addAttribute("customerList", customerList);
		model.addAttribute("reviewList", productService.getReviews(3, 0, id));
		
		return "view-product";
	}
	
	@RequestMapping(value="/delete-review/{productid}/{reviewid}", method=RequestMethod.POST)
	@ResponseBody
	public String deleteProductReview(@PathVariable long productid,
									  @PathVariable long reviewid) {
		
		productService.deleteReviewById(productid, reviewid);
		
		Gson jsonRate = new Gson();
		productService.getMapAverage().forEach((k, v) ->{
			System.out.println(k + " " + v);
		});
		String rateJson = jsonRate.toJson(productService.getMapAverage());
		
		return rateJson;
	}
	
	@RequestMapping(value="/review-product/{id}", method=RequestMethod.POST)
	@ResponseBody
	public String productReview(@PathVariable long id,
								Double rating,
								String review,
								HttpServletRequest request,
								Model model) {
		List<String> errors = productService.validate(rating, review);
		if(!errors.isEmpty()) {
			Gson gson = new Gson();
			String json = gson.toJson(errors);
			return json;
		}
		
		HttpSession session = request.getSession();
		
		Customer customer = customerService.getCustomerById(Long.parseLong(session.getAttribute("customerId").toString()));
		
		Rating ratings = productService.findRatingById(id);
		
		List<Review> reviewList = productService.findAllByUsername(customer.getUsername());
		
		productService.saveReview(ratings, rating, reviewList, review, customer.getUsername());
		
		productService.getAverage(ratings.getReviews());
		
		Gson jsonRate = new Gson();
		String rateJson = jsonRate.toJson(productService.getMapAverage());
		
		return rateJson;
	}
	
	@RequestMapping("/see-more-review/{id}")
	@ResponseBody
	public String seeMoreReview (@PathVariable long id,
									   @RequestParam String pageCount) {
		Gson gson = new Gson();
		List<Review> reviewList = productService.getReviews(3, Integer.parseInt(pageCount), id);
		List<Customer> customerList = productService.sortedCustomerComments(3, Integer.parseInt(pageCount), id);
		
		String toStringJSON = gson.toJson(productService.getCustomerReviews(customerList, reviewList));
		
		return toStringJSON;
	}
	
	
}
