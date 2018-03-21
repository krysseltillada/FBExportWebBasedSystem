package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fb.exportorder.models.customer.Weight;

@Entity
public class ProductStock {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long productStockId;
	
	private String productName;
	
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
