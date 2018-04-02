package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.ShippingAddress;

public interface YourAddressService {
	List<ShippingAddress> getAllAddressesById(long id);
	List<String> addAddress(ShippingAddress shippingAddress, long id);
	String deleteAddress(long customerId, long addressId);
	void setDefaultShippingAddress(long prevShippingAddressId, long newShippingAddressId);
	List<String> editShippingAddress(ShippingAddress shippingAddress, long shippingAddressId, long customerId);
	ShippingAddress getAddressById(long id);
}
