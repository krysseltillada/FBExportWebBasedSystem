package com.fb.exportorder.module.customer.service;

import java.util.List;
import java.util.Map;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.PaymentMethod;

public interface OrderService {
	
	public List<String> validate (String shipmentStatus,
			  String departureDate,
			  String expectedDate,
			  String arrivalDate,
			  String vesselName,
			  String mmsiNumber,
			  String imoNumber,
			  String destination);
	
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
	void markCancelled(Order order, String reason);
	void markPaid(Order order);
	
	void refund(Order order, String reason);
	void reOrder(Order order);
	
	void reviewOrder(Order order, String review);
	void returnRefundOrder(Order order, String reason);
	
	List<String> addToShipInformation(long id,
									  String shipmentStatus,
									  String expectedDate,
								      String departureDate,
									  String arrivalDate,
									  String vesselName,
									  String mmsiNumber,
									  String imoNumber,
									  String destination);
	
	List<Order> filterAndSortByCustomer(long customerId, String filterBy, String sortBy, int pageNumber, int pageSize);
	List<Order> filterAndSortByAdmin(String status, String shipment, String payment, String sortBy, String sortOrder);
	
	int filterAndSortByCustomerCount(long customerId, String filterBy, String sortBy);
	
	void deleteOrder (long id);
	void deleteSelectedOrder(List<Long> ids);
	
	boolean checkIfShippingExists (long id);
	
	Map<String, Integer> getOrderCount();
	
	List<Order> getLatestOrders();
	
	List<Order> getPaidOrders();
	
}
