package com.fb.exportorder.module.customer.tracker;

import java.util.Date;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.NotificationService;
import com.fb.exportorder.module.customer.service.OrderService;

@Aspect
public class OrderNotificationTracker {
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;
	
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markApproved(..))")
	public void detectApprovedOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		
		Notification approveNotification = new Notification();
		
		approveNotification.setOrderId(order.getOrderId());
		approveNotification.setHeader("Order Approved");
		approveNotification.setDescription("Your Order# " + order.getOrderId() + " is approved");
		approveNotification.setSeen(false);
		approveNotification.setDate(new Date());
		
		notificationService.pushNotification(approveNotification,
											 order.getCustomer());
		
		
		System.out.println("track approved order for customer: " + order.getCustomer().getId());
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markRejected(..))")
	public void detectRejectedOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		
		Notification rejectedNotification = new Notification();
		
		rejectedNotification.setOrderId(order.getOrderId());
		rejectedNotification.setHeader("Order Rejected");
		rejectedNotification.setDescription("Your Order# " + order.getOrderId() + " is rejected");
		rejectedNotification.setSeen(false);
		rejectedNotification.setDate(new Date());
		
		notificationService.pushNotification(rejectedNotification,
											 order.getCustomer());
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markToShip(..))")
	public void detectToShipOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		
		Notification toShipNotification = new Notification();
		
		toShipNotification.setOrderId(order.getOrderId());
		toShipNotification.setHeader("Order To Shipping");
		toShipNotification.setDescription("Your Order# " + order.getOrderId() + " is Shipping");
		toShipNotification.setSeen(false);
		toShipNotification.setDate(new Date());
		
		notificationService.pushNotification(toShipNotification,
											 order.getCustomer());
		
	}
	
	@After("execution(public java.util.List<String> com.fb.exportorder..service.OrderService+.addToShipInformation(..))")
	public void detectAddToShipInformationOrder(JoinPoint joinPoint) {
		
		long orderId = (long)joinPoint.getArgs()[0];
		
		Notification addToShipInformationNotification = new Notification();
		
		addToShipInformationNotification.setOrderId(orderId);
		addToShipInformationNotification.setHeader("Order To Shipping");
		addToShipInformationNotification.setDescription("Your Order# " + orderId + " is Shipping");
		addToShipInformationNotification.setSeen(false);
		addToShipInformationNotification.setDate(new Date());
		
		notificationService.pushNotification(addToShipInformationNotification,
											 orderService.getOrderById(orderId).getCustomer());
		
	}
	
	

}
