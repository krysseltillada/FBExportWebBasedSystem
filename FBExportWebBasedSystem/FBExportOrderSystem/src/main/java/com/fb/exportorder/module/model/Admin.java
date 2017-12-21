package com.fb.exportorder.module.model;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;

import com.fb.exportorder.module.types.AccountStatus;

@Entity
@Table(name="tblAdmins")
public class Admin extends Account {

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
		
		public Admin build () {
			
			Admin admin = new Admin(); 

			admin.accountId = accountId;
			admin.firstName = firstName;
			admin.lastName = lastName;
			admin.middleName = middleName;
			admin.age = age;
			admin.address = address;
			admin.phoneNumber = phoneNumber;
			admin.telephoneNumber = telephoneNumber;
			admin.email = email;
			admin.accountStatus = accountStatus;
			admin.dateCreated = dateCreated;
			admin.timeCreated = timeCreated;
			admin.userName = userName;
			admin.password = passWord;
			
			return admin;
			
		}
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
							password);
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if (obj == this)
			return true;
		
		if (obj == null || !(obj instanceof Admin))
			return false;
		
		Admin admin = (Admin)obj;
		
		EqualsBuilder equalsBuilder = new EqualsBuilder();
		equalsBuilder.append(admin.accountId, accountId);
		equalsBuilder.append(admin.firstName, firstName);
		equalsBuilder.append(admin.lastName,  lastName);
		equalsBuilder.append(admin.middleName, middleName);
		equalsBuilder.append(admin.age, age);
		equalsBuilder.append(admin.address, address);
		equalsBuilder.append(admin.phoneNumber, phoneNumber);
		equalsBuilder.append(admin.telephoneNumber, telephoneNumber);
		equalsBuilder.append(admin.email, email);
		equalsBuilder.append(admin.accountStatus, accountStatus);
		equalsBuilder.append(admin.dateCreated, dateCreated);
		equalsBuilder.append(admin.timeCreated, timeCreated);
		equalsBuilder.append(admin.userName, userName);
		equalsBuilder.append(admin.password, password);
		
		return equalsBuilder.isEquals();
		
	}
	
}
