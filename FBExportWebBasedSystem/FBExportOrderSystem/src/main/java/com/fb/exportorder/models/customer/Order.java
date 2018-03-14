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

import org.hibernate.annotations.Cascade;
import org.javamoney.moneta.Money;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;

@Entity(name = "Orders")
@Table(name = "Orders")
public class Order	 {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long orderId;
	
	@ManyToOne
	private Customer customer;
	
	@OneToOne
	@Cascade(value=org.hibernate.annotations.CascadeType.ALL)
	private Cart cart;
	
	@Enumerated(EnumType.STRING)
	private PaymentMethod paymentMethod;
	
	@Enumerated(EnumType.STRING)
	private OrderStatus orderStatus;
	
	@OneToOne
	private ShippingAddress shippingAddress;
	
	@OneToOne(orphanRemoval = true)
	@Cascade(value=org.hibernate.annotations.CascadeType.ALL)
	private Shipping shipping;
	
	private String message;
	private String reason;
	private String review;
	
	private int totalItems;
	private double totalWeight;
	
	private double totalPrice;
	
	@Temporal(TemporalType.DATE)
	private Date dateOrdered;
	
	@Temporal(TemporalType.DATE)
	private Date datePaid;
	
	@Temporal(TemporalType.DATE)
	private Date dateReceived;
	
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
	

	public Date getDatePaid() {
		return datePaid;
	}

	public void setDatePaid(Date datePaid) {
		this.datePaid = datePaid;
	}

	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getDateReceived() {
		return dateReceived;
	}

	public void setDateReceived(Date dateReceived) {
		this.dateReceived = dateReceived;
	}
	
	
}
