package com.fb.exportorder;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.models.enums.ActionType;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.service.NotificationService;
import com.fb.exportorder.module.admin.service.SystemLogService;
import com.fb.exportorder.module.admin.service.SystemSettingsService;
import com.fb.exportorder.utilities.SystemSettingsBackup;

@Component
public class ScheduledTasks {
	
	@Autowired
	SystemSettingsService systemSettingsService;
	
	@Autowired
	private SystemLogService systemLogService;
	
	@Autowired
	private SystemSettingsBackup backup;
	
	@Autowired
	@Qualifier("AdminNotificationService")
	private NotificationService notificationService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
	private SystemSettings settings;
	public static String formattedTime = "";
	
	
	
    @Scheduled(fixedRate = 60000)
    public void reportCurrentTime() {
    	
    	if(ScheduledTasks.formattedTime.equals("")) {
    		if(systemSettingsService.findAll().size() == 0) {
    			settings = new SystemSettings();
    			
        		Date backupTime = new Date();
        		backupTime.setHours(0);
        		backupTime.setMinutes(0);
        		backupTime.setSeconds(0);
        		settings.setSystemBackupTime(backupTime);
        	   
        		
        	   
        		Date logoutTime = new Date();
        		logoutTime.setHours(0);
        		logoutTime.setMinutes(3);
        		logoutTime.setSeconds(0);
        		settings.setLogoutTime(logoutTime);
        		
        		systemSettingsService.addSystemSettings(settings);
        	}
    		
        	settings = systemSettingsService.findAll().get(0);
        	ScheduledTasks.formattedTime = dateFormat.format(settings.getSystemBackupTime().getTime());
    	}
    	
    	String currentTime = dateFormat.format(Calendar.getInstance().getTime());
    	if(formattedTime.equals(currentTime)) {
    		System.out.println("system backup");
    		backup.backupDataCron("fbexport");
    		
    		SystemLog systemLog = new SystemLog();
    		systemLog.setActionType(ActionType.SETTINGS);
    		systemLog.setTimeOccured(new Date());
    		systemLog.setDateOccured(new Date());
    		systemLog.setDescription("Automatic backup database");
    		
    		systemLogService.addSystemLog(systemLog);
    		
    		SystemNotification systemNotification = new SystemNotification();
    		
    		systemNotification.setHeader("System Backup");
    		systemNotification.setDescription("System backup success");
    		systemNotification.setSeen(false);
    		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.SYSTEM_BACKUP);
    		systemNotification.setDate(new Date());
    		
    		notificationService.pushNotification(systemNotification);
    		
    	}

    }
}
