package com.fb.exportorder.models.customer;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.ShippingAddress;

@Entity
public class Customer extends Account {
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="customer")
	private List<Order> orders;
	
	@OneToOne
	private Cart cart;
	
	@OneToMany(cascade=CascadeType.ALL)
	List <ShippingAddress> shippingAddresses;

	@OneToMany(cascade=CascadeType.ALL)
	List <Activity> activities;
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<ShippingAddress> getShippingAddress() {
		return shippingAddresses;
	}

	public void setShippingAddress(List<ShippingAddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}
	
}
