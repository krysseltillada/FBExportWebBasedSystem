package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.assertj.core.util.Lists;
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
		ratingRepository.save(rating);
	}

	@Override
	public Review findReviewById(long id) {
		return reviewRepository.findOne(id);
	}

	@Override
	public void saveReview(Review review) {
		reviewRepository.save(review);
	}

	@Override
	public List<Review> findAllByUsername(String username) {
		return reviewRepository.findReviewByUsername(username);
	}

	@Override
	public Customer findCustomerByUsername(String username) {
		return customerRepository.findAccountByUsername(username);
	}

}
