package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.service.CustomerSignUpService;

@Controller
public class SignUpController {
	
	@Autowired
	CustomerSignUpService customerSignUpService;
	
	@Autowired
	CustomerRepository cr;
	
	@RequestMapping("/sign-up")
	public String signUp() {
		return "sign-up";
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register (@RequestParam("profile-image") MultipartFile profileImage,
							String username, 
			 				String password,
			 				String firstname,
			 				String middlename,
			 				String lastname,
			 				String gender,
			 				int age,
			 				String country,
			 				String city,
			 				String address,
			 				String zipcode,
			 				@RequestParam("country-code") String countryCode,
			 				@RequestParam("phone-number") String phoneNumber,
			 				@RequestParam("email-address") String emailAddress, 
			 				@RequestParam(name = "g-recaptcha-response", required=false) String recaptcha, Model model, HttpServletRequest request) {
		
		System.out.println("tae");
		
		
		Customer newCustomer = new Customer();
		Address customerAddress = new Address();
		Contact customerContact = new Contact(); 
		
		newCustomer.setUsername(username);
		newCustomer.setPassword(password);
		
		newCustomer.setFirstname(firstname);
		newCustomer.setMiddlename(middlename);
		newCustomer.setLastname(lastname);
		
		newCustomer.setGender((gender.equals("Male") ? Gender.MALE : Gender.FEMALE));
		
		newCustomer.setAge(age);
		
		customerAddress.setAddress(address);
		customerAddress.setCountry(country);
		customerAddress.setCity(city);
		customerAddress.setZipCode(zipcode);
		customerContact.setCountryCode(countryCode);
		customerContact.setPhoneNumber(phoneNumber);
		customerContact.setEmailAddress(emailAddress);
		
		newCustomer.setAddress(customerAddress);
		newCustomer.setContact(customerContact);
		
		List<String> errorMessages = customerSignUpService.register(newCustomer, 
																	recaptcha, 
																	request.getRemoteAddr(),
																	profileImage);
		
		
		if (!errorMessages.isEmpty()) {
			model.addAttribute("errorMessages", errorMessages);
			return "sign-up";
		} 
		
		return "redirect:login";
		
	}
	
	@RequestMapping ("/load-users") 
	public String loadUsers () {
		
		for (int i = 0; i != 100; ++i)
			cr.save(new Customer());
		
		return "redirect:/";
	}
	
}
