package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.customer.service.CustomerSignUpService;

@Controller
public class SignUpController {
	
	@Autowired
	CustomerSignUpService customerSignUpService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/sign-up")
	public String signUp() {
		return "sign-up";
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register (@RequestParam("username") String username, 
			 				@RequestParam("password") String password,
			 				@RequestParam("firstname") String firstname,
			 				@RequestParam("middlename") String middlename,
			 				@RequestParam("lastname") String lastname,
			 				@RequestParam("gender") String gender,
			 				@RequestParam("age") int age,
			 				@RequestParam("country") String country,
			 				@RequestParam("city") String city,
			 				@RequestParam("address") String address,
			 				@RequestParam("zipcode") String zipcode,
			 				@RequestParam("country-code") String countryCode,
			 				@RequestParam("phone-number") String phoneNumber,
			 				@RequestParam("email-address") String emailAddress, Model model) {
		
		Customer newCustomer = new Customer();
		Address customerAddress = new Address();
		Contact customerContact = new Contact(); 
		
		newCustomer.setUsername(username);
		newCustomer.setPassword(passwordEncoder.encode(password));
		
		newCustomer.setFirstname(firstname);
		newCustomer.setMiddlename(middlename);
		newCustomer.setLastname(lastname);
		
		newCustomer.setGender((gender.equals("Male") ? Gender.MALE : Gender.FEMALE));
		
		newCustomer.setAge(age);
		
		customerAddress.setCountry(country);
		customerAddress.setCity(city);
		customerAddress.setZipCode(zipcode);
		
		customerContact.setPhoneNumber(countryCode + phoneNumber);
		customerContact.setEmailAddress(emailAddress);
		
		newCustomer.setAddress(customerAddress);
		newCustomer.setContact(customerContact);
		
		List<String> errorMessages = customerSignUpService.register(newCustomer);
		
		if (!errorMessages.isEmpty())
			model.addAttribute("errorMessages", errorMessages);
		
		return "sign-up";
		
	}
	
}
