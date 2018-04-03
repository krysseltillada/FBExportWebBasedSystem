package com.fb.exportorder.module.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.module.admin.service.NotificationService;

@Controller
public class SystemNotificationController {
	
	@Autowired
	@Qualifier("AdminNotificationService")
	private NotificationService notificationService;
	
	@RequestMapping("/admin/showAllNotification")
	@ResponseBody
	public List<SystemNotification> showAllNotification(@RequestParam int record,
												  		@RequestParam int offset,
												  		HttpSession session) {
		
		long employeeId = (long)session.getAttribute("employeeId");
		
		List<SystemNotification> systemNotificationList = notificationService.getAllNotificationByEmployeeId(employeeId, record, offset);
		
		for(SystemNotification systemNotification : systemNotificationList)
			notificationService.seenNotification(systemNotification.getNotificationId());
		
		return systemNotificationList;
		
	}
	
	@RequestMapping("/admin/showNotificationList")
	@ResponseBody
	public List<SystemNotification> showAllNotification(HttpSession session) {
	
		long employeeId = (long)session.getAttribute("employeeId");
		
		List<SystemNotification> systemNotificationList = notificationService.getAllNotificationByEmployeeId(employeeId);
		
		for(SystemNotification systemNotification : systemNotificationList) {
			notificationService.seenNotification(systemNotification.getNotificationId());
			systemNotification.setSeen(true);
		}
		
		return systemNotificationList;
	
	}
	
	@RequestMapping("/admin/seenAllNotification")
	@ResponseBody
	public String seenAllNotification(@RequestParam String notificationJSONRawIds) {
		
		try {
			
			JSONArray notificationJSONIds = (JSONArray)new JSONParser().parse(notificationJSONRawIds);
			
			for (int i = 0; i != notificationJSONIds.size(); ++i) 
				notificationService.seenNotification((Long)notificationJSONIds.get(i));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "";
		
	}

}
