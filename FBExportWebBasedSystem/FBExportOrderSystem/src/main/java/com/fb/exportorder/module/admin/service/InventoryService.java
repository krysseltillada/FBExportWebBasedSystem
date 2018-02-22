package com.fb.exportorder.module.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.enums.ProductStatus;

public interface InventoryService {
	
	public List<Product> getAllProducts();
	public Product getProductById(long id);
	
	public void deleteSelectedProduct (List<Long> ids);
	
	public void postProduct (long id);
	public void unpostProduct (long id);
	
	public void deleteProduct(long id);
	
	public List<Product> filterProducts (Date minDate,
										 Date maxDate,
										 String dateFilterType,
										 ProductStatus status,
										 double minPrice,
										 double maxPrice,
										 double minWeight,
										 double maxWeight);
	
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
								   String postThisProduct,
								   List<String> productImageLinks);
	
	public void editProduct (long productId,
							 MultipartFile productImage, 
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
							 MultipartFile[] previewImages);
	
	public List<String> validate (String productImage,
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
