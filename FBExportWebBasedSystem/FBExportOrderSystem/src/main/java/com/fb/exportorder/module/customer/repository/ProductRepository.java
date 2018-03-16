package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Rating;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
	
}
