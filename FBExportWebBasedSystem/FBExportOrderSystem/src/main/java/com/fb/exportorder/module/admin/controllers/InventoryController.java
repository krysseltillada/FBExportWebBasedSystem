package com.fb.exportorder.module.admin.controllers;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.money.format.MonetaryParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Utilities;

import org.bouncycastle.crypto.digests.MD5Digest;
import org.javamoney.moneta.Money;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.admin.service.InventoryService;
import com.fb.exportorder.utilities.DeleteImage;
import com.fb.exportorder.utilities.UploadImage;


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
	
	@RequestMapping(value = "/admin/add-product/add-preview-images", method = RequestMethod.POST)
	@ResponseBody
	public void addPreviewImages (@RequestParam("qqfile") MultipartFile previewImage,
            @RequestParam("qquuid") String uuid,
            @RequestParam("qqfilename") String fileName,
            @RequestParam(value = "qqpartindex", required = false, defaultValue = "-1") int partIndex,
            @RequestParam(value = "qqtotalparts", required = false, defaultValue = "-1") int totalParts,
            @RequestParam(value = "qqtotalfilesize", required = false, defaultValue = "-1") long totalFileSize,
																 HttpServletResponse response) throws IOException {
		
		  String name = previewImage.getOriginalFilename().substring(0, previewImage.getOriginalFilename().indexOf("."));
		
		  UploadImage.uploadProductImage(name, previewImage);

		  System.out.println("uploading: " + previewImage.getOriginalFilename());
		  System.out.println("uuid " + uuid);
		
		  JSONObject json1 = new JSONObject(); 
          
		  json1.put("success", true);
          response.setCharacterEncoding("UTF-8");
          response.setContentType("text/plain");
          response.getWriter().print(json1);
          response.flushBuffer();
		
	}
	
	@RequestMapping(value = "/admin/add-product/validate", method = RequestMethod.POST)
	@ResponseBody
	public String validate(@RequestParam String productJSONString) {
		
		List<String> errorMessages = null;
		
		try {
			
			JSONObject jsonRawObject = (JSONObject)new JSONParser().parse(productJSONString);
		
		
			errorMessages = inventoryService.validate((String)jsonRawObject.get("isImageEmpty"), 
													  (String)jsonRawObject.get("name"), 
													  (String)jsonRawObject.get("origin"), 
													  (String)jsonRawObject.get("expiredDate"), 
													  (String)jsonRawObject.get("deliveryDate"), 
													  (String)jsonRawObject.get("price"), 
													  (String)jsonRawObject.get("weight"), 
													  (String)jsonRawObject.get("description"), 
													  (String)jsonRawObject.get("supplier"), 
													  (String)jsonRawObject.get("supplierContactNumber"), 
													  (String)jsonRawObject.get("supplierAddress"));	
			
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject validateResponse = new JSONObject();
		
		if (errorMessages.isEmpty()) {
			validateResponse.put("status", "success");
		} else {
			validateResponse.put("status", "error");
			validateResponse.put("message", errorMessages.get(0));
		}
		
		return validateResponse.toJSONString();
		
	}
	
	
	@RequestMapping(value = "/admin/add-product/delete-preview-images/{qquuid}",
		        	method = { RequestMethod.DELETE })
	public void deletePreviewImages(
		        HttpServletRequest request,
		        HttpServletResponse response,
		        @PathVariable("qquuid") String qquuid,
		        @RequestParam("filename") String filename) throws IOException {
		
			System.out.println("uploadDelete() called " + filename);
			
			String name = filename.substring(0, filename.indexOf("."));
			
			System.out.println(name);
			
			DeleteImage.deleteProductImage(name);
			
			response.setStatus(200);
			response.flushBuffer();
			
	}
	
	@RequestMapping(value = "/admin/add-product/add", method = RequestMethod.POST)
	public String addProductAdd (@RequestParam(name = "product-image", required = false) MultipartFile productImage,
							   @RequestParam("product-name") String productName,
							   @RequestParam String origin,
							   @RequestParam("expired-date") String expiredDate,
							   @RequestParam("delivery-date") String deliveryDate,
							   @RequestParam String price,
							   @RequestParam String weight,
							   @RequestParam String description,
							   @RequestParam String supplier,
							   @RequestParam("supplier-contact-number") String 	supplierContactNumber,
							   @RequestParam("supplier-address") String supplierAddress,
							   @RequestParam(name = "post-this-product", required = false) String postThisProduct,
							   Model model) {
		
		  inventoryService.addProduct(productImage, productName, origin, expiredDate, deliveryDate, price, weight, description, supplier, supplierContactNumber, supplierAddress, postThisProduct);
		  
		  return "add-product";
          
	}

}
