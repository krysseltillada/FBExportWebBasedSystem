package com.fb.exportorder.module.admin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class OrdersController {
	
	//TODO make the order management module
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/admin/orders")
	public String orders(Model model) {
		
		model.addAttribute(orderService.getAllOrders());
		
		return "orders";
	}

}
