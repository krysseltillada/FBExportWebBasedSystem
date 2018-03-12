package com.fb.exportorder.module.customer.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Review;

public interface ProductService {
	public Product findProductById(long id);
	
	public Rating findRatingById(long id);
	
	public void saveRating(Rating rating);
	
	public void deleteReviewById(long productid, long reviewid);
	
	public void saveReview(Rating ratings, Double rating, List<Review> reviewList, String review, String username);
	
	public List<Review> findAllByUsername(String Username);
	
	public List<Customer> sortedCustomerComments(Rating rating);
	
	public double getRate(HttpSession session, Rating rating);
	
	public double getAverage(List<Review> reviewList);
	
	public Map<String, Double> getMapAverage();
	
	public List<String> validate(Double rate, String review);
}
