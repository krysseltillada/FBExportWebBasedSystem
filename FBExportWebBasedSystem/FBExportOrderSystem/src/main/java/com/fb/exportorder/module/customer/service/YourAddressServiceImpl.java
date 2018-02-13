package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.ShippingAddressRepository;

@Service
public class YourAddressServiceImpl implements YourAddressService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	ShippingAddressRepository shippingAddressRepository;
	
	@Override
	public List<ShippingAddress> getAllAddressesById(long id) {
		return customerRepository.findOne(id).getShippingAddresses();
	}

	@Override
	public List<String> addAddress(ShippingAddress shippingAddress, long id) {
		
		Customer customer = customerRepository.findOne(id);
		
		customer.getShippingAddresses()
				.add(shippingAddress);
		
		customerRepository.save(customer);
		
		return null;
	}

	@Override
	public void deleteAddress(long customerId, long addressId) {
		
		Customer customer = customerRepository.findOne(customerId);
		ShippingAddress deleteShippingAddress = shippingAddressRepository.findOne(addressId);
		
		customer.getShippingAddresses()
				.remove(deleteShippingAddress);
		
		customerRepository.save(customer);
		
	}

	@Override
	public void setDefaultShippingAddress(long prevShippingAddressId, long newShippingAddressId) {
		
		ShippingAddress prevShippingAddress = shippingAddressRepository.findOne(prevShippingAddressId);
		ShippingAddress newShippingAddress = shippingAddressRepository.findOne(newShippingAddressId);
		
		prevShippingAddress.setDefaultShippingAddress(false);
		newShippingAddress.setDefaultShippingAddress(true);
		
		shippingAddressRepository.save(prevShippingAddress);
		shippingAddressRepository.save(newShippingAddress);
		
	}
	

}
