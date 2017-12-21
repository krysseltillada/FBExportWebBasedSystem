package com.fb.exportorder.module.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fb.exportorder.module.types.AccountStatus;

@MappedSuperclass
public abstract class Account {
	
	
	public static class Builder {
		
		protected Builder () {}
		
		
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	protected Long accountId;
	
	@Column(unique=true, nullable=false)
	protected String userName;
	
	@Column(nullable=false)
	protected String password;

	@Column(nullable=false)
	protected String firstName;

	@Column(nullable=false)
	protected String lastName;

	@Column(nullable=false)
	protected String middleName;
	
	protected int age;

	@Column(nullable=false)
	protected String address;

	@Column(nullable=false)
	protected String phoneNumber;

	@Column(nullable=false)
	protected String telephoneNumber;
	
	@Column(unique=true)
	protected String email;
	
	@Enumerated(EnumType.STRING)
	@Column(name="status", nullable=false)
	protected AccountStatus accountStatus;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	protected Date dateCreated;
	
	@Temporal(TemporalType.TIME)
	@Column(nullable=false)
	protected Date timeCreated;
	
	public Long getAccountId() {
		return accountId;
	}
	
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getMiddleName() {
		return middleName;
	}
	
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public AccountStatus getAccountStatus() {
		return accountStatus;
	}
	
	public void setAccountStatus(AccountStatus accountStatus) {
		this.accountStatus = accountStatus;
	}
	
	public Date getDateCreated() {
		return dateCreated;
	}
	
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public Date getTimeCreated() {
		return timeCreated;
	}
	
	public void setTimeCreated(Date timeCreated) {
		this.timeCreated = timeCreated;
	}
}




