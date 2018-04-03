package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.customer.Customer;

public interface ManageCustomerService {
	
	List<Customer> getAllCustomers();
	
	void editEnabledCustomer(String username);
	
	List<String> editCustomer(Customer customer, String newEmailClientEdit, String newUsernameClientEdit);

	Customer getCustomerByUsername(String usernameClientEdit);

}
