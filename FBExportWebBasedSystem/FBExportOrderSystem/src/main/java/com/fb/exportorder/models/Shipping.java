package com.fb.exportorder.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fb.exportorder.models.enums.ShipmentStatus;

@Entity
public class Shipping {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long shippingId;
	
	@Enumerated(EnumType.STRING)
	private ShipmentStatus shipmentStatus;
	
	@Embedded
	private VesselStatus vesselStatus;
	
	@OneToMany(cascade=CascadeType.ALL, orphanRemoval = true)
	private List<ShippingLog> shippingLog = new ArrayList<ShippingLog>();
	
	@Temporal(TemporalType.DATE)
	private Date departureDate;
	
	@Temporal(TemporalType.DATE)
	private Date arrivalDate;
	
	@Temporal(TemporalType.DATE)
	private Date expectedDate;
	
	public boolean isCompleteShipping() {
		return (shippingLog.size() > 0) ? shippingLog.get(shippingLog.size() - 1).isComplete() : false;
	}

	public Long getShippingId() {
		return shippingId;
	}

	public void setShippingId(Long shippingId) {
		this.shippingId = shippingId;
	}

	public ShipmentStatus getShipmentStatus() {
		return shipmentStatus;
	}

	public void setShipmentStatus(ShipmentStatus shipmentStatus) {
		this.shipmentStatus = shipmentStatus;
	}

	public VesselStatus getVesselStatus() {
		return vesselStatus;
	}

	public void setVesselStatus(VesselStatus vesselStatus) {
		this.vesselStatus = vesselStatus;
	}

	public List<ShippingLog> getShippingLog() {
		return shippingLog;
	}

	public void setShippingLog(List<ShippingLog> shippingLog) {
		this.shippingLog = shippingLog;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public Date getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}
	
	
	
}
