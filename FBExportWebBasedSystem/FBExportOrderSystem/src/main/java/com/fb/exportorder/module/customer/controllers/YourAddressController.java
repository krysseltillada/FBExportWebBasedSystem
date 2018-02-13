package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.module.customer.service.YourAddressService;

@Controller
public class YourAddressController {

	@Autowired
	YourAddressService yourAddressService;
	
	@RequestMapping("/your-address")
	public String yourAddress(Model model, HttpSession session) {
		model.addAttribute(yourAddressService.getAllAddressesById((long)session.getAttribute("customerId")));
		return "your-address";
	}
	
}
