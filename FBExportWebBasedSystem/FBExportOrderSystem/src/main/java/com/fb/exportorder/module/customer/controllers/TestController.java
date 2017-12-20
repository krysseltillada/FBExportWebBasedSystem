package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String testRequest(Model model) {
		System.out.println("run");
		return "home";
	}
	
	@RequestMapping(value = "/products") 
	public String products() {
		return "products";
	}
	
}
