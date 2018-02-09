package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
	
	@RequestMapping("/about-us")
	public String aboutUs() {
		return "about-us";
	}

}
