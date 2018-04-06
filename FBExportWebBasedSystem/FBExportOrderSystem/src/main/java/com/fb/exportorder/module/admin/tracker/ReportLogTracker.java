package com.fb.exportorder.module.admin.tracker;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.models.enums.ActionType;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.service.ManageEmployeeService;
import com.fb.exportorder.module.admin.service.NotificationService;
import com.fb.exportorder.module.admin.service.SystemLogService;
import com.fb.exportorder.module.admin.session.EmployeeSessionBean;

@Aspect
public class ReportLogTracker {
	
	@Autowired
	@Qualifier("AdminNotificationService")
	private NotificationService notificationService;
	
	@Autowired
	private EmployeeSessionBean employeeSessionBean;
	
	@Autowired(required=false)
	private ManageEmployeeService manageEmployeeService;
	
	@Autowired
	private SystemLogService systemLogService;
	
	@After("execution(public void com.fb.exportorder..service.SystemSettingsService+.addSystemSettings(..))")
	void detectSystemEditSettings (JoinPoint joinPoint) {
		
		if (Objects.nonNull(employeeSessionBean)) { 
		
			SystemSettings systemSettings = (SystemSettings)joinPoint.getArgs()[0];
			
			Employee employee = manageEmployeeService.getEmployeeById(employeeSessionBean.getEmployeeId());
			
			SimpleDateFormat formatSystemBackupTime = new SimpleDateFormat("hh:mm a");
			SimpleDateFormat formatLogoutTime = new SimpleDateFormat("mm");
			
			SystemLog systemLog = new SystemLog();
			systemLog.setActionType(ActionType.SETTINGS);
			systemLog.setTimeOccured(new Date());
			systemLog.setDateOccured(new Date());
			systemLog.setDescription(employee.getFirstname() + " "  + employee.getLastname() + 
									 " change the system backup time to " + formatSystemBackupTime.format(systemSettings.getSystemBackupTime()) + 
									 " and logout time to " + formatLogoutTime.format(systemSettings.getLogoutTime()) + " minutes");
			
			systemLogService.addSystemLog(systemLog);
			
			SystemNotification systemNotification = new SystemNotification();
			
			systemNotification.setHeader("System Settings Update");
			systemNotification.setDescription("Update system settings success");
			systemNotification.setSeen(false);
			systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
			systemNotification.setDate(new Date());
			
			notificationService.pushNotification(systemNotification);
			
		} 
		
	}
	
	@After("execution(public String com.fb.exportorder.utilities.SystemSettingsBackup.backupData(..))")
	void detectSystemBackup (JoinPoint joinPoint) {
		
		Employee employee = manageEmployeeService.getEmployeeById(employeeSessionBean.getEmployeeId());
		
		SystemLog systemLog = new SystemLog();
		systemLog.setActionType(ActionType.SETTINGS);
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		systemLog.setDescription(employee.getFirstname() + " " + employee.getLastname() + " backup the database");
		
		systemLogService.addSystemLog(systemLog);
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("System Backup");
		systemNotification.setDescription("System backup success");
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	
	@After("execution(public String com.fb.exportorder.utilities.SystemSettingsBackup.restoreData())")
	void detectSystemRestore (JoinPoint joinPoint) {
		
		Employee employee = manageEmployeeService.getEmployeeById(employeeSessionBean.getEmployeeId());
		
		SystemLog systemLog = new SystemLog();
		systemLog.setActionType(ActionType.SETTINGS);
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		systemLog.setDescription(employee.getFirstname() + " " + employee.getLastname() + " restore the database");
		
		systemLogService.addSystemLog(systemLog);
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("System Restore");
		systemNotification.setDescription("System restore success");
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
		
	}

}
