package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class OrderListController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/order-list")
	public String orderList (Model model, HttpSession session) {
		
		model.addAttribute(customerService.getCustomerById((long)session.getAttribute("customerId"))
																		.getOrders());
		
		return "order-list";
	}

}
