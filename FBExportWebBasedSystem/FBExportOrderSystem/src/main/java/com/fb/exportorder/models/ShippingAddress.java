package com.fb.exportorder.models;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ShippingAddress {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long shippingAddressId;
	
	private String addressType;
	private String receiverFullName;
	
	@Embedded
	private Address address;
	
	@Embedded
	private Contact contact;
	
	private String shippingInstructions;
	
	private boolean defaultShippingAddress;
	
	public String getAddressType() {
		return addressType;
	}
	
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}
	
	public String getReceiverFullName() {
		return receiverFullName;
	}
	
	public void setReceiverFullName(String receiverFullName) {
		this.receiverFullName = receiverFullName;
	}
	
	public Address getAddress() {
		return address;
	}
	
	public void setAddress(Address address) {
		this.address = address;
	}
	
	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public String getShippingInstructions() {
		return shippingInstructions;
	}
	
	public void setShippingInstructions(String shippingInstructions) {
		this.shippingInstructions = shippingInstructions;
	}
	
	public Long getShippingAddressId() {
		return shippingAddressId;
	}
	
	public void setShippingAddressId(Long shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}

	public boolean isDefaultShippingAddress() {
		return defaultShippingAddress;
	}

	public void setDefaultShippingAddress(boolean defaultShippingAddress) {
		this.defaultShippingAddress = defaultShippingAddress;
	}

	
	
}
