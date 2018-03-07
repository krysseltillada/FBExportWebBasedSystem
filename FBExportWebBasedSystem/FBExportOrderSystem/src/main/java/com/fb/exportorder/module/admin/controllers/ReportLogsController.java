package com.fb.exportorder.module.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportLogsController {
	
	@RequestMapping("/admin/report-logs")
	public String reportLogs() {
		return "report-logs";
	}
}
