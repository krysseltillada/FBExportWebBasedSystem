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

import com.fb.exportorder.models.enums.ActionType;

@Entity
public class SystemLog {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long systemLogId;
	
	@Enumerated(EnumType.STRING)
	ActionType actionType;
	
	private String description;
	
	@Temporal(TemporalType.DATE)
	private Date dateOccured;
	
	@Temporal(TemporalType.TIME)
	private Date timeOccured;

	public Long getSystemLogId() {
		return systemLogId;
	}

	public void setSystemLogId(Long systemLogId) {
		this.systemLogId = systemLogId;
	}

	public ActionType getActionType() {
		return actionType;
	}

	public void setActionType(ActionType actionType) {
		this.actionType = actionType;
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
	
	
	
}
