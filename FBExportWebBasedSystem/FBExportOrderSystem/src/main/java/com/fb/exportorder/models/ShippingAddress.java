package com.fb.exportorder.models;

import javax.persistence.Embeddable;

@Embeddable
public class ShippingAddress {

	private String addressType;
	private String receiverFullName;
	
	private Address address;
	
	private String phoneNumber;
	private String shippingInstructions;
	
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getShippingInstructions() {
		return shippingInstructions;
	}
	public void setShippingInstructions(String shippingInstructions) {
		this.shippingInstructions = shippingInstructions;
	}
	
	
	
}
