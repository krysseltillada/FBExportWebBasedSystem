package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;

@Repository
public interface CustomerRepository
				 extends PagingAndSortingRepository<Customer, Long>{

	@Query("SELECT c FROM Customer c WHERE c.username = :username")
	Customer findAccountByUsername (@Param("username")String username);
	
	@Query("SELECT COUNT(c.contact.emailAddress) > 0 FROM Customer c WHERE c.contact.emailAddress = :email")
	boolean isEmailExists (@Param("email") String username);
	
	@Query("SELECT c FROM Customer c WHERE c.contact.emailAddress = :email")
	Customer findAccountByEmail (@Param("email") String email);
	
	@Query("SELECT c.activities FROM Customer c WHERE c.id = :id")
	List<Activity> getActivitiesById(@Param("id") long id);
	
	@Query("SELECT c.activities FROM Customer c WHERE c.id = :id")
	List<Activity> getActivitiesById(@Param("id") long id, 
            Pageable pageRequest);
	
}
