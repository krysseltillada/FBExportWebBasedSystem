package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Service
public class CustomerSignUpServiceImpl implements CustomerSignUpService {

	@Autowired
	CustomerRepository customerRepository;
	

	
	private List<String> validate (Customer customer) {
		
		List<String> errorMessages = new ArrayList<>();
		Customer registeredCustomer = customerRepository.findAccountByUsername(customer.getUsername());
		
		if (Objects.nonNull(registeredCustomer))
			errorMessages.add("username exists");
		
		if (!StringUtils.isAlphaSpace(customer.getFirstname()))
			errorMessages.add("first name cannot digits");
		
		if (!StringUtils.isAlphaSpace(customer.getMiddlename()))
			errorMessages.add("middle name cannot digits");
		
		if (!StringUtils.isAlphaSpace(customer.getLastname()))
			errorMessages.add("last name cannot digits");
		
		if (!StringUtils.isNumeric(Integer.toString(customer.getAge())))
			errorMessages.add("age cannot contain letters or symbols");
		
		if (!StringUtils.isAlphaSpace(customer.getAddress().getCity()))
			errorMessages.add("city cannot contain letters or symbols");
		
		if (!StringUtils.isNumeric(customer.getAddress().getZipCode()))
			errorMessages.add("zipcode cannot container letters or symbols");
		
		if (!StringUtils.isNumeric(customer.getContact().getPhoneNumber()))
			errorMessages.add("phone number cannot contain letters or symbols");
		
		
		return errorMessages;
		
	}
	
	@Override
	public List<String> register(Customer customer) {
		
		List<String> errorMessages = validate (customer);

		if (errorMessages.isEmpty())
			System.out.println("successfully registered");
		
		return errorMessages;
		
	}

	

}
