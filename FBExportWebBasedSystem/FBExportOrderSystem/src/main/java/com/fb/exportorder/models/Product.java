package com.fb.exportorder.models;

import java.util.Date;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.javamoney.moneta.Money;

import com.fb.exportorder.models.enums.ProductStatus;

@Entity
public class Product {
	
	@Id
	@GeneratedValue
	private Long productId;
	
	private String name;
	private String origin;
	private String supplier;
	private String supplierContactNumber;
	private String supplierAddress;
	
	private Money price;
	
	private double weight;
	
	@Temporal(TemporalType.DATE)
	private Date dateRegistered;
	
	@Temporal(TemporalType.DATE)
	private Date dateOfDelivery;
	
	@Temporal(TemporalType.DATE)
	private Date expiredDate;
	
	@Enumerated(EnumType.STRING)
	private ProductStatus status;
	
	private String description;
	
	private String productImageLink;
	
	private boolean isPosted;
	
	@ElementCollection
	private List<String> previewImageLinks;

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getSupplierContactNumber() {
		return supplierContactNumber;
	}

	public void setSupplierContactNumber(String supplierContactNumber) {
		this.supplierContactNumber = supplierContactNumber;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}

	public Money getPrice() {
		return price;
	}

	public void setPrice(Money price) {
		this.price = price;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public Date getDateRegistered() {
		return dateRegistered;
	}

	public void setDateRegistered(Date dateRegistered) {
		this.dateRegistered = dateRegistered;
	}

	public Date getDateOfDelivery() {
		return dateOfDelivery;
	}

	public void setDateOfDelivery(Date dateOfDelivery) {
		this.dateOfDelivery = dateOfDelivery;
	}

	public Date getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}

	public ProductStatus getStatus() {
		return status;
	}

	public void setStatus(ProductStatus status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProductImageLink() {
		return productImageLink;
	}

	public void setProductImageLink(String productImageLink) {
		this.productImageLink = productImageLink;
	}

	public List<String> getPreviewImageLinks() {
		return previewImageLinks;
	}

	public void setPreviewImageLinks(List<String> previewImageLinks) {
		this.previewImageLinks = previewImageLinks;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isPosted() {
		return isPosted;
	}

	public void setPosted(boolean isPosted) {
		this.isPosted = isPosted;
	}
	
	

}
