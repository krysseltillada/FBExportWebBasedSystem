package com.fb.exportorder.module.customer.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Account;

@Repository
public interface AccountRepository 
	   extends CrudRepository<Account, Long> {
	
	@Query("SELECT a FROM Account a WHERE a.username = ?1")
	Account findAccountByUsername (String username);
	
}
