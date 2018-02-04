package com.fb.exportorder.models.customer;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.ShippingAddress;

@Entity
public class Customer extends Account {
	
	@OneToMany(cascade=CascadeType.ALL)
	private List<Order> orders;
	
	@OneToOne
	private Cart cart;
	
	@ElementCollection
	List <ShippingAddress> shippingAddress;

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
		return shippingAddress;
	}

	public void setShippingAddress(List<ShippingAddress> shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
}
