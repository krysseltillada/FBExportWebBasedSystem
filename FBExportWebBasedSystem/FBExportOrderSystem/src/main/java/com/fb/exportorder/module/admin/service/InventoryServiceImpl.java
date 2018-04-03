package com.fb.exportorder.module.admin.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.javamoney.moneta.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.ProductStock;
import com.fb.exportorder.models.customer.Rating;
import com.fb.exportorder.models.customer.Weight;
import com.fb.exportorder.models.enums.ProductStatus;
import com.fb.exportorder.models.enums.WeightType;
import com.fb.exportorder.module.admin.repository.InventoryRepository;
import com.fb.exportorder.module.admin.repository.ProductStocksRepository;
import com.fb.exportorder.utilities.DeleteImage;
import com.fb.exportorder.utilities.UploadImage;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryRepository inventoryRepository;
	
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private ProductStocksRepository productStocksRepository;
	
	private SimpleDateFormat userDateFormat = new SimpleDateFormat("MMMMM d, yyyy");
	
	public List<String> validate (String isImageEmpty,
								  String productName,
								  String origin,
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
			errorMessages.add("origin cannot be empty and cannot contain number or symbols");
		
		
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
			
			userDateFormat.parse(deliveryDate);
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
			 					   String deliveryDate,
			 					   String price,
			 					   String weight,
			 					   String description,
			 					   String supplier,
			 					   String supplierContactNumber,
			 					   String supplierAddress,
			 					   String postThisProduct,
			 					   List<String> productImageLinks) {

			Product newProduct = new Product();
			
			
			newProduct.setName(productName);
			newProduct.setOrigin(origin);

			try {
				newProduct.setDateOfDelivery(userDateFormat.parse(deliveryDate));
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

			if (newProduct.getStatus() == ProductStatus.POSTED)
				newProduct.setDatePosted(Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
			
			if(newProduct.getWeight() <= 0.0)
				newProduct.setStatus(ProductStatus.OUT_OF_STOCK);
			
			Rating rating = new Rating();
			
			rating.setProduct(newProduct);
			
			newProduct.setRating(rating);
			
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
	public String updateStockProduct(long id, String weight) {
		
		if(StringUtils.isEmpty(weight))
			return "Please fill stock weight";
		
		try {
			Product updateStockProduct = inventoryRepository.findOne(id);
			
			double stockWeight = Double.parseDouble(weight) + updateStockProduct.getWeight();
			updateStockProduct.setWeight(stockWeight);
			
			ProductStock stock = new ProductStock();
			
			Weight weightStock = new Weight();
			weightStock.setWeight(Double.parseDouble(weight));
			weightStock.setWeightType(WeightType.KILO);
			
			stock.setProduct(updateStockProduct);
			stock.setStock(weightStock);
			stock.setDate(new Date());
			
			productStocksRepository.save(stock);
			inventoryRepository.save(updateStockProduct);
			
		}catch(NumberFormatException e) {
			return "Invalid stock weight";
		}
		
		
		return "";
	}

	@Override
	public String postProduct(long id) {
		
		Product postProduct = inventoryRepository.findOne(id);
		
		String result; 
		
		if(postProduct.getWeight() <= 0) {
			postProduct.setStatus(ProductStatus.OUT_OF_STOCK);
			result = "Out of Stock";
		}else {
			postProduct.setStatus(ProductStatus.POSTED);
			result = "Posted";
		}
		postProduct.setDatePosted(Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
		
		inventoryRepository.save(postProduct);
		
		return result;
	}

	@Override
	public void unpostProduct(long id) {

		Product unpostProduct = inventoryRepository.findOne(id);
		
		unpostProduct.setStatus(ProductStatus.UNPOSTED);
		
		inventoryRepository.save(unpostProduct);
		
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
		
		
		String dateFilterQuery =  (StringUtils.equals(dateFilterType, "DateRegistered")) ?  "p.dateRegistered" : 
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
		
		List<Product> filteredProducts = (List<Product>)filterQuery.list();
		
		for (Product p : filteredProducts) {
			p.getRating().getReviews().size();
			p.getProductStocks().size();
		}
		return filteredProducts;
		
	}

	@Override
	public void editProduct(long productId, MultipartFile productImage, String productName, String origin, 
			String deliveryDate, String price, String weight, String description, String supplier,
			String supplierContactNumber, String supplierAddress,
			MultipartFile[] previewImages) {
		
			Product editedProduct = inventoryRepository.findOne(productId);
		
			if (!productImage.isEmpty()) {
				
				String prevProductImageLink = editedProduct.getProductImageLink();
				String prevProductImageFilename = prevProductImageLink.substring(prevProductImageLink.lastIndexOf("/") + 1, prevProductImageLink.lastIndexOf("."));
				
				System.out.println(prevProductImageFilename);
				
				DeleteImage.deleteProductImageNonHashNonType(prevProductImageFilename);
				editedProduct.setProductImageLink(UploadImage.uploadProductImageNonHash(prevProductImageFilename, 
													  									productImage));
				
			}
			
			editedProduct.setName(productName);
			editedProduct.setOrigin(origin);

			try {
				editedProduct.setDateOfDelivery(userDateFormat.parse(deliveryDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			editedProduct.setPrice(Double.parseDouble(price));
			editedProduct.setWeight(Double.parseDouble(weight));
			editedProduct.setDescription(description);
			editedProduct.setSupplier(supplier);
			editedProduct.setSupplierContactNumber(supplierContactNumber);
			editedProduct.setSupplierAddress(supplierAddress);
			
			if(editedProduct.getWeight() <= 0.0) 
				editedProduct.setStatus(ProductStatus.OUT_OF_STOCK);
			else
				editedProduct.setStatus(ProductStatus.POSTED);
			
			for (int i = 0; i != previewImages.length; ++i) {
				
				if (!previewImages[i].isEmpty()) {
					
					String prevProductImageLink = editedProduct.getPreviewImageLinks().get(i);
					
					String prevProductImageFilename = prevProductImageLink.substring(prevProductImageLink.lastIndexOf("/") + 1, prevProductImageLink.lastIndexOf("."));
					
					System.out.println(prevProductImageFilename);
					
					DeleteImage.deleteProductImageNonHashNonType(prevProductImageFilename);
					editedProduct.getPreviewImageLinks().set(i, (UploadImage.uploadProductImageNonHash(prevProductImageFilename, 
														  											   previewImages[i])));
					
				}
				
			}
			
			inventoryRepository.save(editedProduct);
		
	}

	// MAKE PAGINATION ON NEWEST WORK
	
	@Override
	public List<Product> getNewLatestProduct(int records, int offset) {
		
		List<Object[]> rawResultSet = inventoryRepository.getLatestNewProductsRecordsAndOffset(records, offset);
		List<Product> productList = new ArrayList<Product>();
		
		
		for (Object[] rawRow : rawResultSet) {
			
			Product product = new Product();
			
			product.setProductId(((BigInteger)rawRow[0]).longValue());
			product.setDateOfDelivery((Date)rawRow[1]);
			product.setDateRegistered((Date)rawRow[2]);
			product.setDatePosted((Date)rawRow[3]);
			product.setDescription((String)rawRow[4]);
			product.setPosted((boolean)rawRow[5]); 
			product.setName((String)rawRow[6]);
			product.setOrigin((String)rawRow[7]);
			product.setPrice((double)rawRow[8]);
			product.setProductImageLink((String)rawRow[9]);
			
			product.setStatus(ProductStatus.valueOf((String)rawRow[10]));
			product.setSupplier((String)rawRow[11]);
			product.setSupplierAddress((String)rawRow[12]);
			product.setSupplierContactNumber((String)rawRow[13]);
			product.setWeight((double)rawRow[14]);

			productList.add(product);
			
		}
		
		return productList;
	}

	@Override
	public int getNewLatestProductCount() {
		return (int) inventoryRepository.getLatestNewProductsCount();
	}

	@Override
	public List<Product> getMostViewedProduct(int records, int offset) {
		List<Object[]> rawResultSet = inventoryRepository.getMostViewedProductsRecordsAndOffset(records, offset);
		List<Product> productList = new ArrayList<Product>();
		
		
		for (Object[] rawRow : rawResultSet) {
			
			Product product = new Product();
			
			product.setProductId(((BigInteger)rawRow[0]).longValue());
			product.setDateOfDelivery((Date)rawRow[1]);
			product.setDateRegistered((Date)rawRow[2]);
			product.setDatePosted((Date)rawRow[3]);
			product.setDescription((String)rawRow[4]);
			product.setPosted((boolean)rawRow[5]); 
			product.setName((String)rawRow[6]);
			product.setOrigin((String)rawRow[7]);
			product.setPrice((double)rawRow[8]);
			product.setProductImageLink((String)rawRow[9]);
			
			product.setStatus(ProductStatus.valueOf((String)rawRow[10]));
			product.setSupplier((String)rawRow[11]);
			product.setSupplierAddress((String)rawRow[12]);
			product.setSupplierContactNumber((String)rawRow[13]);
			product.setWeight((double)rawRow[14]);

			productList.add(product);
			
			
		}
		
		return productList;
	}

	@Override
	public int getMostViewedProductCount() {
		return (int) inventoryRepository.getMostViewedProductsCount();
	}

	@Override
	public List<Product> getMostPopularProduct() {
		return inventoryRepository.getMostPopularProducts(new PageRequest(0, 3));
	}

	@Override
	public List<Product> searchProduct(String productName, int pageNumber) {
		return inventoryRepository.getProductByName(productName, new PageRequest(pageNumber, 6));
	}

	@Override
	public int searchProductCount(String productName) {
		return inventoryRepository.getProductCountByName(productName);
	}

	@Override
	public int getHighestProductPrice() {
		return inventoryRepository.getHighestProductPrice();
	}

	@Override
	public List<String> getProductsOrigin() {
		return inventoryRepository.getProductsOrigin();
	}

	@Override
	@Transactional
	public List<Product> searchFilterProductByName(double minPrice, double maxPrice, String origin, String sortType,
			String name, int pageNumber, int pageSize) {
		
		String sortTypeField = (StringUtils.equals(sortType, "p-high-to-low") ? "p.price DESC" :
								StringUtils.equals(sortType, "p-low-to-high") ? "p.price ASC" :
								StringUtils.equals(sortType, "r-high-to-low") ? "p.rating.rate DESC" :
																				"p.rating.rate ASC");
		
		String originStatement = (!StringUtils.equals(origin, "none") ? " AND p.origin = '" + origin + "'" : StringUtils.EMPTY);
		
		String searchFilterProductJPQLStatement 
			= "SELECT p FROM Product p WHERE p.name LIKE '%" + name + "%' " + originStatement + " AND p.price " + 
			  "BETWEEN " + minPrice +  " AND " + maxPrice + " ORDER BY " + sortTypeField;
		
		System.out.println(searchFilterProductJPQLStatement);
		
		
		Query searchFilterProductQuery = sessionFactory.getCurrentSession()
													   .createQuery(searchFilterProductJPQLStatement);
		
		searchFilterProductQuery.setFirstResult(pageNumber);
		searchFilterProductQuery.setMaxResults(pageSize);
		
		return (List<Product>) searchFilterProductQuery.list();
	}

	@Override
	@Transactional
	public int getSearchFilterProductCountByName(double minPrice, double maxPrice, String origin,
			String sortType, String name) {
		
		String sortTypeField = (StringUtils.equals(sortType, "p-high-to-low") ? "p.price DESC" :
								StringUtils.equals(sortType, "p-low-to-high") ? "p.price ASC" :
								StringUtils.equals(sortType, "r-high-to-low") ? "p.rating.rate DESC" :
																				"p.rating.rate ASC");

		String originStatement = (!StringUtils.equals(origin, "none") ? " AND p.origin = '" + origin + "'" : StringUtils.EMPTY);
		
		String searchFilterProductJPQLStatement 
			= "SELECT p FROM Product p WHERE p.name LIKE '%" + name + "%' " + originStatement + " AND p.price " + 
			"BETWEEN " + minPrice +  " AND " + maxPrice + " ORDER BY " + sortTypeField;
		
		System.out.println(searchFilterProductJPQLStatement);
		
		
		Query searchFilterProductQuery = sessionFactory.getCurrentSession()
										   .createQuery(searchFilterProductJPQLStatement);
		
		
		return ((List<Product>) searchFilterProductQuery.list()).size();
	}

}
