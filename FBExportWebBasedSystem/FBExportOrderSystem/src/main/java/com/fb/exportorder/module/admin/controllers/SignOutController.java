package com.fb.exportorder.module.admin.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.module.admin.service.ManageEmployeeService;

@Controller("adminSignOutController")
public class SignOutController {
	
	@Autowired
	private ManageEmployeeService employeeService;
	
	@RequestMapping("/admin/sign-out")
	public String signOut (HttpSession session, 
						   HttpServletRequest request,
						   HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext()
												   .getAuthentication();
		
		if (auth != null) {
			if(session.getAttribute("employeeUsername") != null) {
				Employee employee = employeeService.getEmployeeByUsername(session.getAttribute("employeeUsername").toString());
				employee.setOnline(false);
				employeeService.saveEmployee(employee);
			}
			
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/admin/login";
	}
	
}
