package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactUsController {

	@RequestMapping("/contact-us")
	public String contactUs() {
		return "contact-us";
	}
	
}
