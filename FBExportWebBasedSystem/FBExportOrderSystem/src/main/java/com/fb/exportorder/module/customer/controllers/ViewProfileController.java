package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class ViewProfileController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/view-profile")
	public String viewProfile (@RequestParam String customerId, Model model, HttpSession session) {
		
		long lcustomerId = Long.parseLong(customerId);
		long currentCustomerId = (long)session.getAttribute("customerId");
		
		if (lcustomerId == currentCustomerId) {
			
			model.addAttribute(customerService.getCustomerById(lcustomerId));
			model.addAttribute(customerService.getCustomerActivitiesById(lcustomerId, 0, 5));
			
			return "view-profile";
		}
		
		return "customer/page-not-found";
		
	}
	
	@RequestMapping(value = "/see-more-activities", method = RequestMethod.POST)
	public @ResponseBody 
		   List<Activity> seeMoreActivities(@RequestParam String customerId,
				   							@RequestParam String pageNumber) {
		
			long lcustomerId = Long.parseLong(customerId);
			int ipageNumber = Integer.parseInt(pageNumber);
		
			return customerService.getCustomerActivitiesById(lcustomerId, ipageNumber, 5);
		
	}

}
