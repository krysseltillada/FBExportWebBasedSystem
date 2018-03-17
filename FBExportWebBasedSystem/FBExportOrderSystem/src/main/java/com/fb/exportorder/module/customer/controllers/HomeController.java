package com.fb.exportorder.module.customer.controllers;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Weight;
import com.fb.exportorder.models.enums.WeightType;
import com.fb.exportorder.module.admin.service.InventoryService;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class HomeController {

	@Autowired
	InventoryService inventoryService;
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	@ResponseBody
	public String addToCart(@RequestParam String customerCartJSON,
										  HttpSession session) {
		
		long itemId = 0;
		
		try {
			
			System.out.println(customerCartJSON);
			
			JSONObject customerCartItem = (JSONObject) new JSONParser().parse(customerCartJSON);
			
			Item newItem = new Item();
			Weight newWeight = new Weight();
			
			WeightType weightType = WeightType.valueOf((String)customerCartItem.get("weightType"));
					
			newWeight.setWeight(Integer.parseInt((String)customerCartItem.get("totalWeight")));
			newWeight.setWeightType(weightType);
			
			newItem.setPrice(Double.parseDouble((String)customerCartItem.get("totalPrice")));
			newItem.setWeight(newWeight);
			newItem.setProduct(inventoryService.getProductById(Long.parseLong((String)customerCartItem.get("productId"))));
			
			itemId = customerService.addToCart(newItem, (long)session.getAttribute("customerId"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject response = new JSONObject();
		
		response.put("itemId", itemId);
		
		return response.toJSONString();
	}
	
	@RequestMapping(value = "/remove-to-cart", method = RequestMethod.POST)
	@ResponseBody
	public String removeToCart(@RequestParam String itemId, HttpSession session) {

		customerService.removeToCart(customerService.getItemById(Long.parseLong(itemId)), 
																 (long)session.getAttribute("customerId"));
		
		return "";
	}
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session) {
		
		model.addAttribute("isCustomerLoggedIn", (Objects.nonNull(session.getAttribute("customerName"))));
		
		model.addAttribute("mostPopularProductList", inventoryService.getMostPopularProduct());
		
		model.addAttribute("mostViewedProductCount", inventoryService.getMostViewedProductCount());
		model.addAttribute("mostViewedProductList", inventoryService.getMostViewedProduct(3, 0));
		
		model.addAttribute("newLatestProductCount", inventoryService.getNewLatestProductCount());
		model.addAttribute("newLatestProductList", inventoryService.getNewLatestProduct(3, 0));
		
		return "home";
	}
	
	@RequestMapping("/see-more-newest-products")
	@ResponseBody
	public List<Product> seeMoreNewestProducts (@RequestParam String pageCount) {
		return inventoryService.getNewLatestProduct(3, Integer.parseInt(pageCount));
	}
	
	@RequestMapping("/see-more-most-viewed-products")
	@ResponseBody
	public List<Product> seeMoreMostViewedProducts (@RequestParam String pageCount) {
		return inventoryService.getMostViewedProduct(3, Integer.parseInt(pageCount));
	}
	
	
	
}
