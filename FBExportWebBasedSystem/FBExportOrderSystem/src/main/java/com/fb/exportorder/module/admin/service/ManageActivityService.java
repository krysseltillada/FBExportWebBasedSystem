package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;

public interface ManageActivityService {
	public List<Activity> getCustomerActivitiesById(long customerId);
}
