package com.fb.exportorder.module.customer.service;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Notification;

public interface NotificationService {
	void pushNotification(Notification notification, Customer customer); 
	void seenNotification(long notificationId);
}
