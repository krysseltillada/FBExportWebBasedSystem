package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.PaymentMethod;

public interface OrderService {
	Order order (Customer customer, 
				 ShippingAddress shippingAddress, 
				 PaymentMethod paymethod,
				 double totalPrice,
				 double totalWeight);
	
	List<Order> getAllOrders ();
	
	Order getOrderById(long id);
	
	void markPending(Order order);
	void markApproved(Order order, String message);
	void markRejected(Order order, String reason);
	void markReceived(Order order);
	void markToShip(Order order);
	
	List<String> addToShipInformation(long id,
									  String shipmentStatus,
									  String expectedDate,
								      String departureDate,
									  String arrivalDate,
									  String vesselName,
									  String mmsiNumber,
									  String imoNumber,
									  String destination);
	
	boolean checkIfShippingExists (long id);
	
	
	
}
