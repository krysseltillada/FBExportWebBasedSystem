package com.fb.exportorder.module.customer.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.service.CustomerService;
import com.fb.exportorder.module.customer.service.EmailService;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class OrderListController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private EmailService emailService;
	
	private static final int ORDER_ITEMS_COUNT = 5;
	
	@RequestMapping("/order-list")
	public String orderList (Model model, 
							 HttpSession session, 
							 @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
							 @RequestParam(required=false) String orderId) {
		
		if (StringUtils.isBlank(orderId)) {
		
			long customerId = (long)session.getAttribute("customerId");
			
			List<Order> orderList = customerService.getOrdersByCustomerId(pageNumber, customerId);
			
			int orderCount = customerService.getOrderCountByCustomerId(customerId);
			int numberOfPages = (orderCount % ORDER_ITEMS_COUNT == 0) ? (orderCount / ORDER_ITEMS_COUNT) - 1 : (orderCount / ORDER_ITEMS_COUNT);
			
			model.addAttribute("currentPageCount", pageNumber);
			model.addAttribute("pageNumber",  numberOfPages);
			model.addAttribute("pageCount", orderCount);
			model.addAttribute("orderItemsCount", ORDER_ITEMS_COUNT);
			model.addAttribute(orderList);
			
		} else {
			
			Order orderSearched = orderService.getOrderById(Long.parseLong(orderId));
			
			if (Objects.nonNull(orderSearched)) {
			
				model.addAttribute(new ArrayList<Order> () {{
					add(orderService.getOrderById(Long.parseLong(orderId)));
				}});
				model.addAttribute("pageNumber", 0);
				model.addAttribute("pageCount", 1);
				model.addAttribute("orderItemsCount", ORDER_ITEMS_COUNT);
				
			} else {
				
				model.addAttribute("pageCount", 0);
				
			}
		}
		
		return "order-list";
	}
	
	@RequestMapping(value = "/order-list/markCancelled", method = RequestMethod.POST)
	@ResponseBody
	public String markCancelled(@RequestParam String orderId,
								@RequestParam String reason) {
		
		orderService.markCancelled(orderService.getOrderById(Long.parseLong(orderId)), 
								   reason);
		
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/markPaid", method = RequestMethod.POST)
	@ResponseBody
	public String markPaid(@RequestParam String orderId) {
		
		orderService.markPaid(orderService.getOrderById(Long.parseLong(orderId)));
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/sendPaymentReceiptEmail", method = RequestMethod.POST)
	@ResponseBody
	public String sendPaymentReceiptEmail(@RequestParam String orderId,
										  @RequestParam String transactionDetailsJSON,
										  @RequestParam String itemsJSON) {
		
		Order order = orderService.getOrderById(Long.parseLong(orderId));
		Customer customer = order.getCustomer();
		
		System.out.println(transactionDetailsJSON);
		System.out.println(itemsJSON);
		
		try {
		
			JSONObject transactionDetails = (JSONObject)new JSONParser().parse(transactionDetailsJSON);
			JSONObject details = (JSONObject)transactionDetails.get("details");
			JSONArray itemsArray = (JSONArray)((JSONObject)new JSONParser().parse(itemsJSON)).get("items");
			
			String currency = (String)transactionDetails.get("currency");
			
			String total = (String)transactionDetails.get("total") + " " + currency;
			String subTotal = (String)details.get("subtotal") + " " + currency;
			String tax = (String)details.get("tax") + " " + currency;
			String shipping = (String)details.get("shipping") + " " + currency;
			
			List<String> itemDescription = new ArrayList<String>();
			List<String> itemPrice = new ArrayList<String>();
			
			for (int i = 0; i != itemsArray.size(); ++i) {
				
				JSONObject item = (JSONObject)itemsArray.get(i);
				
				itemDescription.add((String)item.get("name"));
				itemPrice.add( ((String)item.get("price")) + " " + currency);
				
			}
			
			
			emailService.sendPaymentReceiptEmail(customer.getContact()
														 .getEmailAddress(), 
												 order, itemDescription, itemPrice, subTotal, tax, shipping, total);
			
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/markReceived", method = RequestMethod.POST)
	@ResponseBody
	public String markReceived(@RequestParam String orderId) {
		
		orderService.markReceived(orderService.getOrderById(Long.parseLong(orderId)));
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/reorder", method = RequestMethod.POST)
	@ResponseBody
	public String reorder(@RequestParam String orderId) {
		
		orderService.reOrder(orderService.getOrderById(Long.parseLong(orderId)));
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/refund", method = RequestMethod.POST)
	@ResponseBody
	public String refund(@RequestParam String orderId,
						 @RequestParam String reason) {
		
		orderService.refund(orderService.getOrderById(Long.parseLong(orderId)), 
							reason);
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/reviewOrder", method = RequestMethod.POST)
	@ResponseBody
	public String reviewOrder(@RequestParam String orderId,
							  @RequestParam String review) {
		
		orderService.reviewOrder(orderService.getOrderById(Long.parseLong(orderId)), 
								 review);
		
		return "";
	}
	
	@RequestMapping(value = "/order-list/returnOrder", method = RequestMethod.POST)
	@ResponseBody
	public String returnOrder(@RequestParam String orderId,
							  @RequestParam String reason) {
		
		orderService.returnRefundOrder(orderService.getOrderById(Long.parseLong(orderId)), 
									   reason);
		
		return "";
		
	}
	
	@RequestMapping(value = "/order-list/filter", method = RequestMethod.GET)
	public String filter(@RequestParam String filterBy,
						 @RequestParam String sortBy,
						 @RequestParam(required=false, defaultValue="0") String pageNumber, Model model, HttpSession session) {
		
		long customerId = (long) session.getAttribute("customerId");
		int pageNumberInt = Integer.parseInt(pageNumber);
		int orderCount =  orderService.filterAndSortByCustomerCount(customerId, filterBy, sortBy);
		int numberOfPages = (orderCount % ORDER_ITEMS_COUNT == 0) ? (orderCount / ORDER_ITEMS_COUNT) - 1 : (orderCount / ORDER_ITEMS_COUNT);
		
		System.out.println(filterBy + " " + sortBy);
		model.addAttribute(orderService.filterAndSortByCustomer(customerId, filterBy, sortBy, pageNumberInt * ORDER_ITEMS_COUNT, 5));
		model.addAttribute("currentPageCount", pageNumber);
		model.addAttribute("pageCount", orderCount);
		model.addAttribute("pageNumber", numberOfPages);
		model.addAttribute("orderItemsCount", ORDER_ITEMS_COUNT);
		
		return "order-list";
	}
	

}
