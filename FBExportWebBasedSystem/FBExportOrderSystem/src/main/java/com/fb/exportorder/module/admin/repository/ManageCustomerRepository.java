package com.fb.exportorder.module.admin.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Customer;

@Repository
public interface ManageCustomerRepository extends CrudRepository<Customer, Long> {
	@Query("SELECT c FROM Customer c WHERE c.username = :username")
	Customer findAccountByUsername(@Param("username")String username);
	
	@Query("SELECT COUNT(c.contact.emailAddress) > 0 FROM Customer c WHERE c.contact.emailAddress = :email")
	boolean isEmailExists (@Param("email") String username);
}
