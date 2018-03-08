package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class OrderListController {
	
	@Autowired
	CustomerService customerService;
	
	private static final int ORDER_ITEMS_COUNT = 5;
	
	@RequestMapping("/order-list")
	public String orderList (Model model, 
							 HttpSession session, 
							 @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber) {
		
		long customerId = (long)session.getAttribute("customerId");
		
		List<Order> orderList = customerService.getOrdersByCustomerId(pageNumber, customerId);
		
		model.addAttribute("currentPageCount", pageNumber);
		model.addAttribute("pageNumber", (int)(customerService.getOrderCountByCustomerId(customerId) / ORDER_ITEMS_COUNT));
		model.addAttribute(orderList);
		
		return "order-list";
	}

}
