package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class UserAccessLog {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long userAccessLogId;

	@OneToOne
	private Employee employee;
	
	private String ipAddress;
	
	private String description;
	
	@Temporal(TemporalType.DATE)
	private Date dateOccured;
	
	@Temporal(TemporalType.TIME)
	private Date timeOccured;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateOccured() {
		return dateOccured;
	}

	public void setDateOccured(Date dateOccured) {
		this.dateOccured = dateOccured;
	}

	public Date getTimeOccured() {
		return timeOccured;
	}

	public void setTimeOccured(Date timeOccured) {
		this.timeOccured = timeOccured;
	}

	public Long getUserAccessLogId() {
		return userAccessLogId;
	}

	public void setUserAccessLogId(Long userAccessLogId) {
		this.userAccessLogId = userAccessLogId;
	}
	
	
	
	
	
}
