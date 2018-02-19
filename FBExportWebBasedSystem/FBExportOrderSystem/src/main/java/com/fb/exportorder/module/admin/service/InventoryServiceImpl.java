package com.fb.exportorder.module.admin.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.money.format.MonetaryParseException;

import org.apache.commons.lang3.StringUtils;
import org.javamoney.moneta.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.admin.repository.InventoryRepository;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryRepository inventoryRepository;
	
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
		
		if (Boolean.parseBoolean(isImageEmpty))
			errorMessages.add("required product image");
		 
		if (!StringUtils.isAlpha(productName))
			errorMessages.add("product name cannot be empty and cannot contain number or symbols");
		
		if (!StringUtils.isAlphanumeric(origin))
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
		
		if (!StringUtils.isNumeric(supplierContactNumber))
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
			 					   String postThisProduct) {

			
			System.out.println("validation success");
		
	}

}
