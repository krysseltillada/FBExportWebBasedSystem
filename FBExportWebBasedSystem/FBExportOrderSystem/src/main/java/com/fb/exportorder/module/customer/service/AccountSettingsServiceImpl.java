package com.fb.exportorder.module.customer.service;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.utilities.PasswordValidator;
import com.fb.exportorder.utilities.UploadImage;

import edu.vt.middleware.password.RuleResult;

@Service
public class AccountSettingsServiceImpl implements AccountSettingsService {
	
	@Value("${server.context-path}")
	private String serverContextPath;
	
	@Value("${profile-img-context-location}")
	private String profileImageContextLocation;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private PasswordValidator passwordValidator;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private EmailService emailService;
	
	private List<String> validate (Customer customer, String oldPassword) {
		
		Contact customerContact = customer.getContact();
		Address customerAddress = customer.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
		
		Customer registeredCustomer = customerRepository.findOne(customer.getId());
		String password = registeredCustomer.getPassword();
		String newPassword = customer.getPassword();
		
		boolean isUsernameExists = customerRepository.isUsernameExists(customer.getUsername());
		boolean isEmailExists = customerRepository.isEmailExists(customerContact.getEmailAddress());
		
		long currentUserId = customer.getId();
	
		if (!StringUtils.isAlphanumeric(customer.getUsername()))
			errorMessages.add("username cannot contain a special characters or a space or empty");
		
		if (isUsernameExists) {
				
			long customerId = customerRepository.findAccountByUsername(customer.getUsername()).getId();
				
			if (customerId != currentUserId)
				errorMessages.add("username exists");
			
		}
			
		if (isEmailExists) {
				
			long customerIdEmail = customerRepository.findAccountByEmail(customerContact.getEmailAddress()).getId();
				
			if (customerIdEmail != currentUserId)
				errorMessages.add("email address exists");

		}
		
		if (StringUtils.isNotBlank(newPassword) && StringUtils.isNotBlank(oldPassword)) {
			if (!passwordEncoder.matches(oldPassword, password)) {
				errorMessages.add("invalid old password");
			} else {
				if (!passwordEncoder.matches(newPassword, password)) {
				
					RuleResult result = passwordValidator.validate(newPassword);
					RuleResult sResult = passwordValidator.validateSpecialCharacters(newPassword);
					
					if (!result.isValid()) {
						for (String errorMessage : passwordValidator.getPasswordValidator().getMessages(result)) {
								if (StringUtils.isNotEmpty(errorMessage))
									errorMessages.add(errorMessage);
						}
					}
					
					if (sResult.isValid())
						errorMessages.add("Password must not contain special characters");
					
				} else {
					errorMessages.add("enter a new password");
				}
			}
			
		} 
		
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
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCountry()) || StringUtils.isBlank(customerAddress.getCountry()))
			errorMessages.add("country cannot be empty, contain digits or symbols");
		
		if (!StringUtils.isAlphaSpace(customerAddress.getCity()) || StringUtils.isBlank(customerAddress.getCity()))
			errorMessages.add("city cannot be empty, contain digits or symbols");
		
		if (StringUtils.isBlank(customerAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty");
		
		if (!StringUtils.isNumeric(customerContact.getPhoneNumber()) || StringUtils.isBlank(customerContact.getPhoneNumber()) || Long.parseLong(customerContact.getPhoneNumber()) <= 0)
			errorMessages.add("invalid phone number");
		
		if (StringUtils.isBlank(customerContact.getCountryCode()))
			errorMessages.add("country code cannot be empty");
		
		if(!EmailValidator.getInstance()
			 			  .isValid(customer.getContact().getEmailAddress())) {
			if (StringUtils.isBlank(customerContact.getEmailAddress()))
				errorMessages.add("Email Address Cannot be empty");
			else
				errorMessages.add("Invalid Email Address"); 
		}
		
		return errorMessages;
		
	}


	@Override
	public List<String> editAccount(Customer customer, String oldPassword, MultipartFile profileImage, HttpSession session) {

		List<String> errorMessages = validate(customer, oldPassword);
		
		if (errorMessages.isEmpty()) {

			Customer editedCustomerAccount = customerRepository.findOne(customer.getId());
			
			if (!profileImage.isEmpty()) {
				
				String previousProfileLink = editedCustomerAccount.getProfileImageLink();
				
					File profileImageFile = new File(servletContext.getRealPath(previousProfileLink));
					
					if (profileImageFile.exists()) {
						if (!StringUtils.contains(previousProfileLink, "profile-male") && 
							!StringUtils.contains(previousProfileLink, "profile-female")) {
							profileImageFile.delete();
						}
					}
					
					String profileImageLink = StringUtils.EMPTY;
					
					try {
						byte[] imageBytes = profileImage.getBytes();
						
						Map <String, String> imageTypes = new HashMap<String, String>() {{
							put("image/jpeg", ".jpg");
							put("image/png", ".png");
						}};
						
						
						if (!profileImage.isEmpty()) {
							
							String timeStamp = new SimpleDateFormat("yyyymmddhhmmss").format(new Timestamp(System.currentTimeMillis()));
							String profileImageFilename = DigestUtils.md5Hex(customer.getUsername()) + timeStamp + imageTypes.get(profileImage.getContentType());
							
							System.out.println(profileImageFilename + " generated file name");
							
							Path path = FileSystems.getDefault().getPath("src\\main\\webapp\\profile-img-customer\\" + profileImageFilename);
							Files.write(path, imageBytes);
							
							profileImageLink = "/profile-img-customer/" + profileImageFilename;
						
						} else {
								
							profileImageLink = (customer.getGender() == Gender.MALE) ? "/resources/customer/img/profile-male.jpg" :
																						"/resources/customer/img/profile-female.jpg";			
						}
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					editedCustomerAccount.setProfileImageLink(profileImageLink);
					
			}
			
			editedCustomerAccount.setUsername(customer.getUsername());
			
			if (StringUtils.isNotBlank(customer.getPassword()))
				editedCustomerAccount.setPassword(passwordEncoder.encode(customer.getPassword()));
			
			editedCustomerAccount.setFirstname(customer.getFirstname());
			editedCustomerAccount.setMiddlename(customer.getMiddlename());
			editedCustomerAccount.setLastname(customer.getLastname());
			editedCustomerAccount.setGender(customer.getGender());
			editedCustomerAccount.setAge(customer.getAge());
			editedCustomerAccount.setAddress(customer.getAddress());
			editedCustomerAccount.getContact().setCountryCode(customer.getContact().getCountryCode());
			editedCustomerAccount.getContact().setPhoneNumber(customer.getContact().getPhoneNumber());
			
			if(!editedCustomerAccount.getContact().getEmailAddress().equals(customer.getContact().getEmailAddress())) {
				emailService.verifyEmail(String.format("%s %s",editedCustomerAccount.getFirstname(), editedCustomerAccount.getLastname()),
						customer.getContact().getEmailAddress(),
						 "[Email Change Confirmation]", "http://localhost:9090/FBExportSystem/edit-account/"+customer.getContact().getEmailAddress()+"/"+editedCustomerAccount.getId()+"/"+DigestUtils.md5Hex(editedCustomerAccount.getContact().getEmailAddress()+editedCustomerAccount.getUsername()));
			}
			
			ShippingAddress userAccountShippingAddress = editedCustomerAccount.getShippingAddresses().get(0);
			
			userAccountShippingAddress.setAddress(editedCustomerAccount.getAddress());
			userAccountShippingAddress.setContact(editedCustomerAccount.getContact());
			userAccountShippingAddress.setReceiverFullName(editedCustomerAccount.getFirstname() + " " + editedCustomerAccount.getMiddlename() + " " + editedCustomerAccount.getLastname());
			
			
			customerRepository.save(editedCustomerAccount);
			
			session.setAttribute("customerProfileImageLink", editedCustomerAccount.getProfileImageLink());
			session.setAttribute("customerName", editedCustomerAccount.getFirstname());
			
			System.out.println("successfully edited");
			
			
		
		}
		
		return errorMessages;
	}


	@Override
	public String editEmail(Long id, String hashAddress, String email) {
		Customer customer = customerRepository.findOne(id);
		Customer customerEmail = customerRepository.findAccountByEmail(email);
		
		if(Objects.isNull(customerEmail)) {
			if(Objects.isNull(customer)) {
				return "Account not found";
			}else {
				if(hashAddress.equals(DigestUtils.md5Hex(customer.getContact().getEmailAddress()+customer.getUsername()))) {
					if(!customer.isEnabled()) {
						return "Account not activated";
					}else {
						if(!EmailValidator.getInstance()
					 			  .isValid(email)) {
							if (StringUtils.isBlank(email))
								return "Email Address Cannot be empty";
							else
								return "Invalid Email Address"; 
						}
					}
				}else
					return "Account not found";
			}
		}else {
			return "Email already exist";
		}
		
		customer.getContact().setEmailAddress(email);
		customerRepository.save(customer);
		
		return null;
	}

}
