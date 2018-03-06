package com.fb.exportorder.module.admin.controllers;

import java.io.File;
import java.nio.file.FileSystems;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.module.admin.service.SystemSettingsService;
import com.fb.exportorder.utilities.SystemSettingsBackup;

@Controller
public class SystemSettingsController {
	
	@Autowired
	SystemSettingsService systemSettingsService;
	
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
		
		return "system-settings";
	}
	
	@RequestMapping(value="/admin/edit-system-settings", method=RequestMethod.POST)
	@ResponseBody
	public String editSystemSettings(String systemBackupTimeInput, String systemLogoutTime, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			
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
			
			session.setAttribute("logoutTime", logoutTime.getMinutes());
		
		} catch (ParseException e) {
			return "Error";
		}
		
		return "Success";
	}
	
	@RequestMapping(value="/admin/restore-data", method=RequestMethod.POST)
	@ResponseBody
	public String restoreData() {
		SystemSettingsBackup backup = new SystemSettingsBackup();
		return backup.restoreData();
	}
	
	@RequestMapping(value="/admin/backup-data", method=RequestMethod.POST)
	@ResponseBody
	public String backupData() {
		SystemSettingsBackup backup = new SystemSettingsBackup();
		return backup.backupData("fbexport");
	}
}
