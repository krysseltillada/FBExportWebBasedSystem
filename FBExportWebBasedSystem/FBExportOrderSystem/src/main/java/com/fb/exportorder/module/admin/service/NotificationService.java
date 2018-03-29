package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.SystemNotification;

public interface NotificationService {
	
	void pushNotification(SystemNotification notification);
	
	void seenNotification(long notificationId);
	
	List<SystemNotification> getAllNotificationByEmployeeId(long employeeId, int record, int offset);
	
	List<SystemNotification> getAllNotificationByEmployeeId(long employeeId);

}
