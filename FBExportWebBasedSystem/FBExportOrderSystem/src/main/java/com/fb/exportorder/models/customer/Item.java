package com.fb.exportorder.models.customer;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.fb.exportorder.models.Product;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long itemId;
	
	@OneToOne
	private Product product;

	private double price;
	
	@Embedded
	private Weight weight;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Weight getWeight() {
		return weight;
	}
	public void setWeight(Weight weight) {
		this.weight = weight;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	
	
	
	

}
