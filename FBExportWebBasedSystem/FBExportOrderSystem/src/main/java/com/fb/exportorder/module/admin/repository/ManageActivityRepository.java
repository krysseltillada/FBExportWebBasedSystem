package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;

@Repository
public interface ManageActivityRepository extends PagingAndSortingRepository<Activity, Long> {
	@Query(value = "SELECT * FROM activity a WHERE a.customer_id = :id", 
		   nativeQuery=true)
	List<Object[]> getCustomerActivitiesById(@Param("id") long customerId);
	
	@Query("SELECT c FROM Customer c WHERE c.username = :username")
	Customer findAccountByUsername(@Param("username")String username);
}
