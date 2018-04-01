package com.fb.exportorder.module.admin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.admin.service.SystemLogService;
import com.fb.exportorder.module.admin.service.UserAccessLogService;

@Controller
public class ReportLogsController {
	
	@Autowired
	private SystemLogService systemLogService;
	
	@Autowired
	private UserAccessLogService userAccessLogService;
	
	@RequestMapping("/admin/report-logs")
	public String systemLogs(Model model) {

		model.addAttribute(systemLogService.getAllSystemLog());
		
		return "report-logs/system-logs";
	}
	
	@RequestMapping("/admin/report-logs/user-access-logs")
	public String userAccessLogs(Model model) {
		
		model.addAttribute(userAccessLogService.getAllUserAccessLog());
		
		return "report-logs/user-access-logs";
	}
	
}
