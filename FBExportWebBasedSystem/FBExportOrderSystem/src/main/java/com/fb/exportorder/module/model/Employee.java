package com.fb.exportorder.module.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity	
@Table(name="tblEmployees")
public class Employee extends Account {
	private String position;
	private String department;
}
