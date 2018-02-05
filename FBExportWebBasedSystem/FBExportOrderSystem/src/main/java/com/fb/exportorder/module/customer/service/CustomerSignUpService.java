package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fb.exportorder.models.customer.Customer;


public interface CustomerSignUpService {
	public List<String> register(Customer customer);
}
