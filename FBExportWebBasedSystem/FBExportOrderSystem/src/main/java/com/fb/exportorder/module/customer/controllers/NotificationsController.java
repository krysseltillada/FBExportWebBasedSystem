package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotificationsController {

	@RequestMapping("/notifications")
	public String notification() {
		return "notifications";
	}
	
	
}
