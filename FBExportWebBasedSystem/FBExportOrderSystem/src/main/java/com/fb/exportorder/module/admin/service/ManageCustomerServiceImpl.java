package com.fb.exportorder.module.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.admin.repository.ManageCustomerRepository;

@Service
public class ManageCustomerServiceImpl implements ManageCustomerService {
	
	@Autowired
	private ManageCustomerRepository customerRepository;
	
	private List<String> validate(Customer customer) {
		Contact customerContact = customer.getContact();
		Address customerAddress = customer.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
				
		if(!StringUtils.isAlphanumeric(customer.getUsername()))
			errorMessages.add("username cannot contain a special characters or a space or empty");
		
		if(!StringUtils.isAlphaSpace(customer.getFirstname()) || StringUtils.isBlank(customer.getFirstname()))
			errorMessages.add("first name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isAlphaSpace(customer.getMiddlename()) || StringUtils.isBlank(customer.getMiddlename()))
			errorMessages.add("middle name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isAlphaSpace(customer.getLastname()) || StringUtils.isBlank(customer.getLastname()))
			errorMessages.add("last name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isNumeric(Integer.toString(customer.getAge())))
			errorMessages.add("age cannot contain letters or symbols");
		
		if (StringUtils.isBlank(customerAddress.getAddress()))
			errorMessages.add("address cannot be empty");
		
		if (StringUtils.isNumeric(customerAddress.getCountry()) || StringUtils.isBlank(customerAddress.getCountry()))
			errorMessages.add("country cannot be empty and contain digits");
		
		if(!StringUtils.isAlphaSpace(customerAddress.getCity()) || StringUtils.isBlank(customerAddress.getCity()))
			errorMessages.add("city cannot be empty, contains digits or symbols");
		
		if(!StringUtils.isAlphanumeric(customerAddress.getZipCode()) || StringUtils.isBlank(customerAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty or contain any symbols");
		
		if (!StringUtils.isNumeric(customerContact.getPhoneNumber()) || StringUtils.isBlank(customerContact.getPhoneNumber()))
			errorMessages.add("phone number cannot be empty, contain letters, spaces or symbols");
		
		if (StringUtils.isBlank(customerContact.getCountryCode()))
			errorMessages.add("country code cannot be empty");
		
		if(!EmailValidator.getInstance()
	 			  .isValid(customer.getContact().getEmailAddress())) {
			if (StringUtils.isBlank(customerContact.getEmailAddress()))
				errorMessages.add("Email Address Cannot be empty");
			else
				errorMessages.add("Invalid Email Address"); 
		}
		
		return errorMessages;
	}
	
	@Override
	public List<Customer> getAllCustomers() {
		List<Customer> customers = new ArrayList<>();
		for(Customer customer : customerRepository.findAll()) {
			customers.add(customer);
		}
		return customers;
	}

	@Override
	public void editEnabledCustomer(String username) {
		Customer customer = customerRepository.findAccountByUsername(username);
		if(customer.isEnabled())
			customer.setEnabled(false);
		else
			customer.setEnabled(true);
		
		customerRepository.save(customer);
		
	}

	@Override
	public List<String> editCustomer(Customer customer, String newEmailClientEdit, String newUsernameClientEdit) {
		List<String> errorMessages = validate(customer);
		
		/*Check if exist*/
		if(!newEmailClientEdit.isEmpty()) {
			boolean isEmailExists = customerRepository.isEmailExists(newEmailClientEdit);
			if (isEmailExists)
				errorMessages.add("Email Address exists");
			else
				customer.getContact().setEmailAddress(newEmailClientEdit);
		}
		
		if(!newUsernameClientEdit.isEmpty()) {
			Customer registeredCustomer = customerRepository.findAccountByUsername(newUsernameClientEdit);
			if(Objects.nonNull(registeredCustomer))
				errorMessages.add("username exists");
			else {
				if(!StringUtils.isAlphanumeric(newUsernameClientEdit))
					errorMessages.add("username cannot contain a special characters or a space or empty");
				else
					customer.setUsername(newUsernameClientEdit);
			}
		}
		
		/*Check if exist*/
		
		
		
		
		if(errorMessages.isEmpty()) {
			customerRepository.save(customer);
		}
		
		return errorMessages;
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		return customerRepository.findAccountByUsername(username);
	}

}
