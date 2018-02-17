package com.fb.exportorder.module.customer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class JSONModelResponseController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/get-customer", method = RequestMethod.GET)
	@ResponseBody
	public Customer getCustomer(String customerId) {
		return customerService.getCustomerById(Long.parseLong(customerId));
	}
}
