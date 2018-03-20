package com.fb.exportorder.module.customer.controllers;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.admin.service.InventoryService;

@Controller
public class SearchResultsController {
	
	@Autowired
	InventoryService inventoryService;
	
	private static final int SEARCH_RESULTS_ITEMS = 6;
	
	@RequestMapping("/search-results")
	public String search(@RequestParam ("q") String productSearch,
						 @RequestParam (required=false, defaultValue="0") int pageNumber, 
											 Model model,
											 HttpSession session) {
		
		if (StringUtils.isBlank(productSearch)) 
			return "redirect:/";
		
			
		List<Product> productSearchedList = inventoryService.searchProduct(productSearch, pageNumber);
		
		int productSearchCount = inventoryService.searchProductCount(productSearch);
		int numberOfPages = (productSearchCount % SEARCH_RESULTS_ITEMS == 0) ? (productSearchCount / SEARCH_RESULTS_ITEMS) - 1 : (productSearchCount / SEARCH_RESULTS_ITEMS);
		
		model.addAttribute("isCustomerLoggedIn", (Objects.nonNull(session.getAttribute("customerName"))));
		model.addAttribute("currentPageCount", pageNumber);
		model.addAttribute("numberOfPages",  numberOfPages);
		model.addAttribute("productSearchCount", productSearchCount);
		model.addAttribute("searchResultsItems", SEARCH_RESULTS_ITEMS);
		model.addAttribute("highestProductPrice", inventoryService.getHighestProductPrice());
		model.addAttribute("productOrigins", inventoryService.getProductsOrigin());
		model.addAttribute(productSearchedList);
		
		
		
		return "search-results";
	}
	
	@RequestMapping("/search-results/filter")
	public String filter(@RequestParam ("q") String productSearch,
						 @RequestParam String sortBy,
						 @RequestParam("priceRange") String priceRange,
						 @RequestParam String origin,
						 @RequestParam (required=false, defaultValue="0") int pageNumber, 
						 Model model,
						 HttpSession session) {
		
		String[] priceRangeArr = priceRange.split(",");
		
		double minPriceD = Double.parseDouble(priceRangeArr[0]);
		double maxPriceD = Double.parseDouble(priceRangeArr[1]);
		
		List<Product> productSearchedList = inventoryService.searchFilterProductByName(minPriceD, 
																					   maxPriceD, 
																					   origin, 
																					   sortBy, 
																					   productSearch, 
																					   pageNumber * SEARCH_RESULTS_ITEMS, SEARCH_RESULTS_ITEMS);
		
		int productSearchCount = inventoryService.getSearchFilterProductCountByName(minPriceD, maxPriceD, origin, sortBy, productSearch);
		int numberOfPages = (productSearchCount % SEARCH_RESULTS_ITEMS == 0) ? (productSearchCount / SEARCH_RESULTS_ITEMS) - 1 : (productSearchCount / SEARCH_RESULTS_ITEMS);
		
		model.addAttribute("isCustomerLoggedIn", (Objects.nonNull(session.getAttribute("customerName"))));
		model.addAttribute("currentPageCount", pageNumber);
		model.addAttribute("numberOfPages",  numberOfPages);
		model.addAttribute("productSearchCount", productSearchCount);
		model.addAttribute("searchResultsItems", SEARCH_RESULTS_ITEMS);
		model.addAttribute("highestProductPrice", inventoryService.getHighestProductPrice());
		model.addAttribute("productOrigins", inventoryService.getProductsOrigin());
		model.addAttribute(productSearchedList);
		
		
		return "search-results";
	}
	
}
