package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fb.exportorder.models.customer.Weight;

@Entity
public class ProductStock {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long productStockId;
	
	@ManyToOne
	@JoinColumn(name="product_id", nullable=false)
	@JsonIgnore
	private Product product;
	
	@Embedded
	private Weight stock;
	
	@Temporal(TemporalType.DATE)
	private Date date;

	public Long getProductStockId() {
		return productStockId;
	}

	public void setProductStockId(Long productStockId) {
		this.productStockId = productStockId;
	}
	
	@JsonIgnore
	public Product getProduct() {
		return product;
	}

	@JsonProperty
	public void setProduct(Product product) {
		this.product = product;
	}

	public Weight getStock() {
		return stock;
	}

	public void setStock(Weight stock) {
		this.stock = stock;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
