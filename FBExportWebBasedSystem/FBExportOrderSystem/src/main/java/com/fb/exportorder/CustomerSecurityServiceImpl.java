package com.fb.exportorder;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Service("customerUserDetailsService")
public class CustomerSecurityServiceImpl implements UserDetailsService{

	@Autowired
	private CustomerRepository customerRepository;
	
	private UserDetails setUserDetailsBuilder (Customer customer) {
		
		UserBuilder userBuilder = org.springframework.security.core.userdetails.User.withUsername(customer.getUsername());
		userBuilder.disabled(!customer.isEnabled());
		userBuilder.password(customer.getPassword());

		userBuilder.authorities( customer.getAuthorities()
							.stream().map(a -> a.getAuthority()).toArray(String[]::new));
		
		return userBuilder.build();
		
	}
	
	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		System.out.println(username + " customer");
		
		Customer customer = customerRepository.findAccountByUsername(username);
		Customer customerByEmail = customerRepository.findAccountByEmail(username);
		
		UserDetails userDetails = null;
	
		
		if (Objects.nonNull(customer)) 
			userDetails = setUserDetailsBuilder(customer);
		else if (Objects.nonNull(customerByEmail)) {
			System.out.println(customerByEmail.getContact().getEmailAddress());
			userDetails = setUserDetailsBuilder(customerByEmail);
		}
		else {
			throw new UsernameNotFoundException("Username not found");
		}
		
		return userDetails;
	}

}
