package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.NotificationService;

@Controller
public class NotificationsController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	@Qualifier("CustomerNotificationService")
	private NotificationService notificationService;
	
	@RequestMapping("/notifications")
	public String notification(Model model, HttpSession session) {
		
		long currentCustomerId = (long)session.getAttribute("customerId");
		
		model.addAttribute(customerService.getCustomerNotificationsById(currentCustomerId, 5, 0));
		
		
		return "notifications";
	}
	
	@RequestMapping(value = "/see-more-notifications", method = RequestMethod.POST)
	public @ResponseBody List<Notification> seeMoreNotifications(@RequestParam  String customerId,
																 @RequestParam  String pageCount) {
		
		System.out.println(pageCount + " page count");
		
		long lcustomerId = Long.parseLong(customerId);
		int ipageCount = Integer.parseInt(pageCount);
		
		List<Notification> notificationList = customerService.getCustomerNotificationsById(lcustomerId, 5, ipageCount);
		
		for (Notification notification : notificationList)
			notificationService.seenNotification(notification.getNotificationId());
		
		return notificationList;
		
	}
	
	@RequestMapping(value = "/delete-notification", method = RequestMethod.POST)
	public @ResponseBody
		   String deleteActivity (@RequestParam String notificationId,
				   				  @RequestParam String customerId) {
			
			customerService.deleteNotificationByNotificationId(Long.parseLong(customerId), 
													   		   Long.parseLong(notificationId));
		
			return "";
			
	}
	
	@RequestMapping(value = "/delete-all-notification", method = RequestMethod.POST)
	public @ResponseBody
		   String deleteActivity (String deleteData, HttpSession session) {
			
			customerService.deleteAllNotification((long) session.getAttribute("customerId"), deleteData);
		
			return "";
	}
	
	
}
