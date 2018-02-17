package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;

public interface InventoryService {
	public List<String> addProduct (MultipartFile productImage,
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
								   MultipartFile[] productPreviewImages,
								   String postThisProduct);
}
