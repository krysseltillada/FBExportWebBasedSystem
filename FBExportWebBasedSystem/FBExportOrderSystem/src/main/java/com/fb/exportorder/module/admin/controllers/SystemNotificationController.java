package com.fb.exportorder.module.admin.controllers;

import java.util.List;

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
	NotificationService notificationService;
	
	@RequestMapping("/admin/showAllNotification")
	@ResponseBody
	public List<SystemNotification> showAllNotification(@RequestParam int record,
												  		@RequestParam int offset) {
		
		return notificationService.getAllNotification(record, offset);
		
	}

}
