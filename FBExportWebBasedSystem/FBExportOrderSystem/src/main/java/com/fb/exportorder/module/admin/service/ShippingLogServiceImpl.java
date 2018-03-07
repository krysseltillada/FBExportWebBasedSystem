package com.fb.exportorder.module.admin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.ShippingLog;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.repository.OrderRepository;

@Service
public class ShippingLogServiceImpl implements ShippingLogService {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	OrderRepository orderRepository;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	@Override
	public List<String> validateShipping(String header, String description, String address, String date, String time) {

		List<String> errorMessages = new ArrayList<String>();
		
		if (StringUtils.isBlank(header))
			errorMessages.add("header is empty");
		
		if (StringUtils.isBlank(description))
			errorMessages.add("description is empty");
		
		if (StringUtils.isBlank(address))
			errorMessages.add("address is empty");
		
		try {
			dateFormat.parse(date);
		} catch (ParseException e) {
			errorMessages.add("invalid date");
		}
		
		try {
			timeFormat.parse(time);
		} catch (ParseException e) {
			errorMessages.add("invalid time");
		}
		
		return errorMessages;
	}

	@Override
	public void addShippingLog(ShippingLog shippingLog, long id) {
		
		Order currentOrder = orderRepository.findOne(id);
		
		currentOrder.getShipping()
					.getShippingLog().add(shippingLog);
		
		orderRepository.save(currentOrder);
		
	}

	@Override
	public List<ShippingLog> getShippingLogs(long id) {
		return orderRepository.findOne(id).getShipping().getShippingLog();
	}

}
