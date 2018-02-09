package com.fb.exportorder.module.customer.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

public class CustomerAccountServiceImpl implements CustomerAccountService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public void editAccount(Customer customer, long customerId) {
		
		Customer prevNotEditAccount = customerRepository.findOne(customerId);
	
		
	}

}
