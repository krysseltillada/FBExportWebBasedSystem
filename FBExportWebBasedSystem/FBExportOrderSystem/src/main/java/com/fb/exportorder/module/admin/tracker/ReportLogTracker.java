package com.fb.exportorder.module.admin.tracker;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.service.NotificationService;

@Aspect
public class ReportLogTracker {
	
	@Autowired
	@Qualifier("AdminNotificationService")
	private NotificationService notificationService;
	
	@After("execution(public void com.fb.exportorder..service.SystemSettingsService+.addSystemSettings(..))")
	void detectSystemEditSettings (JoinPoint joinPoint) {
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("System Settings Update");
		systemNotification.setDescription("Udpdate system settings success");
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
	}
	
//	@After("execution(public String com.fb.exportorder.utilities.SystemSettingsBackup.backupData(..))")
//	void detectSystemBackup (JoinPoint joinPoint) {
//		
//		SystemNotification systemNotification = new SystemNotification();
//		
//		systemNotification.setHeader("System Backup");
//		systemNotification.setDescription("System backup success");
//		systemNotification.setSeen(false);
//		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
//		systemNotification.setDate(new Date());
//		
//		notificationService.pushNotification(systemNotification);
//	}
//	
//	@After("execution(public String com.fb.exportorder.utilities.SystemSettingsBackup.restoreData())")
//	void detectSystemRestore (JoinPoint joinPoint) {
//SystemNotification systemNotification = new SystemNotification();
//		
//		systemNotification.setHeader("System Restore");
//		systemNotification.setDescription("System restore success");
//		systemNotification.setSeen(false);
//		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
//		systemNotification.setDate(new Date());
//		
//		notificationService.pushNotification(systemNotification);
//	}

}
