package com.fb.exportorder.module.customer.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.module.customer.service.ProductService;

@Controller
public class ViewProductController {
	
	@Autowired
	private ProductService productService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy");
	
	@RequestMapping(value="/view-product/{id}", method=RequestMethod.GET)
	public String viewProduct(@PathVariable long id,
							  Model model) {
		Product product = productService.findProductById(id);
		
		Date datePosted = product.getDatePosted();
		
		if(product == null) {
			return "redirect:/";
		}
		
		model.addAttribute("product", product);
		model.addAttribute("datePosted", dateFormat.format(datePosted).toString());
		return "view-product";
	}
}
