package com.fb.exportorder.module.customer.controllers;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class ViewCartController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/view-cart", method=RequestMethod.GET)
	public String viewProduct() {
		return "view-cart";
	}
	
	@RequestMapping(value="/update-view-cart", method=RequestMethod.POST)
	@ResponseBody
	public String viewProductUpdate(@RequestBody String updateInfo, HttpServletRequest request) {
		return customerService.updateCart(updateInfo, (Long)request.getSession().getAttribute("customerId"));
	}
}
