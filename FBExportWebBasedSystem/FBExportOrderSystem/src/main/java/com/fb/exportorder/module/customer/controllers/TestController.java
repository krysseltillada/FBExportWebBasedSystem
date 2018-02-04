package com.fb.exportorder.module.customer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.Gender;
import com.fb.exportorder.module.customer.repository.AccountRepository;

@Controller
public class TestController {
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String save(Model model) {
		System.out.println("run");
		
		
		
		
		return "manage-accounts";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String testRequest(Model model) {
		System.out.println("run");
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		System.out.println("run");
		return "login";
	}
	
	@RequestMapping(value = "/yay", method = RequestMethod.GET)
	public String yay(Model model) {
		System.out.println("run");
		return "home";
	}
	
	
}
