package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.AccountRepository;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Service("userDetailsService")
public class AccountSecurityServiceImpl implements UserDetailsService {

  @Autowired
  private AccountRepository accountRepository;

  @Autowired
  private CustomerRepository customerRepository;
  

  
  @Transactional(readOnly = true)
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

	  System.out.println(username);
	  
    Account account = accountRepository.findAccountByUsername(username);
    Account accountByEmail = accountRepository.findAccountByEmail(username);
    	
    UserBuilder builder = null;
    String[] authorities = null;
    Authorities accountAuth = null;
    Account accountBuilder = null;
    
    if (account != null) {
    	
      accountAuth = account.getAuthorities().iterator().next();
      
      System.out.println(accountAuth.getAuthority());
      
      switch (accountAuth.getAuthority()) {
      case "CUSTOMER":
      		
      		accountBuilder = customerRepository.findAccountByUsername(username);
      		System.out.println(accountBuilder.getUsername() + " CUSTOMER ");
      		
      		break;
      	case "EMPLOYEE": case "ADMIN":
      		
      		break;
      }
    
   
    } else if (accountByEmail != null) {
    	
    	accountAuth = accountByEmail.getAuthorities().iterator().next();
        
        switch (accountAuth.getAuthority()) {
        	case "CUSTOMER":
        		
        		accountBuilder = customerRepository.findAccountByEmail(username);
        		System.out.println(accountBuilder.getUsername());
        		
        		break;
        	case "EMPLOYEE": case "ADMIN":
        		break;
        }
      	
    	
    } else {
    	throw new UsernameNotFoundException("Username not found");
    }
    
    builder = org.springframework.security.core.userdetails.User.withUsername(accountBuilder.getUsername());
    builder.disabled(!accountBuilder.isEnabled());
    builder.password(accountBuilder.getPassword());
    authorities = accountBuilder.getAuthorities()
        .stream().map(a -> a.getAuthority()).toArray(String[]::new);

    builder.authorities(authorities);
    
    return builder.build();
  }
  
}