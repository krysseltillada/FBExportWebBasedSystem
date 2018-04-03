package com.fb.exportorder.module.admin.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.ScheduledTasks;
import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.models.enums.ActionType;
import com.fb.exportorder.module.admin.service.SystemLogService;
import com.fb.exportorder.module.admin.service.SystemSettingsService;
import com.fb.exportorder.utilities.SystemSettingsBackup;
import com.fb.exportorder.utilities.Time;

@Controller
public class SystemSettingsController {
	
	@Autowired
	private SystemSettingsService systemSettingsService;
	
	@Autowired
	private SystemSettingsBackup systemSettingsBackup;
	
	@Autowired
	private SystemLogService systemLogService;
	
	@RequestMapping("/admin/system-settings")
	public String systemSettings(Model model) {
		
		if(systemSettingsService.findAll().isEmpty())
			systemSettingsService.addSystemSettings(new SystemSettings());
		
		SystemSettings systemSettings = systemSettingsService.findAll().get(0);
		
		long systemBackupTime = systemSettings.getSystemBackupTime().getTime();
		SimpleDateFormat timeFormat = new SimpleDateFormat("hh-mm-ss-aa");
		String formattedTime = timeFormat.format(systemBackupTime).toString();
		
		String[] timeSplit = formattedTime.split("-");
		
		model.addAttribute("systemSettings", timeSplit);
		model.addAttribute("logoutTime", systemSettings.getLogoutTime().getMinutes());
		model.addAttribute("isBackupFileExist",systemSettingsService.isSystemBackupFileExist("src\\main\\webapp\\system-backup\\fbexport_backup.sql"));
		System.out.println(systemSettingsService.isSystemBackupFileExist("src\\main\\webapp\\system-backup\\fbexport_backup.sql"));
		return "system-settings";
	}
	
	@RequestMapping(value="/admin/edit-system-settings", method=RequestMethod.POST)
	public String editSystemSettings(String systemBackupTimeInput,
									 String systemLogoutTime,
									 HttpServletRequest request,
									 RedirectAttributes redirectAttributes) {
		try {
			HttpSession session = request.getSession();
			
			String name = (String)session.getAttribute("employeeName");
			
			SystemSettings systemSettings = systemSettingsService.findAll().get(0);
			
			Date logoutTime = new Date();
			logoutTime.setHours(0);
			logoutTime.setMinutes(Integer.parseInt(systemLogoutTime));
			logoutTime.setSeconds(0);
			
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm aa");
			Date systemBackupTime = timeFormat.parse(systemBackupTimeInput);
			
			systemSettings.setLogoutTime(logoutTime);
			systemSettings.setSystemBackupTime(systemBackupTime);
			
			systemSettingsService.addSystemSettings(systemSettings);
			
			session.setAttribute("logoutTime", Time.convertTimeToMilliseconds(logoutTime.getHours(), logoutTime.getMinutes(), logoutTime.getSeconds()));

			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
			ScheduledTasks.formattedTime = dateFormat.format(systemSettings.getSystemBackupTime().getTime());
		
			SystemLog systemLog = new SystemLog(); 
			
			systemLog.setActionType(ActionType.SETTINGS);
			systemLog.setDescription(name + " change the system backup time to " + systemBackupTimeInput + " and logout time to " + systemLogoutTime + " minutes");
			systemLog.setTimeOccured(new Date());
			systemLog.setDateOccured(new Date());

			systemLogService.addSystemLog(systemLog);
			
		} catch (ParseException e) {
			return "Error";
		}
		
		redirectAttributes.addFlashAttribute("SuccessSettings", "You've successfully changed your system settings");
		
		return "redirect:/admin/system-settings";
	}
	
	@RequestMapping(value="/admin/restore-data", method=RequestMethod.POST)
	@ResponseBody
	public String restoreData(HttpSession httpSession) {
		
		String name = (String)httpSession.getAttribute("employeeName");
		
		String message = systemSettingsBackup.restoreData();
		
		SystemLog systemLog = new SystemLog();
		
		systemLog.setActionType(ActionType.SETTINGS);
		systemLog.setDescription(name + " restored the backup");
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		
		systemLogService.addSystemLog(systemLog);
		
		return message;
	}
	
	@RequestMapping(value="/admin/backup-data", method=RequestMethod.POST)
	@ResponseBody
	public String backupData(HttpSession httpSession) {
		
		String name = (String)httpSession.getAttribute("employeeName");
		
		String message = systemSettingsBackup.backupData("fbexport");
		
		SystemLog systemLog = new SystemLog();
		
		systemLog.setActionType(ActionType.SETTINGS);
		systemLog.setDescription(name + " backup the system");
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		
		systemLogService.addSystemLog(systemLog);
		
		return message;
	}
}
