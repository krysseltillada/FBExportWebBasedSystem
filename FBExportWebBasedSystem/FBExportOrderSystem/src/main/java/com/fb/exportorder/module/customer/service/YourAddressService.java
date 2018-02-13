package com.fb.exportorder.module.customer.service;

import java.util.List;

import com.fb.exportorder.models.ShippingAddress;

public interface YourAddressService {
	public List<ShippingAddress> getAllAddressesById(long id);
}
