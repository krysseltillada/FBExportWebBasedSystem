package com.fb.exportorder.module.admin.controllers;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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

import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.ShippingLog;
import com.fb.exportorder.models.VesselStatus;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.ShipmentStatus;
import com.fb.exportorder.module.admin.service.ShippingLogService;
import com.fb.exportorder.module.admin.service.ShippingService;
import com.fb.exportorder.module.customer.service.OrderService;

@Controller
public class OrdersController {
	
	//TODO make the order management module
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ShippingService shippingService;
	
	@Autowired
	ShippingLogService shippingLogService;
	
	Map<OrderStatus, String> orderStatusColor = new HashMap<OrderStatus, String>(){{
		put(OrderStatus.TO_SHIP, "#796AEE");
		put(OrderStatus.RECEIVED, "#0275D8");
		put(OrderStatus.REJECTED, "#D9534F");
		put(OrderStatus.APPROVED, "#5CB85C");
		put(OrderStatus.PENDING, "#FFC107");
		put(OrderStatus.CANCELLED, "#D9534F");
		put(OrderStatus.PAID, "#91C361");
		put(OrderStatus.REFUND, "#EA1E63");
		put(OrderStatus.RETURNED, "#795548");
	}};
	
	Map<OrderStatus, String> orderStatusMessage = new HashMap<OrderStatus, String>(){{
		put(OrderStatus.TO_SHIP, "To Ship");
		put(OrderStatus.RECEIVED, "Received");
		put(OrderStatus.REJECTED, "Rejected");
		put(OrderStatus.APPROVED, "Approved");
		put(OrderStatus.PENDING, "Pending");
		put(OrderStatus.CANCELLED, "Cancelled");
		put(OrderStatus.PAID, "Paid");
		put(OrderStatus.REFUND, "Refund");
		put(OrderStatus.RETURNED, "Returned");
	}};
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
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
			
			errorMessages = orderService.addToShipInformation(Long.parseLong((String)toShipInformation.get("orderId")),
															  (String)toShipInformation.get("shipmentStatus"),
															  (String)toShipInformation.get("expectedDate"),
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
		
		System.out.println("run");
		
		if (errorMessages.isEmpty()) {
			responseMessage.put("status", "success");
		}else {
			responseMessage.put("status", "error");
			responseMessage.put("message", errorMessages.get(0));
		}
		
		return responseMessage.toJSONString();
	
	}
	
