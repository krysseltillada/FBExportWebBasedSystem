package com.fb.exportorder.module.admin.tracker;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.service.InventoryService;
import com.fb.exportorder.module.admin.service.NotificationService;
import com.fb.exportorder.module.admin.session.EmployeeSessionBean;

@Aspect
public class AdminNotificationTracker {
	
	@Autowired
	@Qualifier("AdminNotificationService")
	NotificationService notificationService;
	
	@Autowired
	InventoryService inventoryService;
	

	@After("execution(public void com.fb.exportorder..service.OrderService+.markReceived(..))")
	public void detectReceiveOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Order received");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " has received order# " + order.getOrderId());
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_RECEIVED);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.returnRefundOrder(..))")
	public void detectReturnRefundOrderOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Order return");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " wants to return order# " + order.getOrderId());
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_RETURN);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markPaid(..))")
	public void detectPaidOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Order paid");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " has paid order# " + order.getOrderId());
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_PAID);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.refund(..))")
	public void detectRefundOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Order refund");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " wants to refund order# " + order.getOrderId());
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_REFUND);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@AfterReturning(pointcut  = "execution(public com.fb.exportorder.models.customer.Order com.fb.exportorder..service.OrderService+.order(..))", 
					returning = "returnedOrder")
	public void detectOrder(Object returnedOrder) {
		
		
		Order order = (Order)returnedOrder;
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("New order");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " has ordered");
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_NEW_ORDER);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markCancelled(..))")
	public void detectCancelledOrder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = order.getCustomer();
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Order cancelled");
		systemNotification.setDescription(customer.getFirstname() + " " + customer.getLastname() + " has cancelled order# " + order.getOrderId());
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.ORDER_CANCELLED);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.InventoryService+.addProduct(..))")
	public void detectNewProduct(JoinPoint joinPoint) {
	
	
		String productName = (String)joinPoint.getArgs()[1];
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("New Product");
		systemNotification.setDescription("New product has added " + productName);
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.INVENTORY_ADD_PRODUCT);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);

	}
	
	@After("execution(public void com.fb.exportorder..service.InventoryService+.editProduct(..))")
	public void detectEditProduct(JoinPoint joinPoint) {
	
	
		long productId = (Long)joinPoint.getArgs()[0];
		
		SystemNotification systemNotification = new SystemNotification();
		
		systemNotification.setHeader("Edited Product");
		systemNotification.setDescription("Product no. " + productId +  " has been edited");
		systemNotification.setSeen(false);
		systemNotification.setSystemNotificationStatus(SystemNotificationStatus.INVENTORY_EDIT_PRODUCT);
		systemNotification.setDate(new Date());
		
		notificationService.pushNotification(systemNotification);

	}
	
}
