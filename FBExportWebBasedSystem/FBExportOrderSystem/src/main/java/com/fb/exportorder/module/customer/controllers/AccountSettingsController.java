package com.fb.exportorder.module.customer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountSettingsController {
	
	@RequestMapping("/account-settings")
	public String accountSettings() {
		return "account-settings";
	}

}
