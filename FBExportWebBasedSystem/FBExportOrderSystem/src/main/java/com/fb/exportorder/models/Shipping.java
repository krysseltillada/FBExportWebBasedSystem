package com.fb.exportorder.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
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
	
	@ElementCollection
	private List<VesselStatus> vesselStatus;
	
	@OneToMany(cascade=CascadeType.ALL)
	private List<ShippingLog> shippingLog;
	
	@Temporal(TemporalType.DATE)
	private Date departureDate;
	
	@Temporal(TemporalType.DATE)
	private Date arrivalDate;
	
	@Temporal(TemporalType.DATE)
	private Date expectedDate;
	
}
