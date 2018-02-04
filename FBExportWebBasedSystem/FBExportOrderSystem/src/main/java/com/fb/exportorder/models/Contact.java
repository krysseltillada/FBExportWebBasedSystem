package com.fb.exportorder.models;

import javax.persistence.Embeddable;

@Embeddable
public class Contact {
	
	private String phoneNumber;
	private String emailAddress;
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	
}
