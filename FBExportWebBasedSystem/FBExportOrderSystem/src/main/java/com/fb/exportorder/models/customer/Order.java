package com.fb.exportorder.models.customer;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.javamoney.moneta.Money;

import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;

@Entity(name = "`Order`")
@Table(name = "`Order`")
public class Order	 {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long orderId;
	
	@ManyToOne
	Customer customer;
	
	@OneToOne
	Cart cart;
	
	@Enumerated(EnumType.STRING)
	PaymentMethod paymentMethod;
	
	@Enumerated(EnumType.STRING)
	OrderStatus orderStatus;
	
	@OneToOne
	ShippingAddress shippingAddress;
	
	@OneToOne
	Shipping shipping;
	
	private int totalItems;
	private double totalWeight;
	
	private double totalPrice;
	
	@Temporal(TemporalType.DATE)
	private Date dateOrdered;

	public Long getOrderId() {
		return orderId;
	}
	
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public double getTotalWeight() {
		return totalWeight;
	}

	public void setTotalWeight(double totalWeight) {
		this.totalWeight = totalWeight;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getDateOrdered() {
		return dateOrdered;
	}

	public void setDateOrdered(Date dateOrdered) {
		this.dateOrdered = dateOrdered;
	}
	
	
}
