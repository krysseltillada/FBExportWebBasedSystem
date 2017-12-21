package com.fb.exportorder.module.model;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;

import com.fb.exportorder.module.types.AccountStatus;

@Entity
@Table(name="tblCustomers")
public class Customer extends Account {

	public static class Builder {
		private long accountId;
		private String userName;
		private String passWord;
		private String firstName;
		private String lastName;
		private String middleName;
		private int age;
		private String address;
		private String phoneNumber;
		private String telephoneNumber;
		private String email;
		private AccountStatus accountStatus;
		private Date dateCreated;
		private Date timeCreated;
		private String country;
		private String zipCode;
		private String city;
		
		private Builder () {}
		
		public static Builder createBuilder() {
			return new Builder();
		}
		
		public Builder accountId(long accountId) {
			this.accountId = accountId;
			return this;
		}
		
		public Builder userName(String userName) {
			this.userName = userName;
			return this;
		}
		
		public Builder passWord(String passWord) {
			this.passWord = passWord;
			return this;
		}
		
		public Builder firstName(String firstName) {
			this.firstName = firstName;
			return this;
		}
		
		public Builder lastName(String lastName) {
			this.lastName = lastName;
			return this;
		}
		
		public Builder middleName(String middleName) {
			this.middleName = middleName;
			return this;
		}
		
		public Builder age(int age) {
			this.age = age;
			return this;
		}
		
		public Builder address(String address) {
			this.address = address;
			return this;
		}
		
		public Builder phoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
			return this;
		}
		
		public Builder telephoneNumber(String telephoneNumber) {
			this.telephoneNumber = telephoneNumber;
			return this;
		}
		
		public Builder email(String email) {
			this.email = email;
			return this;
		}
		
		public Builder accountStatus(AccountStatus accountStatus) {
			this.accountStatus = accountStatus;
			return this;
		}
		
		public Builder dateCreated(Date dateCreated) {
			this.dateCreated = dateCreated;
			return this;
		}
		
		public Builder timeCreated(Date timeCreated) {
			this.timeCreated = timeCreated;
			return this;
		}
		
		public Builder country(String country) {
			this.country = country;
			return this;
		}
		
		public Builder zipCode(String zipCode) {
			this.zipCode = zipCode;
			return this;
		}
		
		public Builder city(String city) {
			this.city = city;
			return this;
		}
		
		public Customer build () {
			
			Customer customer = new Customer(); 

			customer.accountId = accountId;
			customer.firstName = firstName;
			customer.lastName = lastName;
			customer.middleName = middleName;
			customer.age = age;
			customer.address = address;
			customer.phoneNumber = phoneNumber;
			customer.telephoneNumber = telephoneNumber;
			customer.email = email;
			customer.accountStatus = accountStatus;
			customer.dateCreated = dateCreated;
			customer.timeCreated = timeCreated;
			customer.userName = userName;
			customer.password = passWord;
			customer.country = country;
			customer.zipCode = zipCode;
			customer.city = city;
			
			return customer;
			
		}
	}
	
	private String country;
	private String zipCode;
	private String city;
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Customer [country=" + country + ", zipCode=" + zipCode + ", city=" + city + ", accountId=" + accountId
				+ ", userName=" + userName + ", password=" + password + ", firstName=" + firstName + ", lastName="
				+ lastName + ", middleName=" + middleName + ", age=" + age + ", address=" + address + ", phoneNumber="
				+ phoneNumber + ", telephoneNumber=" + telephoneNumber + ", email=" + email + ", accountStatus="
				+ accountStatus + ", dateCreated=" + dateCreated + ", timeCreated=" + timeCreated + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(accountId, 
							firstName,
							lastName, 
							middleName, 
							age, 
							address, 
							phoneNumber, 
							telephoneNumber,
							email,
							accountStatus,
							dateCreated,
							timeCreated,
							userName,
							password,
							country,
							zipCode,
							city);
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if (obj == this)
			return true;
		
		if (obj == null || !(obj instanceof Customer))
			return false;
		
		Customer customer = (Customer)obj;
		
		EqualsBuilder equalsBuilder = new EqualsBuilder();
		equalsBuilder.append(customer.accountId, accountId);
		equalsBuilder.append(customer.firstName, firstName);
		equalsBuilder.append(customer.lastName,  lastName);
		equalsBuilder.append(customer.middleName, middleName);
		equalsBuilder.append(customer.age, age);
		equalsBuilder.append(customer.address, address);
		equalsBuilder.append(customer.phoneNumber, phoneNumber);
		equalsBuilder.append(customer.telephoneNumber, telephoneNumber);
		equalsBuilder.append(customer.email, email);
		equalsBuilder.append(customer.accountStatus, accountStatus);
		equalsBuilder.append(customer.dateCreated, dateCreated);
		equalsBuilder.append(customer.timeCreated, timeCreated);
		equalsBuilder.append(customer.userName, userName);
		equalsBuilder.append(customer.password, password);
		equalsBuilder.append(customer.country, country);
		equalsBuilder.append(customer.zipCode, zipCode);
		equalsBuilder.append(customer.city, city);
		
		return equalsBuilder.isEquals();
		
	}
	

}
