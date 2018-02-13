package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Service
public class YourAddressServiceImpl implements YourAddressService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public List<ShippingAddress> getAllAddressesById(long id) {
		return customerRepository.findOne(id).getShippingAddresses();
	}

}
