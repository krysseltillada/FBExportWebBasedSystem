package com.fb.exportorder.module.customer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.module.customer.service.EmailService;

@Controller
public class ContactUsController {
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/contact-us")
	public String contactUs() {
		return "contact-us";
	}
	
	@RequestMapping(value="/contact-us-email", method=RequestMethod.POST)
	@ResponseBody
	public String contactUsEmail(String contactName,
								 String contactSubject,
								 String contactEmail,
								 String contactMessage) {
		
		return emailService.contactUs(contactName, "fongbrosinc@gmail.com", "[Customer Service] - " + contactEmail, contactMessage);
	}
	
}
