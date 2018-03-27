package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.SystemNotification;

public interface NotificationService {
	
	void pushNotification(SystemNotification notification);
	List<SystemNotification> getAllNotification(int record, int offset);

}
