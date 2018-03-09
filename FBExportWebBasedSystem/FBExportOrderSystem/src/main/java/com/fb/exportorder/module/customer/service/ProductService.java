package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Review;

public interface ProductService {
	public Product findProductById(long id);
	
	public Rating findRatingById(long id);
	
	public void saveRating(Rating rating);
	
	public Review findReviewById(long id);
	
	public void saveReview(Review review);
	
	public List<Review> findAllByUsername(String Username);
}
