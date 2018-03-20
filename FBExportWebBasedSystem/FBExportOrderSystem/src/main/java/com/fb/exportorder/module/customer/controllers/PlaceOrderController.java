package com.fb.exportorder.module.customer.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.measure.unit.NonSI;
import javax.measure.unit.SI;
import javax.measure.unit.Unit;
import javax.servlet.http.HttpSession;

import org.jscience.physics.amount.Amount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.constants.Finance;
import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.customer.Weight;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;
import com.fb.exportorder.models.enums.WeightType;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.OrderService;
import com.fb.exportorder.module.customer.service.YourAddressService;

@Controller
public class PlaceOrderController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	YourAddressService yourAddressService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/place-order")
	public String placeOrder (Model model, HttpSession session) {
		
		long customerId = (long) session.getAttribute("customerId");
		
		double totalWeight = 0.0;
		double totalDue = 0.0;
		double subTotal = 0.0;
		
		List<Item> items = customerService.getCustomerById(customerId)
										   .getCart()
										   .getItems();
		
		Set<Long> taxableProduct = new HashSet<>();
		
		
		for(Item item : items) {
			
			Product product = item.getProduct();
			
			taxableProduct.add(product.getProductId());
			
			Weight weight = item.getWeight();
			WeightType weightType = weight.getWeightType();
			
			System.out.println(weightType);
			
			subTotal += item.getPrice();
			
			if (weightType != WeightType.KILO) {
				totalWeight += Amount.valueOf(weight.getWeight(), 
											 (weightType == WeightType.TON) ? NonSI.TON_US :
												 							  NonSI.POUND).to(SI.KILOGRAM).getEstimatedValue();
			} else {
				totalWeight += weight.getWeight();
			}
			
		}
		
		double taxable =  subTotal * Finance.TAX;

		totalDue = Finance.SHIPPING_FEE + subTotal + taxable;
		
		
		System.out.println(totalWeight);
		
		
		model.addAttribute(yourAddressService.getAllAddressesById(customerId));
		
		model.addAttribute("taxable", taxableProduct.size());
		model.addAttribute("taxRate", Finance.TAX * 100);
		model.addAttribute("shippingFee", Finance.SHIPPING_FEE);
		model.addAttribute("totalWeight", totalWeight);
		model.addAttribute("subTotal", subTotal);
		model.addAttribute("totalDue", totalDue);
		model.addAttribute("cartItemList", items);
		
		
		return "place-order";
	}
	
	@RequestMapping(value = "/place-order/order", method = RequestMethod.POST)
	public String order (@RequestParam("shipping-address") String shippingAddressId,
						 @RequestParam("payment-method")   String paymentMethod,
						 @RequestParam("total-price-approx") double totalPriceApprox,
						 @RequestParam("total-weight-approx") double totalWeightApprox,
														   HttpSession session, 
														   RedirectAttributes attributes) {
		
		long customerId = (long)session.getAttribute("customerId");
		long shippingAddressIdL = Long.parseLong(shippingAddressId);
		
		Customer customerOrdered = customerService.getCustomerById(customerId);
		ShippingAddress selectedShippingAddress = yourAddressService.getAddressById(shippingAddressIdL);
		Order order = orderService.order(customerOrdered,
										 selectedShippingAddress,
										 PaymentMethod.valueOf(paymentMethod),
										 totalPriceApprox,
										 totalWeightApprox);
		
		attributes.addFlashAttribute("order", order);
		
		return "redirect:/order-success";
	}
	
	@RequestMapping("/order-success")
	public String orderSuccess (HttpSession session,
								@ModelAttribute("order") Order order,
														 Model model) {
		
		
		
		model.addAttribute(order);
		model.addAttribute("subTotal", order.getSubTotal());
		model.addAttribute("taxable", order.getTaxable());
		model.addAttribute("taxRate", Finance.TAX * 100);
		model.addAttribute("shippingFee",Finance.SHIPPING_FEE);
		model.addAttribute("totalDue", order.getTotalDue());
		
		return "order-success";
	}

}
