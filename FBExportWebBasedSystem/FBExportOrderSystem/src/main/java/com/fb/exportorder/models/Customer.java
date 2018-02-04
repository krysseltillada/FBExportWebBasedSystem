package com.fb.exportorder.models;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Customer extends Account {
	
	@OneToMany(mappedBy="customer")
	private Collection<Orders> orders;
	
}
