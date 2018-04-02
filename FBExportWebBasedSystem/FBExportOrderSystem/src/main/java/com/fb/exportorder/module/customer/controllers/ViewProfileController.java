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
	private CustomerService customerService;
	
	@RequestMapping("/view-profile")
	public String viewProfile (Model model, HttpSession session) {
		
		long currentCustomerId = (long)session.getAttribute("customerId");
			
		model.addAttribute(customerService.getCustomerById(currentCustomerId));
		model.addAttribute(customerService.getCustomerActivitiesById(currentCustomerId, 5, 0));
		
		return "view-profile";
		
	}
	
	@RequestMapping(value = "/see-more-activities", method = RequestMethod.POST)
	public @ResponseBody 
		   List<Activity> seeMoreActivities(@RequestParam String customerId,
				   							@RequestParam String pageCount) {
		
			long lcustomerId = Long.parseLong(customerId);
			int ipageCount = Integer.parseInt(pageCount);
			
			return customerService.getCustomerActivitiesById(lcustomerId, 5, ipageCount);
		
	}
	
	@RequestMapping(value = "/delete-activity", method = RequestMethod.POST)
	public @ResponseBody
		   String deleteActivity (@RequestParam String activityId,
				   				  @RequestParam String customerId) {
			
			customerService.deleteActivityByActivityId(Long.parseLong(customerId), 
													   Long.parseLong(activityId));
		
			return "";
	}
	
	@RequestMapping(value = "/delete-all-activity", method = RequestMethod.POST)
	public @ResponseBody
		   String deleteActivity (String deleteData) {
			
			customerService.deleteAllActivity(1, deleteData);
		
			return "";
	}


}
