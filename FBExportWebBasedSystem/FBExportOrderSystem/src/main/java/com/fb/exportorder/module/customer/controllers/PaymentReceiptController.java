package com.fb.exportorder.module.customer.controllers;

import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class PaymentReceiptController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/payment-receipt")
	public String paymentReceipt(@RequestParam String orderId,
											   Model model,
											   HttpSession session) {
		
		Order paidOrder = orderService.getOrderById(Long.parseLong(orderId)); 

		if (Objects.nonNull(paidOrder) && (paidOrder.getOrderStatus() == OrderStatus.PAID || paidOrder.getOrderStatus() == OrderStatus.REFUND)) {
			model.addAttribute(paidOrder);
			model.addAttribute("subTotal", paidOrder.getSubTotal());
			model.addAttribute("billToShippingAddress", customerService.getCustomerById((long) session.getAttribute("customerId")).getShippingAddresses().get(0));
			return "payment-receipt";
		} 
		
		return "redirect:/error";
	}
 	
}
