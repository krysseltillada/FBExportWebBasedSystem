package com.fb.exportorder.module.admin.controllers;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.money.format.MonetaryParseException;

import org.javamoney.moneta.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.admin.service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping("/admin/inventory")
	public String inventory () {
		return "inventory";
	}
	
	@RequestMapping(value = "/admin/add-product", method = RequestMethod.GET)
	public String addProduct () {
		return "add-product";
	}
	
	@RequestMapping(value = "/admin/add-product/add", method = RequestMethod.POST)
	public String addProductAdd (
								 @RequestParam("product-name") String productName,
								 @RequestParam String origin,
								 @RequestParam("expired-date") String expiredDate,
								 @RequestParam("delivery-date") String deliveryDate,
								 @RequestParam String price,
								 @RequestParam String weight,
								 @RequestParam String description,
								 @RequestParam String supplier,
								 @RequestParam("supplier-contact-number") String supplierContactNumber,
								 @RequestParam("supplier-address") String supplierAddress,
								 @RequestParam("product-image") MultipartFile productImage,
								 @RequestParam("product-preview-images") MultipartFile[] productPreviewImages,
								 @RequestParam(name = "post-this-product", required = false) String postThisProduct) {
		
		System.out.println(productPreviewImages.length);
		
//		List<String> errorMessages = inventoryService.addProduct(productImage,
//																 productName,
//																 origin,
//																 expiredDate,
//																 deliveryDate,
//																 price,
//																 weight,
//																 description,
//																 supplier,
//																 supplierContactNumber,
//																 supplierAddress,
//																 productPreviewImages,
//																 postThisProduct);
//		
//		if (errorMessages.isEmpty()) {
//			
//		}
//		
		
		return "add-product";
		
	}

}
