package com.fb.exportorder.module.admin.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.OrderService;
import com.fb.exportorder.module.customer.service.ProductService;

@Controller
public class DashboardController {
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/admin/dashboard")
	public String dashboard(Model model) {
		
		model.addAttribute("orderCount", orderService.getOrderCount());
		model.addAttribute("latestOrders",orderService.getLatestOrders());
		model.addAttribute("paidOrders",orderService.getPaidOrders());
		
		model.addAttribute("mostRatedProduct",productService.getTopThreeMostRatedProduct());
		model.addAttribute("mostViewedProduct",productService.getTopThreeMostViewedProduct());
		model.addAttribute("mostPaidProduct",productService.getTopPaidProduct());
		
		model.addAttribute("onlineUsers", customerService.getOnlineUsersCount());
		
		return "dashboard";
	}
}
