package com.fb.exportorder.module.admin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class DashboardController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/admin/dashboard")
	public String dashboard(Model model) {
		
		model.addAttribute("orderCount", orderService.getOrderCount());
		
		return "dashboard";
	}
}
