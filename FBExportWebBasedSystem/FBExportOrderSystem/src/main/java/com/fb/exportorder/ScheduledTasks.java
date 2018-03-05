package com.fb.exportorder;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.module.admin.service.SystemSettingsService;
import com.fb.exportorder.utilities.SystemSettingsBackup;

@Component
public class ScheduledTasks {
	
	@Autowired
	SystemSettingsService systemSettingsService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
	private SystemSettingsBackup backup = new SystemSettingsBackup();
	private SystemSettings settings;
	
    @Scheduled(fixedRate = 59000)
    public void reportCurrentTime() {
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
    	
    	String formattedTime = dateFormat.format(settings.getSystemBackupTime().getTime());
    	String currentTime = dateFormat.format(Calendar.getInstance().getTime());
    	if(formattedTime.equals(currentTime))
    		backup.backupData("fbexport");
    	
    }
}
