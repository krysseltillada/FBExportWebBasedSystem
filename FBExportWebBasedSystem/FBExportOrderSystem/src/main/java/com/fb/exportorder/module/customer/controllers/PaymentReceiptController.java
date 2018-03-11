package com.fb.exportorder.module.customer.controllers;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class PaymentReceiptController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/payment-receipt")
	public String paymentReceipt(@RequestParam String orderId,
											   Model model) {
		
		Order paidOrder = orderService.getOrderById(Long.parseLong(orderId)); 

		if (Objects.nonNull(paidOrder) && paidOrder.getOrderStatus() == OrderStatus.PAID) {
			model.addAttribute(paidOrder);
			return "payment-receipt";
		} 
		
		return "redirect:/error";
	}
 	
}
