package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.fb.exportorder.module.customer.service.AccountSettingsService;
import com.fb.exportorder.module.customer.service.CustomerService;

@Controller
public class AccountSettingsController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	AccountSettingsService accountSettingsService;
	
	@RequestMapping("/account-settings")
	public String accountSettings(Model model, HttpSession session) {
		model.addAttribute(customerService.getCustomerById((Long)session.getAttribute("customerId")));
		
		return "account-settings";
	}
	
	@RequestMapping(value = "/edit-account", method = RequestMethod.POST)
	public String editAccount (@RequestParam("profile-image") MultipartFile profileImage,
															  String username, 
															  String oldpassword,
															  String newpassword,
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
															  Model model, HttpSession session) {
		
		Customer editedCustomer = new Customer();
		Address editedAddress = new Address();
		Contact editedContact = new Contact();
		
		long customerId = (long)session.getAttribute("customerId");
		
		editedCustomer.setId(customerId);
		editedCustomer.setUsername(username);
		editedCustomer.setPassword(newpassword);
		editedCustomer.setFirstname(firstname);
		editedCustomer.setMiddlename(middlename);
		editedCustomer.setLastname(lastname);
		editedCustomer.setGender((StringUtils.equals(gender, "Male") ? Gender.MALE : Gender.FEMALE ));
		editedCustomer.setAge(age);
		
		editedAddress.setAddress(address);
		editedAddress.setCity(city);
		editedAddress.setZipCode(zipcode);
		editedAddress.setCountry(country);
		
		editedContact.setCountryCode(countryCode);
		editedContact.setEmailAddress(emailAddress);
		editedContact.setPhoneNumber(phoneNumber);
		
		editedCustomer.setAddress(editedAddress);
		editedCustomer.setContact(editedContact);
		
		List<String> errorMessages = accountSettingsService.editAccount(editedCustomer, oldpassword, profileImage, session);

		if (errorMessages.isEmpty()) {
			model.addAttribute("successMessage", "Successfully Edited the account");
			return "forward:/account-settings";
		}
		
		model.addAttribute("errorMessages", errorMessages);
		model.addAttribute(customerService.getCustomerById(customerId));
		
		return "account-settings";
	}

}
