package com.fb.exportorder.module.customer.service;

import java.util.List;
import java.util.Map;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.customer.Order;

public interface CustomerService {
	Customer getCustomerById(long customerId);
	void addCustomerActivity(Activity activity, Customer customer);
	List<Activity> getCustomerActivitiesById(long customerId, int records, int offset);
	void deleteActivityByActivityId(long customerId, long activityId);
	void deleteAllActivity(long customerId, String jsonDeleteDataIds);
	long addToCart(Item item, long customerId);
	void removeToCart(Item item, long customerId);
	Item getItemById(long id);
	List<Order> getOrdersByCustomerId(int pageNumber, long customerId);
	int getOrderCountByCustomerId(long customerId);
	void saveCustomer(Customer customer);
	Map<Boolean, Integer> getOnlineUsersCount();
	void addNotificationToCustomer(Notification notification, Customer customer);
	List<Notification> getCustomerNotificationsById(long customerId, int records, int offset);
	List<Notification> getNotificationsByCustomerId(long customerId);
	void deleteNotificationByNotificationId(long customerId, long notificationId);
	void deleteAllNotification(long customerId, String jsonDeleteDataIds);
}
