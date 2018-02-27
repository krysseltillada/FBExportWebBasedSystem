package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.measure.unit.NonSI;
import javax.measure.unit.SI;
import javax.measure.unit.Unit;
import javax.servlet.http.HttpSession;

import org.jscience.physics.amount.Amount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Weight;
import com.fb.exportorder.models.enums.WeightType;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.YourAddressService;

@Controller
public class PlaceOrderController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	YourAddressService yourAddressService;
	
	@RequestMapping("/place-order")
	public String placeOrder (Model model, HttpSession session) {
		
		long customerId = (long) session.getAttribute("customerId");
		
		double totalWeight = 0;
		double totalPrice = 0;
		
		List<Item> items = customerService.getCustomerById(customerId)
										   .getCart()
										   .getItems();

		
		
		for(Item item : items) {
		
			Weight weight = item.getWeight();
			WeightType weightType = weight.getWeightType();
			
			System.out.println(weightType);
			
			totalPrice += item.getPrice();
			
			if (weightType != WeightType.KILO) {
				totalWeight += Amount.valueOf(weight.getWeight(), 
											 (weightType == WeightType.TON) ? NonSI.TON_US :
												 							  NonSI.POUND).to(SI.KILOGRAM).getEstimatedValue();
			} else {
				totalWeight += weight.getWeight();
			}
			
		}
		
		System.out.println(totalWeight);
		
		
		model.addAttribute(yourAddressService.getAllAddressesById(customerId));
		
		model.addAttribute("totalWeight", totalWeight);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("cartItemList", items);
		
		
		return "place-order";
	}

}