	@RequestMapping(value = "/admin/orders/validateShippingInformation", method = RequestMethod.POST)
	@ResponseBody
	public String validateShippingInformation(@RequestParam String shippingInformationJSON) {
		
		JSONObject toShipInformation = null;
		List<String> errorMessages = null;
		
		try {
			toShipInformation = (JSONObject)new JSONParser().parse(shippingInformationJSON);
			
			errorMessages = orderService.validate((String)toShipInformation.get("shipmentStatus"),
												  (String)toShipInformation.get("expectedDate"),
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
		
		System.out.println("run");
		
		if (errorMessages.isEmpty()) {
			responseMessage.put("status", "success");
		}else {
			responseMessage.put("status", "error");
			responseMessage.put("message", errorMessages.get(0));
		}
		
		return responseMessage.toJSONString();
		
	}
	
	@RequestMapping(value = "/admin/orders/updateShippingInformation", method = RequestMethod.POST)
	@ResponseBody
	public String updateShippingInformation(@RequestParam String shippingInformationJSON) {
		
		JSONObject updateShippingInformation = null;
		
		try {
			
			updateShippingInformation = (JSONObject)new JSONParser().parse(shippingInformationJSON);
			
			long orderId = Long.parseLong((String)updateShippingInformation.get("orderId"));
			Shipping updatedShipping = new Shipping();
			
			ShipmentStatus updatedShipmentStatus = 
					StringUtils.equals((String)updateShippingInformation.get("shipmentStatus"), "On Cargo Ship") ? ShipmentStatus.ON_CARGO_SHIP :
				  																						 		   ShipmentStatus.ON_TRUCK;
			
			updatedShipping.setShipmentStatus(updatedShipmentStatus);
			
			try {
				updatedShipping.setExpectedDate(dateFormat.parse((String)updateShippingInformation.get("expectedDate")));
				updatedShipping.setDepartureDate(dateFormat.parse((String)updateShippingInformation.get("departureDate")));
				updatedShipping.setArrivalDate(dateFormat.parse((String)updateShippingInformation.get("arrivalDate")));
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if (updatedShipmentStatus == ShipmentStatus.ON_CARGO_SHIP) {
				
				VesselStatus vesselStatus = new VesselStatus();
				
				vesselStatus.setVesselName((String)updateShippingInformation.get("vesselName"));
				vesselStatus.setMmsiNumber((String)updateShippingInformation.get("mmsiNumber"));
				vesselStatus.setImoNumber((String)updateShippingInformation.get("imoNumber"));
				vesselStatus.setDestination((String)updateShippingInformation.get("destination"));
				
				updatedShipping.setVesselStatus(vesselStatus);
				
			}
			
			shippingService.updateShippingInformation(updatedShipping, 
													  orderId);
			
				
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/validateShippingLog", method = RequestMethod.POST)
	@ResponseBody String validateShippingLog(@RequestParam String shippingLogJSON) {
		
		JSONObject shippingLog = null;
		List<String> errorMessages = null;
		
		try {
			shippingLog = (JSONObject)new JSONParser().parse(shippingLogJSON);
			
					
			errorMessages = shippingLogService.validateShipping((String)shippingLog.get("header"), 
															    (String)shippingLog.get("description"), 
															    (String)shippingLog.get("address"), 
															    (String)shippingLog.get("date"), 
															    (String)shippingLog.get("time"));
					
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject responseMessage = new JSONObject();
		
		System.out.println("run");
		
		if (errorMessages.isEmpty()) {
			responseMessage.put("status", "success");
		}else {
			responseMessage.put("status", "error");
			responseMessage.put("message", errorMessages.get(0));
		}
		
		return responseMessage.toJSONString();
	}
	
	@RequestMapping(value = "/admin/orders/addShippingLog", method = RequestMethod.POST)
	@ResponseBody String addShippingLog(@RequestParam String shippingLogJSON) {
		
		JSONObject shippingLog = null;
		long orderId = 0;
		long shippingLogId = 0;
		
		try {
			shippingLog = (JSONObject)new JSONParser().parse(shippingLogJSON);
			
			orderId = Long.parseLong((String)shippingLog.get("orderId"));

			ShippingLog newShippingLog = new ShippingLog();
			
			newShippingLog.setHeader((String)shippingLog.get("header"));
			newShippingLog.setDescription((String)shippingLog.get("description"));
			newShippingLog.setAddress((String)shippingLog.get("address"));
			
			try {
				newShippingLog.setDate(dateFormat.parse((String)shippingLog.get("date")));
				newShippingLog.setTime(timeFormat.parse((String)shippingLog.get("time")));
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			}
			
			shippingLogId = shippingLogService.addShippingLog(newShippingLog, 
															  orderId);
					
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "{\"shippingLogId\" : " + shippingLogId + "}";
	}
	
	@RequestMapping(value = "/admin/orders/deleteShippingLog", method = RequestMethod.POST)
	@ResponseBody String deleteShippingLog(@RequestParam String shippingLogId,
										   @RequestParam String orderId) {
		
		shippingLogService.deleteShippingLog(Long.parseLong(shippingLogId), 
											 Long.parseLong(orderId));
		
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/getShippingLog", method = RequestMethod.POST)
	@ResponseBody List<ShippingLog> getShippingLog (@RequestParam String orderId) {
		return shippingLogService.getShippingLogs(Long.parseLong((String)orderId));
	}
	
	
	@RequestMapping(value = "/admin/orders/markApproved", method = RequestMethod.POST)
	@ResponseBody
	public String markApproved (@RequestParam String id, @RequestParam String message) {
		
		orderService.markApproved(orderService.getOrderById(Long.parseLong(id)), 
								  message);
		
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/markRejected", method = RequestMethod.POST)
	@ResponseBody
	public String markRejected (@RequestParam String id, @RequestParam String reason) {
		
		orderService.markRejected(orderService.getOrderById(Long.parseLong(id)), 
								  reason);
		
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/markPending", method = RequestMethod.POST)
	@ResponseBody
	public String markPending (@RequestParam String id) {
		
		orderService.markPending(orderService.getOrderById(Long.parseLong(id)));
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/markReceived", method = RequestMethod.POST)
	@ResponseBody
	public String markReceived (@RequestParam String id) {
		
		orderService.markReceived(orderService.getOrderById(Long.parseLong(id)));
		return "";
	}
	
	@RequestMapping(value = "/admin/orders/markToShip", method = RequestMethod.POST)
	@ResponseBody
	public String markToShip (@RequestParam String id) {
		
		orderService.markToShip(orderService.getOrderById(Long.parseLong(id)));
		return "";
	}
	
	
	@RequestMapping(value = "/admin/orders/checkShippingExists", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkShippingExists (@RequestParam String orderId) {
		return orderService.checkIfShippingExists(Long.parseLong(orderId));
	}
	
	
	
	
	

}
