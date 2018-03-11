package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class OrderListController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;
	
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
	
	@RequestMapping("/order-list/markCancelled")
	@ResponseBody
	public String markCancelled(@RequestParam String orderId,
								@RequestParam String reason) {
		
		orderService.markCancelled(orderService.getOrderById(Long.parseLong(orderId)), 
								   reason);
		
		
		return "";
	}
	
	@RequestMapping("/order-list/markPaid")
	@ResponseBody
	public String markPaid(@RequestParam String orderId) {
		
		orderService.markPaid(orderService.getOrderById(Long.parseLong(orderId)));
		
		return "";
	}
	
	@RequestMapping("/order-list/reorder")
	@ResponseBody
	public String reorder(@RequestParam String orderId) {
		
		orderService.reOrder(orderService.getOrderById(Long.parseLong(orderId)));
		
		return "";
	}
	

}
