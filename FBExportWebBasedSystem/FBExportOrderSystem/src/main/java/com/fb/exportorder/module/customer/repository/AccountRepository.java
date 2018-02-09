package com.fb.exportorder.module.customer.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.customer.Customer;

@Repository
public interface AccountRepository 
	   extends CrudRepository<Account, Long> {
	
	@Query("SELECT a FROM Account a WHERE a.username = ?1")
	Account findAccountByUsername (String username);
	
	@Query("SELECT a FROM Account a WHERE a.contact.emailAddress = :email")
	Customer findAccountByEmail (@Param("email") String email);
	
}
