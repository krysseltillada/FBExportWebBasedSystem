package com.fb.exportorder.module.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrdersController {
	
	//TODO make the order management module
	
	@RequestMapping("/admin/orders")
	public String orders() {
		return "orders";
	}

}
