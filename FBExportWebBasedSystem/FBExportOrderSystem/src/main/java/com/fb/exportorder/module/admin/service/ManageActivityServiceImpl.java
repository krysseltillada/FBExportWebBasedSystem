package com.fb.exportorder.module.admin.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.admin.repository.ManageActivityRepository;
import com.fb.exportorder.module.admin.repository.ManageCustomerRepository;
import com.fb.exportorder.module.admin.repository.ManageEmployeeRepository;

@Service
public class ManageActivityServiceImpl implements ManageActivityService {
	
	@Autowired
	ManageCustomerRepository customerRepository;
	
	@Autowired
	ManageActivityRepository activityRepository;


	@Override
	public List<Activity> getCustomerActivitiesById(long customerId) {
		List<Activity> customerActivityList = new ArrayList<>();
		List<Object[]> rawActivityList = activityRepository
								.getCustomerActivitiesById(customerId);
		
		for(Object[] rawActivity : rawActivityList) {
			Activity activity = new Activity();
			
			activity.setActivityId( ((BigInteger)rawActivity[0]).longValue() );
			activity.setDate((Date)rawActivity[1]);
			activity.setDescription((String)rawActivity[2]);
			activity.setHeader((String)rawActivity[3]);
			
			customerActivityList.add(activity);
		}
		return customerActivityList;
	}

}
