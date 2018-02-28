package com.fb.exportorder.module.customer.service;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.PaymentMethod;

public interface OrderService {
	public Order order (Customer customer, 
						ShippingAddress shippingAddress, 
						PaymentMethod paymethod,
						double totalPrice,
						double totalWeight);
}
