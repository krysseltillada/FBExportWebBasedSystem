package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.ShippingAddress;

public interface YourAddressService {
	public List<ShippingAddress> getAllAddressesById(long id);
	public List<String> addAddress(ShippingAddress shippingAddress, long id);
	public String deleteAddress(long customerId, long addressId);
	public void setDefaultShippingAddress(long prevShippingAddressId, long newShippingAddressId);
	public List<String> editShippingAddress(ShippingAddress shippingAddress, long shippingAddressId, long customerId);
	public ShippingAddress getAddressById(long id);
}
