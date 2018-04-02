package com.fb.exportorder.module.customer.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.autoconfigure.web.ErrorController {
 
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request,
			  				    Model model) {
	      Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
	      String errorHeader = StringUtils.EMPTY;
	      String errorMessage = StringUtils.EMPTY;
	      
	      System.out.println("status code: " + statusCode);
	      
	      switch (statusCode) {
	      case 404:
	    	  errorHeader = "Oops! 404 Page not found";
	    	  errorMessage = "The page you requested was not found";
	    	  break;
	      case 403:
	    	  errorHeader = "Oops! 403 Unauthorized access";
	    	  errorMessage = "Unauthorized access";
	    	  break;
	      case 500:
	    	  errorHeader = "Oops! 500 Internal Server error";
	    	  errorMessage = "There was a problem on the server";
	    	  break;
	      default:
	    	  errorHeader = "Oops! " + statusCode + " Status code";
	      }
	      
	      model.addAttribute("errorHeader", errorHeader);
	      model.addAttribute("errorMessage", errorMessage);
	      
	      return "error-page";
	}

	@Override
	public String getErrorPath() {
	      return "/error";
	}
	
}
