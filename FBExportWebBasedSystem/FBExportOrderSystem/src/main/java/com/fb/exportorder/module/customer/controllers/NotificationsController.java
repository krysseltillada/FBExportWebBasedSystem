package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class NotificationsController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/notifications")
	public String notification(Model model, HttpSession session) {
		
		long currentCustomerId = (long)session.getAttribute("customerId");
		
		model.addAttribute(customerService.getCustomerNotificationsById(currentCustomerId, 5, 0));
		
		
		return "notifications";
	}
	
	
}
