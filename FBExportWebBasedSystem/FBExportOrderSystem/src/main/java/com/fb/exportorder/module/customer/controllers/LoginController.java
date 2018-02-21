package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("customerLoginController")
public class LoginController {
	
	@RequestMapping("/login")
	public String login (HttpServletRequest request, Model model) {
		model.addAttribute("loginErrorMessage", "");
		return "login";
	}
	
	@RequestMapping(value = "/login", params={"errorMessage"})
	public String loginError (@RequestParam String errorMessage,
							  Model model) {
		
		model.addAttribute("loginErrorMessage", errorMessage);

		return "login";
	}
	
}
