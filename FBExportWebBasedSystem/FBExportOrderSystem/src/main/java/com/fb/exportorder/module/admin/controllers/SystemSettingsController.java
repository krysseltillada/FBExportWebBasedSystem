package com.fb.exportorder.module.admin.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.module.admin.service.SystemSettingsService;

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
}
