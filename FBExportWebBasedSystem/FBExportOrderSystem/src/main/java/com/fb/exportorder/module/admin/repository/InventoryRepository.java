package com.fb.exportorder.module.admin.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Product;

@Repository
public interface InventoryRepository 
				 extends PagingAndSortingRepository<Product, Long>{

	
	
}
