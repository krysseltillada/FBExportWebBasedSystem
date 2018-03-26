package com.fb.exportorder.module.customer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
	
}
