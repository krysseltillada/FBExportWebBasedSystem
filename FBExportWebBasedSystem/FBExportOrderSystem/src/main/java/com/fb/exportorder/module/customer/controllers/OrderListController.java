package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderListController {
	
	@RequestMapping("/order-list")
	public String orderList () {
		return "order-list";
	}

}
