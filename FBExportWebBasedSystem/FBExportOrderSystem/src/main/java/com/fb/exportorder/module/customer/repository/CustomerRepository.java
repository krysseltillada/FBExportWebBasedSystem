package com.fb.exportorder.module.customer.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Customer;

@Repository
public interface CustomerRepository
				 extends CrudRepository<Customer, Long>{

	@Query("SELECT c FROM Customer c WHERE c.username = ?1")
	Customer findAccountByUsername (String username);
	
}
