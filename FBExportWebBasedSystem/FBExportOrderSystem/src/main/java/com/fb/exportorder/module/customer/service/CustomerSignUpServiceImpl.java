package com.fb.exportorder.module.customer.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.utilities.PasswordValidator;

import edu.vt.middleware.password.RuleResult;

@Service
public class CustomerSignUpServiceImpl implements CustomerSignUpService {
	
	@Value("${profile-img-context-location}")
	String profileImageContextLocation;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	PasswordValidator passwordValidator;
	
	@Autowired
	GoogleRecaptchaService googleRecaptchaService;
	
	private List<String> validate (Customer customer, String recaptcha, String ip, MultipartFile profileImage) {
		
		Contact customerContact = customer.getContact();
		Address customerAddress = customer.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
		Customer registeredCustomer = customerRepository.findAccountByUsername(customer.getUsername());
		
		if (!StringUtils.isAlphanumericSpace(customer.getUsername()))
			errorMessages.add("username cannot contain a special character");
		
		if (Objects.nonNull(registeredCustomer))
			errorMessages.add("username exists");
		
		RuleResult result = passwordValidator.validate(customer.getPassword());
		RuleResult sResult = passwordValidator.validateSpecialCharacters(customer.getPassword());
		
		if (!result.isValid()) {
			for (String errorMessage : passwordValidator.getPasswordValidator().getMessages(result)) {
					if (StringUtils.isNotEmpty(errorMessage))
						errorMessages.add(errorMessage);
			}
		}
		
		if (sResult.isValid())
			errorMessages.add("Password must not contain special characters");
		
		if (!StringUtils.isAlphaSpace(customer.getFirstname()) || StringUtils.isBlank(customer.getFirstname()))
			errorMessages.add("first name cannot be empty, have digits or symbols");
		
		if (!StringUtils.isAlphaSpace(customer.getMiddlename()) || StringUtils.isBlank(customer.getMiddlename()))
			errorMessages.add("middle name cannot be empty, have digits or symbols");
		
		if (!StringUtils.isAlphaSpace(customer.getLastname()) || StringUtils.isBlank(customer.getLastname()))
			errorMessages.add("last name cannot be empty have digits or symbols");
		
		if (!StringUtils.isNumeric(Integer.toString(customer.getAge())))
			errorMessages.add("age cannot contain letters or symbols");
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCity()) || StringUtils.isBlank(customerAddress.getCity()))
			errorMessages.add("city cannot be empty, contain digits or symbols");
		
		if (!StringUtils.isNumeric(customerAddress.getZipCode()) || StringUtils.isBlank(customer.getAddress().getZipCode()))
			errorMessages.add("zipcode cannot be empty, contains letters, spaces or symbols");
		
		if (!StringUtils.isNumeric(customerContact.getPhoneNumber()) || StringUtils.isBlank(customerContact.getPhoneNumber()))
			errorMessages.add("phone number cannot be empty, contain letters, spaces or symbols");
		
		if(!EmailValidator.getInstance()
			 			  .isValid(customer.getContact().getEmailAddress())) {
			if (StringUtils.isBlank(customerContact.getEmailAddress()))
				errorMessages.add("Email Address Cannot be empty");
			else
				errorMessages.add("Invalid Email Address"); 
		}
		
		String recaptchaMessage = googleRecaptchaService.verifyRecaptcha(ip, recaptcha);
		
		if (StringUtils.isNotEmpty(recaptchaMessage)) {
			errorMessages.add("Verify you're a human");
		}
		
		if (profileImage.isEmpty())
			errorMessages.add("Add your profile image");
		
		return errorMessages;
		
	}
	
	@Override
	public List<String> register(Customer customer, String recaptcha, String ip, MultipartFile profileImage) {
		
		List<String> errorMessages = validate (customer, recaptcha, ip, profileImage);

		if (errorMessages.isEmpty()) {
			System.out.println("successfully registered");
			customer.setPassword(passwordEncoder.encode(customer.getPassword()));
			
			try {
				
				System.out.println(profileImage.getContentType());
				
				byte[] imageBytes = profileImage.getBytes();
				
				Map <String, String> imageTypes = new HashMap<String, String>() {{
					put("image/jpeg", ".jpg");
					put("image/png", ".png");
				}};
				
				String profileImageFilename = DigestUtils.md5Hex(customer.getUsername()) + imageTypes.get(profileImage.getContentType());
				
				Path path = Paths.get(profileImageContextLocation + File.separator + profileImageFilename);
				Files.write(path, imageBytes);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return errorMessages;
		
	}

	

}
