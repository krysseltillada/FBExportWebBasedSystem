package com.fb.exportorder.module.customer.tracker;

import java.util.Date;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.session.CustomerSessionBean;

@Aspect
public class ActivityTracker {

	@Autowired
	private CustomerSessionBean customerSessionBean;
	
	@Autowired
	private CustomerService customerService;
	
	@AfterReturning(pointcut="execution(public com.fb.exportorder.models.customer.Order com.fb.exportorder..service.OrderService+.order(..))",
					returning = "returnedOrder")
	public void detectOrder(Object returnedOrder) {
		
		Order order = (Order)returnedOrder;
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order");
		activity.setDescription("You've ordered Order No." + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markCancelled(..))")
	public void detectOrderCancelled(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order Cancelled");
		activity.setDescription("You've cancelled your Order No." + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.markPaid(..))")
	public void detectOrderPaid(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order Paid");
		activity.setDescription("You've Paid your Order No." + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.refund(..))")
	public void detectOrderRefund(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order Refund");
		activity.setDescription("You've Refund your Order No." + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.reOrder(..))")
	public void detectOrderReorder(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Reordered");
		activity.setDescription("You've reordered your Order No." + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
	
	}
	
	@AfterReturning(pointcut = "execution(public java.util.List<String> com.fb.exportorder..service.AccountSettingsService+.editAccount(..))",
					returning = "returnedErrorMessages")
	public void detectEditAccountSettings(Object returnedErrorMessages) {
		
		List<String> errorMessages = (List<String>)returnedErrorMessages;
		
		if (errorMessages.isEmpty()) {
			
			Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
			
			Activity activity = new Activity();
			
			activity.setHeader("Edited Account");
			activity.setDescription("You've edited your account settings");
			activity.setDate(new Date());
			activity.setCustomer(customer);
			
			customerService.addCustomerActivity(activity, customer);
			
			
		}
		
		
	}
	
	@After("execution(@org.springframework.web.bind.annotation.RequestMapping public java.lang.String com.fb.exportorder..controllers.OrderListController.markReceived(..))")
	public void detectCustomerMarkAsReceived(JoinPoint joinPoint) {
		
		long orderId = Long.parseLong((String)joinPoint.getArgs()[0]);
		
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order Marked as Received");
		activity.setDescription("You've marked your Order No." + orderId + " as received");
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
		
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.reviewOrder(..)))")
	public void detectOrderReviewed(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Order reviewed");
		activity.setDescription("You've reviewed your Order No. " + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public void com.fb.exportorder..service.ProductService+.saveReview(..)))")
	public void detectProductReviewed(JoinPoint joinPoint) {
		
		Product product = ((Rating)joinPoint.getArgs()[0]).getProduct();
		
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Reviewed Product");
		activity.setDescription("You've reviewed a product " + product.getName());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
	
	}
	
	@After("execution(public void com.fb.exportorder..service.OrderService+.returnRefundOrder(..)))")
	public void detectOrderReturned(JoinPoint joinPoint) {
		
		Order order = (Order)joinPoint.getArgs()[0];
		
		Customer customer = customerService.getCustomerById(customerSessionBean.getCustomerId());
		
		Activity activity = new Activity();
		
		activity.setHeader("Returned Product");
		activity.setDescription("You've requested to returned order No. " + order.getOrderId());
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
		
	}
	
	@After("execution(public String com.fb.exportorder..service.ResetPasswordService+.resetPassword(..))")
	public void detectResetPassword(JoinPoint joinPoint) {
		Customer customer = customerService.getCustomerById((Long)joinPoint.getArgs()[1]);
		
		Activity activity = new Activity();
		
		activity.setHeader("Reset Password");
		activity.setDescription("Password Changed");
		activity.setDate(new Date());
		activity.setCustomer(customer);
		
		customerService.addCustomerActivity(activity, customer);
	}
	
}
