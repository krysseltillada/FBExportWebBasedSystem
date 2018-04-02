package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.utilities.PasswordValidator;
import com.fb.exportorder.utilities.UploadImage;

import edu.vt.middleware.password.RuleResult;

@Service
public class CustomerSignUpServiceImpl implements CustomerSignUpService {
	
	@Value("${profile-img-context-location}")
	private String profileImageContextLocation;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private PasswordValidator passwordValidator;
	
	@Autowired
	private GoogleRecaptchaService googleRecaptchaService;
	
	private List<String> validate (Customer customer, String recaptcha, String ip, MultipartFile profileImage) {
		
		Contact customerContact = customer.getContact();
		Address customerAddress = customer.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
		
		Customer registeredCustomer = customerRepository.findAccountByUsername(customer.getUsername());
		
		boolean isEmailExists = customerRepository.isEmailExists(customerContact.getEmailAddress());
		
		if (!StringUtils.isAlphanumeric(customer.getUsername()))
			errorMessages.add("username cannot contain a special characters or a space or empty");
		
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
		
		if (customer.getAge() < 18)
			errorMessages.add("age cannot be below 18");
		
		if (StringUtils.isBlank(customerAddress.getAddress()))
			errorMessages.add("address cannot be empty");
		
		if (StringUtils.isNumeric(customerAddress.getCountry()) || StringUtils.isBlank(customerAddress.getCountry()))
			errorMessages.add("country cannot be empty and contain digits");
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCity()) || StringUtils.isBlank(customerAddress.getCity()))
			errorMessages.add("city cannot be empty, contain digits or symbols");
		
		if (!StringUtils.isAlphanumeric(customerAddress.getZipCode()) || StringUtils.isBlank(customerAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty or contain any symbols");
		
		if (!StringUtils.isNumeric(customerContact.getPhoneNumber()) || StringUtils.isBlank(customerContact.getPhoneNumber()))
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
		
		if (StringUtils.isNotBlank(recaptcha)) {
 		
			String recaptchaMessage = googleRecaptchaService.verifyRecaptcha(ip, recaptcha);
			
			if (StringUtils.isNotEmpty(recaptchaMessage)) {
				errorMessages.add("Verify you're a human");
			}
		
		}
		
		return errorMessages;
		
	}
	
	@Override
	public List<String> register(Customer customer, String recaptcha, String ip, MultipartFile profileImage) {
		
		List<String> errorMessages = validate (customer, recaptcha, ip, profileImage);
		
		
		if (errorMessages.isEmpty()) {
			
			Authorities authorities = new Authorities();
			ShippingAddress userAccountAddress = new ShippingAddress();
			
			String fullname = customer.getFirstname() + " " + customer.getMiddlename() + " " + customer.getLastname();
			
			System.out.println("successfully registered");
			customer.setPassword(passwordEncoder.encode(customer.getPassword()));

			userAccountAddress.setAddress(customer.getAddress());
			userAccountAddress.setAddressType("User Account");
			userAccountAddress.setContact(customer.getContact());
			userAccountAddress.setReceiverFullName(fullname);
			userAccountAddress.setShippingInstructions("specify your shipping instructions by editing the card");
			userAccountAddress.setDefaultShippingAddress(true);
				
			System.out.println(profileImage.getContentType());
				
				
			String profileImageLink = StringUtils.EMPTY;
			
			if (!profileImage.isEmpty()) {
					
				profileImageLink = UploadImage.uploadProfileImage(customer.getUsername(), profileImageContextLocation, profileImage);
					
			} else {
					
				profileImageLink = (customer.getGender() == Gender.MALE) ? "/resources/customer/img/profile-male.jpg" :
																			"/resources/customer/img/profile-female.jpg";
					
			}
				
			authorities.setAuthority("CUSTOMER");
			authorities.setAccount(customer);
				
				
			customer.setProfileImageLink(profileImageLink);
				
			customer.getAuthorities()
						.add(authorities);
				
			customer.getShippingAddresses()
						.add(userAccountAddress);
				
			customer.setEnabled(false);
			customer.setOnline(false);

				
			customerRepository.save(customer);
				
			
		}
		
		
		return errorMessages;
		
	}

	

}
