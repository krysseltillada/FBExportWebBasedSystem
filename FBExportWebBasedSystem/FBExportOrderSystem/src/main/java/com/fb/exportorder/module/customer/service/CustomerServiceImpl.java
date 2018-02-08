package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public Customer getCustomerById(long customerId) {
		return customerRepository.findOne(customerId);
	}

	@Override
	public List<Activity> getCustomerActivitiesById(long customerId, int pageNumber, int pageSize) {
		
		Pageable page = new PageRequest(pageNumber, pageSize);
		return customerRepository.getActivitiesById(customerId, page);
		
	}

}
