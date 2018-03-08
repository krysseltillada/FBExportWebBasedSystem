package com.fb.exportorder.module.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.customer.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;

	@Override
	public Product findProductById(Long id) {
		return productRepository.findOne(id);
	}
	
}
