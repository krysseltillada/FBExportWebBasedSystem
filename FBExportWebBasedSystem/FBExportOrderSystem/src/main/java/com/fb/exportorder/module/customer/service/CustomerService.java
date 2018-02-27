package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;

public interface CustomerService {
	public Customer getCustomerById(long customerId);
	public List<Activity> getCustomerActivitiesById(long customerId, int records, int offset);
	public void deleteActivityByActivityId(long customerId, long activityId);
	public void deleteAllActivity(long customerId, String jsonDeleteDataIds);
	public long addToCart(Item item, long customerId);
	public void removeToCart(Item item, long customerId);
	public Item getItemById(long id);
}
