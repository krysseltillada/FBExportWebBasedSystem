package com.fb.exportorder.module.customer.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Customer;

@Repository
public interface CustomerRepository
				 extends CrudRepository<Customer, Long>{

	@Query("SELECT c FROM Customer c WHERE c.username = :username")
	Customer findAccountByUsername (@Param("username")String username);
	
	
}
