package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;

public interface InventoryService {
	public void addProduct (MultipartFile productImage,
								   String productName,
								   String origin,
								   String expiredDate,
								   String deliveryDate,
								   String price,
								   String weight,
								   String description,
								   String supplier,
								   String supplierContactNumber,
								   String supplierAddress,
								   String postThisProduct);
	
	public List<String> validate (MultipartFile productImage,
			   String productName,
			   String origin,
			   String expiredDate,
			   String deliveryDate,
			   String price,
			   String weight,
			   String description,
			   String supplier,
			   String supplierContactNumber,
			   String supplierAddress);
}
