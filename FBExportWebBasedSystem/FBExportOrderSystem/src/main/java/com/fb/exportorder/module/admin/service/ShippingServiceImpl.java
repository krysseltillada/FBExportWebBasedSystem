package com.fb.exportorder.module.admin.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.VesselStatus;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.repository.OrderRepository;

@Service
public class ShippingServiceImpl implements ShippingService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public void updateShippingInformation(Shipping shipping, long orderId) {
		
		Order currentOrder = orderRepository.findOne(orderId);
		Shipping previousShipping = currentOrder.getShipping();
		
		previousShipping.setShipmentStatus(shipping.getShipmentStatus());
		previousShipping.setExpectedDate(shipping.getExpectedDate());
		previousShipping.setDepartureDate(shipping.getDepartureDate());
		previousShipping.setArrivalDate(shipping.getArrivalDate());
		
		switch (shipping.getShipmentStatus()) {
		
		case ON_TRUCK:
			
			if(Objects.nonNull(previousShipping.getVesselStatus())) {
				previousShipping.setVesselStatus(null);
			}
			
			break; 
			
		case ON_CARGO_SHIP:
			
			
			if (Objects.isNull(previousShipping.getVesselStatus()))
				previousShipping.setVesselStatus(new VesselStatus());
			
			VesselStatus vesselStatus = previousShipping.getVesselStatus();
			
			vesselStatus.setVesselName(shipping.getVesselStatus().getVesselName());
			vesselStatus.setMmsiNumber(shipping.getVesselStatus().getMmsiNumber());
			vesselStatus.setImoNumber(shipping.getVesselStatus().getImoNumber());
			vesselStatus.setDestination(shipping.getVesselStatus().getDestination());
		
			previousShipping.setVesselStatus(vesselStatus);
			
			break;
		
		}
		
		orderRepository.save(currentOrder);
		
	}


}
