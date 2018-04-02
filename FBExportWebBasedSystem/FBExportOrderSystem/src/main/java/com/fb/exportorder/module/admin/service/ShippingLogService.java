package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.ShippingLog;

public interface ShippingLogService {
	
	List<String> validateShipping (String header,
								   String description,
								   String address,
								   String date,
								   String time);
	
	long addShippingLog (ShippingLog shippingLog,
						 long id);
	
	List<ShippingLog> getShippingLogs(long id);
	ShippingLog getShippingLogById(long id);
	
	void deleteShippingLog (long id, long orderId);

}
