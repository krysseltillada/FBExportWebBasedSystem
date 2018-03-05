package com.fb.exportorder.module.admin.service;

import com.fb.exportorder.models.Shipping;

public interface ShippingService {
	
	void updateShippingInformation(Shipping shipping, long orderId);

}
