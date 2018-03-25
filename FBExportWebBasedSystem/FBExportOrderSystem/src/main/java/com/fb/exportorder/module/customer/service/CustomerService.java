package com.fb.exportorder.module.customer.service;

import java.util.List;
import java.util.Map;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.customer.Order;

public interface CustomerService {
	public Customer getCustomerById(long customerId);
	public List<Activity> getCustomerActivitiesById(long customerId, int records, int offset);
	public void deleteActivityByActivityId(long customerId, long activityId);
	public void deleteAllActivity(long customerId, String jsonDeleteDataIds);
	public long addToCart(Item item, long customerId);
	public void removeToCart(Item item, long customerId);
	public Item getItemById(long id);
	public List<Order> getOrdersByCustomerId(int pageNumber, long customerId);
	public int getOrderCountByCustomerId(long customerId);
	public void saveCustomer(Customer customer);
	public Map<Boolean, Integer> getOnlineUsersCount();
	public void addNotificationToCustomer(Notification notification, Customer customer);
	public List<Notification> getCustomerNotificationsById(long customerId, int records, int offset);
}
