package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fb.exportorder.models.enums.SystemNotificationStatus;

@Entity
public class SystemNotification {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long notificationId;
	
	private String header;
	private String description;
	
	@Enumerated(EnumType.STRING)
	private SystemNotificationStatus systemNotificationStatus;
	
	private boolean isSeen;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	

	public Long getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(Long notificationId) {
		this.notificationId = notificationId;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public SystemNotificationStatus getSystemNotificationStatus() {
		return systemNotificationStatus;
	}

	public void setSystemNotificationStatus(SystemNotificationStatus systemNotificationStatus) {
		this.systemNotificationStatus = systemNotificationStatus;
	}

	public boolean isSeen() {
		return isSeen;
	}

	public void setSeen(boolean isSeen) {
		this.isSeen = isSeen;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
