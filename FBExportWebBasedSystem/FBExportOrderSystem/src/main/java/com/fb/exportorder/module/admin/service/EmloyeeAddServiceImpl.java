package com.fb.exportorder.module.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
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
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.admin.repository.EmployeeRepository;
import com.fb.exportorder.utilities.PasswordValidator;

import edu.vt.middleware.password.RuleResult;

@Service
public class EmloyeeAddServiceImpl implements EmployeeAddService {
	
	@Value("${profile-img-context-location}")
	String profileImageContextLocation;

	@Value("${fbexport.server.domain.name}")
	String serverDomainName;

	@Autowired
	EmployeeRepository employeeRepository;
	
	@Autowired
	PasswordValidator passwordValidator;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private List<String> validate(Employee employee, MultipartFile profileImage) {
		Contact employeeContact = employee.getContact();
		Address employeeAddress = employee.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
		Employee registeredEmployee = employeeRepository.findAccountByUsername(employee.getUsername());
		
		if(!StringUtils.isAlphanumericSpace(employee.getUsername()))
			errorMessages.add("username cannot contain special character");
		
		if(Objects.nonNull(registeredEmployee))
			errorMessages.add("username exists");
		
		RuleResult result = passwordValidator.validate(employee.getPassword());
		RuleResult sResult = passwordValidator.validateSpecialCharacters(employee.getPassword());
		
		if(!result.isValid()) {
			for(String errorMessage : passwordValidator.getPasswordValidator().getMessages(result)) {
				if(StringUtils.isNotEmpty(errorMessage))
					errorMessages.add(errorMessage);
			}
		}
		
		if(sResult.isValid())
			errorMessages.add("Password must not contain special characters");
		
		if(!StringUtils.isAlphaSpace(employee.getFirstname()) || StringUtils.isBlank(employee.getFirstname()))
			errorMessages.add("first name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isAlphaSpace(employee.getMiddlename()) || StringUtils.isBlank(employee.getMiddlename()))
			errorMessages.add("middle name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isAlphaSpace(employee.getLastname()) || StringUtils.isBlank(employee.getLastname()))
			errorMessages.add("last name cannot be empty, have digits and symbols");
		
		if(!StringUtils.isAlphaSpace(employee.getPosition()) || StringUtils.isBlank(employee.getPosition()))
			errorMessages.add("position cannot be empty, have digits and symbols");
		
		if(!StringUtils.isNumeric(Integer.toString(employee.getAge())))
			errorMessages.add("age cannot contain letters or symbols");
		
		if(!StringUtils.isAlphaSpace(employeeAddress.getCity()) || StringUtils.isBlank(employeeAddress.getCity()))
			errorMessages.add("city cannot be empty, contains digits or symbols");
		
		if(!StringUtils.isAlphaSpace(employeeAddress.getZipCode()) || StringUtils.isBlank(employeeAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty, contains letters, spaces or symbols");
		
		if (!StringUtils.isNumeric(employeeContact.getPhoneNumber()) || StringUtils.isBlank(employeeContact.getPhoneNumber()))
			errorMessages.add("phone number cannot be empty, contain letters, spaces or symbols");
		
		if(!EmailValidator.getInstance()
	 			  .isValid(employee.getContact().getEmailAddress())) {
			if (StringUtils.isBlank(employeeContact.getEmailAddress()))
				errorMessages.add("Email Address Cannot be empty");
			else
				errorMessages.add("Invalid Email Address"); 
		}
		
		return errorMessages;
	}
	
	@Override
	public List<String> addNewEmployee(Employee employee, MultipartFile profileImage) {
		List<String> errorMessages = validate(employee, profileImage);
		
		if(errorMessages.isEmpty()) {
			System.out.println("successfully registered");
			employee.setPassword(passwordEncoder.encode(employee.getPassword()));
			
			try {
				System.out.println(profileImage.getContentType());
				
				byte[] imageBytes = profileImage.getBytes();
				
				Map <String, String> imageTypes = new HashMap<String, String>() {{
					put("image/jpeg", ".jpg");
					put("image/png", ".png");
				}};
				
				String profileImageLink = StringUtils.EMPTY;
				
				if (!profileImage.isEmpty()) {
					
					String profileImageFilename = DigestUtils.md5Hex(employee.getUsername()) + imageTypes.get(profileImage.getContentType());
					String profileImageFilePath = profileImageContextLocation + File.separator + profileImageFilename;
					Path path = Paths.get(profileImageFilePath);
					Files.write(path, imageBytes);
					
					profileImageLink = serverDomainName + "profile-img/" + profileImageFilename;
					
				} else {
					
					profileImageLink = (employee.getGender() == Gender.MALE) ? serverDomainName + "resources/admin/img/profile-male.jpg" :
																			   serverDomainName + "resources/admin/img/profile-female.jpg";
				}
				
				employee.setProfileImageLink(profileImageLink);
				employee.setEnabled(true);
				
				employeeRepository.save(employee);
				
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return errorMessages;
	}

}
