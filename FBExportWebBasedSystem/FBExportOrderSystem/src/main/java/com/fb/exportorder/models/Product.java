package com.fb.exportorder.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.javamoney.moneta.Money;

import com.fb.exportorder.models.customer.Rating;
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
	
	private double price;
	
	private double weight;
	
	@Temporal(TemporalType.DATE)
	private Date dateRegistered;
	
	@Temporal(TemporalType.DATE)
	private Date dateOfDelivery;
	
	@Temporal(TemporalType.DATE)
	private Date datePosted;
	
	@Enumerated(EnumType.STRING)
	private ProductStatus status;
	
	@Lob
	private String description;
	
	private String productImageLink;
	
	private boolean isPosted;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> previewImageLinks;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Rating rating;
	
	@OneToMany(mappedBy="productStockId")
	private List<ProductStock> productStocks;

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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
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
	
	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public Date getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(Date datePosted) {
		this.datePosted = datePosted;
	}
	
	public List<ProductStock> getProductStocks() {
		return productStocks;
	}

	public void setProductStocks(List<ProductStock> productStocks) {
		this.productStocks = productStocks;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", origin=" + origin + ", supplier=" + supplier
				+ ", supplierContactNumber=" + supplierContactNumber + ", supplierAddress=" + supplierAddress
				+ ", price=" + price + ", weight=" + weight + ", dateRegistered=" + dateRegistered + ", dateOfDelivery="
				+ dateOfDelivery + ", status=" + status + ", description="
				+ description + ", productImageLink=" + productImageLink + ", isPosted=" + isPosted
				+ ", previewImageLinks=" + previewImageLinks + "]";
	}
	
	

}
