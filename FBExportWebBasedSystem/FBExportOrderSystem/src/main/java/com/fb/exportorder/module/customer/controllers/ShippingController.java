package com.fb.exportorder.module.customer.controllers;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class ShippingController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/shipping")
	public String shipping(@RequestParam(name="orderId", required=false) String orderId,
										 Model model) {
		
		if (!StringUtils.isBlank(orderId)) {
			model.addAttribute(orderService.getOrderById(Long.parseLong(orderId)));
		}
		
		return "shipping";
	}

}
