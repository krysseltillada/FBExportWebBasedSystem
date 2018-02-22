package com.fb.exportorder.module.admin.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;

import javax.money.format.MonetaryParseException;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.javamoney.moneta.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.enums.ProductStatus;
import com.fb.exportorder.module.admin.repository.InventoryRepository;
import com.fb.exportorder.utilities.DeleteImage;
import com.fb.exportorder.utilities.UploadImage;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryRepository inventoryRepository;
	
	@Autowired
	SessionFactory sessionFactory;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public List<String> validate (String isImageEmpty,
								  String productName,
								  String origin,
								  String expiredDate,
								  String deliveryDate,
								  String price,
								  String weight,
								  String description,
								  String supplier,
								  String supplierContactNumber,
								  String supplierAddress) {
		
		List<String> errorMessages = new ArrayList<String>();
		
		if (StringUtils.isNotBlank(isImageEmpty)) {
		
			if (Boolean.parseBoolean(isImageEmpty))
				errorMessages.add("required product image");
			
		}
			
		if (StringUtils.isBlank(productName) || !StringUtils.isAlphaSpace(productName))
			errorMessages.add("product name cannot be empty and cannot contain number or symbols");
		
		if (StringUtils.isBlank(origin) || !StringUtils.isAlphaSpace(origin))
			errorMessages.add("origin cannot be empty and cannot contain symbols");
		
		try {
			
			if (StringUtils.isEmpty(expiredDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(expiredDate);
		} catch (ParseException e) {
			errorMessages.add("invalid expired date");
		}
		
		try {
			Money.of(new BigDecimal(price), "PHP");
		} catch (NumberFormatException e) {
			errorMessages.add("invalid price");
		}
		
		try {
			Double.parseDouble(weight);
		} catch (NumberFormatException e) {
			errorMessages.add("invalid weight");
		}
		
		
		if (StringUtils.isBlank(description))
			errorMessages.add("description cannot be empty");
		
		if (StringUtils.isBlank(supplier))
			errorMessages.add("supplier cannot be empty");
		
		if (!StringUtils.isNumeric(supplierContactNumber) || Long.parseLong(supplierContactNumber) <= 0)
			errorMessages.add("invalid supplier contact number");
		
		
		try {
			
			if (StringUtils.isEmpty(deliveryDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(deliveryDate);
		} catch (ParseException e) {
			errorMessages.add("invalid delivery date");
		}
		
		if (StringUtils.isBlank(supplierAddress))
			errorMessages.add("supplier address cannot be emoty");
		
		return errorMessages;
	}
	
	@Override
	public void addProduct(MultipartFile productImage,
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
			 					   List<String> productImageLinks) {
		
			String name = productImage.getOriginalFilename().substring(0, productImage.getOriginalFilename().indexOf("."));
		
		
			
			Product newProduct = new Product();
			
			
			newProduct.setName(productName);
			newProduct.setOrigin(origin);

			try {
				newProduct.setExpiredDate(dateFormat.parse(expiredDate));
				newProduct.setDateOfDelivery(dateFormat.parse(deliveryDate));
				newProduct.setDateRegistered(Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			newProduct.setPrice(Double.parseDouble(price));
			newProduct.setWeight(Double.parseDouble(weight));
			newProduct.setDescription(description);
			newProduct.setSupplier(supplier);
			newProduct.setSupplierContactNumber(supplierContactNumber);
			newProduct.setSupplierAddress(supplierAddress);
			newProduct.setPreviewImageLinks(productImageLinks);
			newProduct.setStatus(Objects.nonNull(postThisProduct) ? ProductStatus.POSTED : ProductStatus.UNPOSTED);

			newProduct = inventoryRepository.save(newProduct);
			
			String productImageLink = UploadImage.uploadProductImage(Long.toString(newProduct.getProductId()), productImage);
			
			newProduct.setProductImageLink(productImageLink);
			
			inventoryRepository.save(newProduct);
		
	}

	@Override
	public List<Product> getAllProducts() {
		return (List<Product>)inventoryRepository.findAll();
	}

	@Override
	public Product getProductById(long id) {
		return inventoryRepository.findOne(id);
	}

	@Override
	public void deleteProduct(long id) {
		
		Product deletedProduct = inventoryRepository.findOne(id);
		
		String productImageLink = deletedProduct.getProductImageLink();
		String mainProductFilename = productImageLink.substring(productImageLink.lastIndexOf("/") + 1, productImageLink.lastIndexOf("."));
		
		DeleteImage.deleteProductImageNonHash(mainProductFilename);
		
		for (String productPreviewImageLink : deletedProduct.getPreviewImageLinks()) {
			String productPreviewFilename = productPreviewImageLink.substring(productPreviewImageLink.lastIndexOf("/") + 1, productPreviewImageLink.lastIndexOf("."));
			DeleteImage.deleteProductImageNonHash(productPreviewFilename);
		}
		
		inventoryRepository.delete(id);
	}

	@Override
	public void postProduct(long id) {
		
		Product postProduct = inventoryRepository.findOne(id);
		
		postProduct.setStatus(ProductStatus.POSTED);
		
		inventoryRepository.save(postProduct);
		
	}

	@Override
	public void unpostProduct(long id) {

		Product unpostProduct = inventoryRepository.findOne(id);
		
		unpostProduct.setStatus(ProductStatus.UNPOSTED);
		
		inventoryRepository.save(unpostProduct);
		
	}

	@Override
	public void deleteSelectedProduct(List<Long> ids) {
		for (long id : ids) 
			deleteProduct(id);
	}

	@Override
	@Transactional
	public List<Product> filterProducts(Date minDate,
										Date maxDate,
										String dateFilterType,
										ProductStatus status,
										double minPrice,
										double maxPrice,
										double minWeight,
										double maxWeight) {
		
		String dateFilterQuery =  (StringUtils.equals(dateFilterType, "DateExpired")) ?    "p.expiredDate" :
								  (StringUtils.equals(dateFilterType, "DateRegistered")) ? "p.dateRegistered" : 
																						    "p.dateOfDelivery" ;
		
		String statusFilterQuery = (status != ProductStatus.ALL) ? " AND p.status = '" + status.name() + "'": StringUtils.EMPTY;
		
		
		String priceFilterQuery = (minPrice < maxPrice && maxPrice > minPrice) ? " AND p.price BETWEEN :minPrice AND :maxPrice" : StringUtils.EMPTY;
		String weightFilterQuery = (minWeight < maxWeight && maxWeight > minWeight) ? " AND p.weight BETWEEN :minWeight AND :maxWeight" : StringUtils.EMPTY;
		
		Query filterQuery = sessionFactory.getCurrentSession()
					  					  .createQuery("SELECT p FROM Product p WHERE " + dateFilterQuery + " BETWEEN :minDate AND :maxDate " + statusFilterQuery + priceFilterQuery + weightFilterQuery);
		
		System.out.println(filterQuery.getQueryString());
		
		filterQuery.setParameter("minDate", minDate);
		filterQuery.setParameter("maxDate", maxDate);

		if (minPrice < maxPrice && maxPrice > minPrice) {
			filterQuery.setParameter("minPrice", minPrice);
			filterQuery.setParameter("maxPrice", maxPrice);
		}
		
		if (minWeight < maxWeight && maxWeight > minWeight) {
			filterQuery.setParameter("minWeight", minWeight);
			filterQuery.setParameter("maxWeight", maxWeight);
		}
		
		return (List<Product>)filterQuery.list();
		
	}

	@Override
	public void editProduct(long productId, MultipartFile productImage, String productName, String origin, String expiredDate,
			String deliveryDate, String price, String weight, String description, String supplier,
			String supplierContactNumber, String supplierAddress,
			MultipartFile[] previewImages) {
		
			Product editedProduct = inventoryRepository.findOne(productId);
		
			if (!productImage.isEmpty()) {
				
				String prevProductImageLink = editedProduct.getProductImageLink();
				String prevProductImageFilename = prevProductImageLink.substring(prevProductImageLink.lastIndexOf("/") + 1);
				
				System.out.println(prevProductImageFilename);
				
				DeleteImage.deleteProductImageNonHashNonType(prevProductImageFilename);
				editedProduct.setProductImageLink(UploadImage.uploadProductImageNonHash(prevProductImageFilename, 
													  									productImage));
				
			}
			
			editedProduct.setName(productName);
			editedProduct.setOrigin(origin);

			try {
				editedProduct.setExpiredDate(dateFormat.parse(expiredDate));
				editedProduct.setDateOfDelivery(dateFormat.parse(deliveryDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			editedProduct.setPrice(Double.parseDouble(price));
			editedProduct.setWeight(Double.parseDouble(weight));
			editedProduct.setDescription(description);
			editedProduct.setSupplier(supplier);
			editedProduct.setSupplierContactNumber(supplierContactNumber);
			editedProduct.setSupplierAddress(supplierAddress);
			
			for (int i = 0; i != previewImages.length; ++i) {
				
				if (!previewImages[i].isEmpty()) {
					
					String prevProductImageLink = editedProduct.getPreviewImageLinks().get(i);
					
					String prevProductImageFilename = prevProductImageLink.substring(prevProductImageLink.lastIndexOf("/") + 1);
					
					System.out.println(prevProductImageFilename);
					
					DeleteImage.deleteProductImageNonHashNonType(prevProductImageFilename);
					editedProduct.getPreviewImageLinks().set(i, (UploadImage.uploadProductImageNonHash(prevProductImageFilename, 
														  											   previewImages[i])));
					
				}
				
			}
			
			inventoryRepository.save(editedProduct);
		
	}
	
	

}
