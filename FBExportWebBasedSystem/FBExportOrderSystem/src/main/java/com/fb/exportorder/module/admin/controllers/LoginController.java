package com.fb.exportorder.module.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("adminLoginController")
public class LoginController {
	
	@RequestMapping(value = "/admin/login", params={"errorMessage"})
	public String loginError (@RequestParam String errorMessage,
							  Model model) {
		
		model.addAttribute("loginErrorMessage", errorMessage);

		return "admin-login";
	}
	
	@RequestMapping("/admin/login")
	public String login() {
		return "admin-login";
	}
	
	@RequestMapping("/admin")
	public String indexLogin() {
		return login();
	}

}
