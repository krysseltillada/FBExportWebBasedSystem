package com.fb.exportorder.module.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="tblCustomers")
public class Customer extends Account {
	
	private String country;
	private String zipCode;
	private String city;
	

}
