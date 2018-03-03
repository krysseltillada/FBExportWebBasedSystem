package com.fb.exportorder.module.admin.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class OrdersController {
	
	//TODO make the order management module
	
	@Autowired
	OrderService orderService;
	
	Map<OrderStatus, String> orderStatusColor = new HashMap<OrderStatus, String>(){{
		put(OrderStatus.TO_SHIP, "#796AEE");
		put(OrderStatus.RECEIVED, "#0275D8");
		put(OrderStatus.REJECTED, "#D9534F");
		put(OrderStatus.APPROVED, "#5CB85C");
		put(OrderStatus.PENDING, "#FFC107");
		
	}};
	
	Map<OrderStatus, String> orderStatusMessage = new HashMap<OrderStatus, String>(){{
		put(OrderStatus.TO_SHIP, "To ship");
		put(OrderStatus.RECEIVED, "Received");
		put(OrderStatus.REJECTED, "Rejected");
		put(OrderStatus.APPROVED, "Approved");
		put(OrderStatus.PENDING, "Pending");
		
	}};
	
	@RequestMapping("/admin/orders")
	public String orders(Model model) {
		
		model.addAttribute("orderStatusColorMap", orderStatusColor);
		model.addAttribute("orderStatusMessageMap", orderStatusMessage);
		model.addAttribute(orderService.getAllOrders());
		
		return "orders";
	}
	
	@RequestMapping(value = "/admin/orders/get-order-details", method = RequestMethod.POST)
	@ResponseBody
	public Order getOrderDetails (@RequestParam String id) {
		return orderService.getOrderById(Long.parseLong(id));
	}
	
	@RequestMapping(value = "/admin/orders/add-to-ship-information", method = RequestMethod.POST)
	@ResponseBody
	public String addToShipInformation (@RequestParam String toShipInformationJSON) {
		
		JSONObject toShipInformation = null;
		List<String> errorMessages = null;
		
		try {
			toShipInformation = (JSONObject)new JSONParser().parse(toShipInformationJSON);
			
			errorMessages = orderService.addToShipInformation((String)toShipInformation.get("shipmentStatus"), 
															  (String)toShipInformation.get("departureDate"), 
															  (String)toShipInformation.get("arrivalDate"), 
															  (String)toShipInformation.get("vesselName"), 
															  (String)toShipInformation.get("mmsiNumber"), 
															  (String)toShipInformation.get("imoNumber"), 
															  (String)toShipInformation.get("destination"));	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject responseMessage = new JSONObject();
		
		if (errorMessages.isEmpty())
			responseMessage.put("status", "success");
		else {
			responseMessage.put("status", "error");
			responseMessage.put("message", errorMessages.get(0));
		}
		
		return responseMessage.toJSONString();
	}
	
	
	

}
