package com.fb.exportorder.module.admin.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Product;

@Repository
public interface InventoryRepository 
				 extends PagingAndSortingRepository<Product, Long>{

}
