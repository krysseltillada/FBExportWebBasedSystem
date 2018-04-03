package com.fb.exportorder.module.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.enums.ProductStatus;

public interface InventoryService {
	
	List<Product> getAllProducts();
	Product getProductById(long id);
	
	String postProduct (long id);
	void unpostProduct (long id);
	
	List<Product> filterProducts (Date minDate,
								  Date maxDate,
								  String dateFilterType,
								  ProductStatus status,
								  double minPrice,
								  double maxPrice,
								  double minWeight,
								  double maxWeight);
	
	void addProduct (MultipartFile productImage,
					 String productName,
					 String origin,
					 String deliveryDate,
					 String price,
					 String weight,
					 String description,
					 String supplier,
					 String supplierContactNumber,
					 String supplierAddress,
					 String postThisProduct,
					 List<String> productImageLinks);
	
	void editProduct (long productId,
					  MultipartFile productImage, 
					  String productName,
					  String origin,
					  String deliveryDate,
					  String price,
					  String weight,
					  String description,
					  String supplier,
					  String supplierContactNumber,
					  String supplierAddress,
					  MultipartFile[] previewImages);
	
	String updateStockProduct(long id, String weight);

	List<String> validate (String productImage,
						   String productName,
						   String origin,
						   String deliveryDate,
						   String price,
						   String weight,
						   String description,
						   String supplier,
						   String supplierContactNumber,
						   String supplierAddress);
	
	List<Product> getNewLatestProduct(int records, int offset);
	int getNewLatestProductCount();
	
	List<Product> getMostViewedProduct(int records, int offset);
	int getMostViewedProductCount();
	
	List<Product> getMostPopularProduct();
	
	List<Product> searchProduct(String productName, int pageNumber);
	int searchProductCount(String productName);
	
	int getHighestProductPrice();
	
	List<String> getProductsOrigin();
	
	List<Product> searchFilterProductByName(double minPrice, 
											double maxPrice, 
											String origin, 
											String sortType, 
											String name,
											int pageNumber,
											int pageSize);
	
	int getSearchFilterProductCountByName(double minPrice, 
										  double maxPrice, 
										  String origin, 
										  String sortType,
										  String name);
	
}
