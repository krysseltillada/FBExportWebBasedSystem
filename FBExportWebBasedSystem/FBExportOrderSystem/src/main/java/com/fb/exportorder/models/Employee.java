package com.fb.exportorder.models;

import javax.persistence.Entity;

@Entity
public class Employee extends Account {
	
	private String position;

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	
}
