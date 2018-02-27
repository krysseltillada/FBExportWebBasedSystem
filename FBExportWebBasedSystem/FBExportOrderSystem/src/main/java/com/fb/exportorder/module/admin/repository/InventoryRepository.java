package com.fb.exportorder.module.admin.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Product;

@Repository
public interface InventoryRepository 
				 extends PagingAndSortingRepository<Product, Long>{

//	@Query("SELECT p FROM Product p WHERE p.status = 'POSTED' ORDER BY p.dateRegistered DESC")
//	List<Product> getLatestNewProducts(Pageable pageable);
	
	@Query(value = "SELECT * FROM product p WHERE p.status = 'POSTED' ORDER BY p.date_registered DESC LIMIT :record OFFSET :offset", 
		   nativeQuery=true)
	List<Object[]> getLatestNewProductsRecordsAndOffset(@Param("record") int record,
														@Param("offset") int offset); 	
	
	@Query("SELECT COUNT(p) FROM Product p WHERE p.status = 'POSTED'")
	int getLatestNewProductsCount ();
	
	@Query(value = "SELECT * FROM product p INNER JOIN rating r ON p.product_id = r.rating_id WHERE p.status = 'POSTED' ORDER BY r.views DESC LIMIT :record OFFSET :offset",
			   nativeQuery=true)
	List<Object[]> getMostViewedProductsRecordsAndOffset(@Param("record") int record,
														 @Param("offset") int offset); 	
		
	@Query("SELECT COUNT(p) FROM Product p WHERE p.status = 'POSTED' ORDER BY p.rating.views DESC")
	int getMostViewedProductsCount ();
	
	@Query("SELECT p FROM Product p WHERE p.status = 'POSTED' ORDER BY p.rating.rate DESC")
	List<Product> getMostPopularProducts(Pageable pageable);
	
	
}
