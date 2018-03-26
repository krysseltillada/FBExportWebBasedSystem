package com.fb.exportorder.module.admin.tracker;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;

import com.fb.exportorder.models.customer.Order;

@Aspect
public class AdminNotificationTracker {

	@After("execution(public void com.fb.exportorder..service.OrderService+.markReceived(..))")
	public void detectReceiveOrder(JoinPoint joinPoint) {
		Order order = (Order)joinPoint.getArgs()[0];
		
		System.out.println(order.getCustomer().getFirstname() + " " + order.getCustomer().getLastname() + " has received order#" + order.getOrderId());
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markPaid(..))")
	public void detectPaidOrder(JoinPoint joinPoint) {
		Order order = (Order)joinPoint.getArgs()[0];
		
		System.out.println(order.getCustomer().getFirstname() + " " + order.getCustomer().getLastname() + " has paid order#" + order.getOrderId());
	}
	
}
