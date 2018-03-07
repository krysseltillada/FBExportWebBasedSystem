package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.ShippingLog;

public interface ShippingLogService {
	
	public List<String> validateShipping (String header,
										  String description,
										  String address,
										  String date,
										  String time);
	
	public void addShippingLog (ShippingLog shippingLog,
								long id);
	
	public List<ShippingLog> getShippingLogs(long id);

}
