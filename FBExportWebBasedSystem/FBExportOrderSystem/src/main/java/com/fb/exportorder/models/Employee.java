package com.fb.exportorder.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Employee extends Account {
	
	@OneToMany(cascade = CascadeType.ALL)
	List<SystemNotification> systemNotificationList = new ArrayList<SystemNotification>();
	
	private String position;

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public List<SystemNotification> getSystemNotificationList() {
		return systemNotificationList;
	}

	public void setSystemNotificationList(List<SystemNotification> systemNotificationList) {
		this.systemNotificationList = systemNotificationList;
	}
	
}
