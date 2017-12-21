package com.fb.exportorder.module.model;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;

import com.fb.exportorder.module.types.AccountStatus;

@Entity	
@Table(name="tblEmployees")
public class Employee extends Account {
	
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
		private String position;
		private String department;
		
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
		
		public Builder position(String position) {
			this.position = position;
			return this;
		}
		
		public Builder department(String department) {
			this.department = department;
			return this;
		}
		
		public Employee build () {
			
			Employee employee = new Employee(); 

			employee.accountId = accountId;
			employee.firstName = firstName;
			employee.lastName = lastName;
			employee.middleName = middleName;
			employee.age = age;
			employee.address = address;
			employee.phoneNumber = phoneNumber;
			employee.telephoneNumber = telephoneNumber;
			employee.email = email;
			employee.accountStatus = accountStatus;
			employee.dateCreated = dateCreated;
			employee.timeCreated = timeCreated;
			employee.position = position;
			employee.department = department; 
			employee.userName = userName;
			employee.password = passWord;
			
			return employee;
			
		}
		
	}
	
	private String position;
	private String department;

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	@Override
	public String toString() {
		return "Employee [position=" + position + ", department=" + department + ", accountId=" + accountId
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
							position,
							department,
							userName,
							password);
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if (obj == this)
			return true;
		
		if (obj == null || !(obj instanceof Employee))
			return false;
		
		Employee employee = (Employee)obj;
		
		EqualsBuilder equalsBuilder = new EqualsBuilder();
		equalsBuilder.append(employee.accountId, accountId);
		equalsBuilder.append(employee.firstName, firstName);
		equalsBuilder.append(employee.lastName,  lastName);
		equalsBuilder.append(employee.middleName, middleName);
		equalsBuilder.append(employee.age, age);
		equalsBuilder.append(employee.address, address);
		equalsBuilder.append(employee.phoneNumber, phoneNumber);
		equalsBuilder.append(employee.telephoneNumber, telephoneNumber);
		equalsBuilder.append(employee.email, email);
		equalsBuilder.append(employee.accountStatus, accountStatus);
		equalsBuilder.append(employee.dateCreated, dateCreated);
		equalsBuilder.append(employee.timeCreated, timeCreated);
		equalsBuilder.append(employee.position, position);
		equalsBuilder.append(employee.department, department);
		equalsBuilder.append(employee.userName, userName);
		equalsBuilder.append(employee.password, password);
		
		return equalsBuilder.isEquals();
		
	}

	
}
