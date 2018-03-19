package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller("customerSignOutController")
public class SignOutController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/sign-out")
	public String signOut (HttpSession session, 
						   HttpServletRequest request,
						   HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext()
												   .getAuthentication();
		
		if (auth != null) {
			if(session.getAttribute("customerUsername") != null) {
				Customer customer = customerService.getCustomerById(Long.parseLong(session.getAttribute("customerId").toString()));
				customer.setOnline(false);
				customerService.saveCustomer(customer);
			}
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
	}
	
}
