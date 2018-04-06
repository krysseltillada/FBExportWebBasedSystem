package com.fb.exportorder.module.admin.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value="/admin/edit-system-settings", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	public String editSystemSettings(String systemBackupTimeInput,
									 String systemLogoutTime,
									 @RequestParam("sqlfile") MultipartFile sqlfile,
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
			
			String result = systemSettingsService.uploadFile(sqlfile);
			if(!result.equals("Success")) {
				redirectAttributes.addFlashAttribute("ErrorSettings", result);
				return "redirect:/admin/system-settings";
			} else {
				systemLog(name + " import the import database file " + sqlfile.getOriginalFilename() , ActionType.SETTINGS);
			}
		} catch (ParseException e) {
			redirectAttributes.addFlashAttribute("ErrorSettings", e.getMessage());
			return "redirect:/admin/system-settings";
		}
		
		redirectAttributes.addFlashAttribute("SuccessSettings", "You've successfully changed your system settings");
		
		return "redirect:/admin/system-settings";
	}
	
	@RequestMapping(value="/admin/restore-data", method=RequestMethod.POST)
	@ResponseBody
	public String restoreData() {
		return systemSettingsBackup.restoreData();
	}
	
	@RequestMapping(value="/admin/backup-data", method=RequestMethod.POST)
	@ResponseBody
	public String backupData() {
		return systemSettingsBackup.backupData("fbexport");
	}
	
	@RequestMapping(value="/admin/export/backup")
    public void downloadPDFResource( HttpSession httpSession,
                                     HttpServletResponse response){
		
		String name = (String)httpSession.getAttribute("employeeName");
        
		Path file = FileSystems.getDefault().getPath("src\\main\\webapp\\system-backup\\fbexport_backup.sql");
        
        response.setContentType("text/plain");
        response.addHeader("Content-Disposition", "attachment; filename=fbexport_backup.sql");
        try
        {
        	systemLog(name + " export database", ActionType.SETTINGS);
        	
            Files.copy(file, response.getOutputStream());
            response.getOutputStream().flush();
        }
        catch (IOException ex) {}
    }
	
	private void systemLog(String description, ActionType actionType) {
		SystemLog systemLog = new SystemLog();
		
		systemLog.setActionType(actionType);
		systemLog.setDescription(description);
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		
		systemLogService.addSystemLog(systemLog);
	}
}
