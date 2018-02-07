package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;

public interface CustomerService {
	public Customer getCustomerById(long customerId);
	public List<Activity> getCustomerActivitiesById(long customerId, int pageNumber, int pageSize);
}
