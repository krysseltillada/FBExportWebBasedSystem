package com.fb.exportorder.module.customer.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
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
		
		boolean isEmailExists = customerRepository.isEmailExists(customerContact.getEmailAddress());
		
		if (!StringUtils.isAlphanumericSpace(customer.getUsername()))
			errorMessages.add("username cannot contain a special character");
		
		if (Objects.nonNull(registeredCustomer)) {
			errorMessages.add("username exists");
		}
		
		if (isEmailExists)
			errorMessages.add("Email Address exists");
		
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
		
		if (!StringUtils.isNumeric(Integer.toString(customer.getAge())) || customer.getAge() <= 0)
			errorMessages.add("age cannot contain letters or symbols or invalid number");
		
		if (StringUtils.isBlank(customerAddress.getAddress()))
			errorMessages.add("address cannot be empty");
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCountry()) || StringUtils.isBlank(customerAddress.getCountry()))
			errorMessages.add("country cannot be empty, contain digits or symbols");
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCity()) || StringUtils.isBlank(customerAddress.getCity()))
			errorMessages.add("city cannot be empty, contain digits or symbols");
		
		if (StringUtils.isBlank(customerAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty");
		
		if (!StringUtils.isNumeric(customerContact.getPhoneNumber()) || StringUtils.isBlank(customerContact.getPhoneNumber()) || Integer.parseInt(customerContact.getPhoneNumber()) <= 0)
			errorMessages.add("phone number cannot be empty, contain letters, spaces or symbols or invalid number");
		
		if (StringUtils.isBlank(customerContact.getCountryCode()))
			errorMessages.add("country code cannot be empty");
		
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
		
		return errorMessages;
		
	}
	
	@Override
	public List<String> register(Customer customer, String recaptcha, String ip, MultipartFile profileImage) {
		
		List<String> errorMessages = validate (customer, recaptcha, ip, profileImage);
		Authorities authorities = new Authorities();
		
		
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
				
				String profileImageLink = StringUtils.EMPTY;
				
				if (!profileImage.isEmpty()) {
					
					String profileImageFilename = DigestUtils.md5Hex(customer.getUsername()) + imageTypes.get(profileImage.getContentType());
					String profileImageFilePath = profileImageContextLocation + File.separator + profileImageFilename;
					Path path = Paths.get(profileImageFilePath);
					Files.write(path, imageBytes);
					
					profileImageLink = "/profile-img/" + profileImageFilename;
					
				} else {
					
					profileImageLink = (customer.getGender() == Gender.MALE) ? "/resources/customer/img/profile-male.jpg" :
																			   "/resources/customer/img/profile-female.jpg";
					
				}

			
				
				authorities.setAuthority("CUSTOMER");
				authorities.setAccount(customer);
				
				for (int i = 0; i != 10; ++i) {
					
					Activity act = new Activity();
					
					act.setDate(new Date());
					act.setDescription("tae tae");
					act.setHeader("tng ina tng ina" + i);
					act.setCustomer(customer);
					
					customer.getActivities()
							.add(act);
				}
				
				customer.setProfileImageLink(profileImageLink);
				
				customer.getAuthorities()
						.add(authorities);
				
				customer.setEnabled(true);

				
				customerRepository.save(customer);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return errorMessages;
		
	}

	

}
