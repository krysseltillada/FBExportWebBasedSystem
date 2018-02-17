package com.fb.exportorder.module.admin.service;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
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
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.admin.repository.ManageEmployeeRepository;
import com.fb.exportorder.utilities.PasswordValidator;

import edu.vt.middleware.password.RuleResult;

@Service
public class ManageEmloyeeServiceImpl implements ManageEmployeeService {

	@Value("${fbexport.server.domain.name}")
	String serverDomainName;

	@Autowired
	ManageEmployeeRepository employeeRepository;
	
	@Autowired
	PasswordValidator passwordValidator;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private List<String> validate(Employee employee, MultipartFile profileImage) {
		Contact employeeContact = employee.getContact();
		Address employeeAddress = employee.getAddress();
		
		List<String> errorMessages = new ArrayList<>();
				
		if(!StringUtils.isAlphanumericSpace(employee.getUsername()))
			errorMessages.add("username cannot contain special character");
		
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
		
		if (StringUtils.isBlank(employeeAddress.getAddress()))
			errorMessages.add("address cannot be empty");
		
		if (StringUtils.isNumeric(employeeAddress.getCountry()) || StringUtils.isBlank(employeeAddress.getCountry()))
			errorMessages.add("country cannot be empty and contain digits");
		
		if(!StringUtils.isAlphaSpace(employeeAddress.getCity()) || StringUtils.isBlank(employeeAddress.getCity()))
			errorMessages.add("city cannot be empty, contains digits or symbols");
		
		if(!StringUtils.isAlphanumeric(employeeAddress.getZipCode()) || StringUtils.isBlank(employeeAddress.getZipCode()))
			errorMessages.add("zipcode cannot be empty or contain any symbols");
		
		if (!StringUtils.isNumeric(employeeContact.getPhoneNumber()) || StringUtils.isBlank(employeeContact.getPhoneNumber()))
			errorMessages.add("phone number cannot be empty, contain letters, spaces or symbols");
		
		if (StringUtils.isBlank(employeeContact.getCountryCode()))
			errorMessages.add("country code cannot be empty");
		
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
	public List<String> addNewEmployee(Employee employee, MultipartFile profileImage, String retypePassword, String role) {
		List<String> errorMessages = validate(employee, profileImage);
		
		if(!retypePassword.equals(employee.getPassword()))
			errorMessages.add("Password mismatched");
		
		/*Check if exist*/
		boolean isEmailExists = employeeRepository.isEmailExists(employee.getContact().getEmailAddress());
		if (isEmailExists)
			errorMessages.add("Email Address exists");
		
		Employee registeredEmployee = employeeRepository.findAccountByUsername(employee.getUsername());
		if(Objects.nonNull(registeredEmployee))
			errorMessages.add("username exists");
		/*Check if exist*/
		
		Authorities authorities = new Authorities();
		
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
					
					Path path = FileSystems.getDefault().getPath("src\\main\\webapp\\profile-img\\" + profileImageFilename);
					Files.write(path, imageBytes);
					
					profileImageLink = serverDomainName + "/profile-img/" + profileImageFilename;
				
				} else {
					
					profileImageLink = (employee.getGender() == Gender.MALE) ? serverDomainName + "/resources/admin/img/profile-male.jpg" :
																			   serverDomainName + "/resources/admin/img/profile-female.jpg";
				}
				
				if(role.equals("EMPLOYEE")) {
					authorities.setAuthority(role);
				}else {
					authorities.setAuthority(role);
				}
				authorities.setAccount(employee);
				
				employee.getAuthorities().add(authorities);
				employee.setProfileImageLink(profileImageLink);
				employee.setEnabled(true);
				
				employeeRepository.save(employee);
				
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return errorMessages;
	}

	public List<String> editEmployee(Employee employee,
									 MultipartFile profileImage,
									 String newEmailEmployeeEdit,
									 String newUsernameEmployeeEdit,
									 String passwordEncrypted,
									 String newPassword,
									 String retypePassword){
		
		List<String> errorMessages = validate(employee, profileImage);
		
		if(!passwordEncoder.matches(employee.getPassword(), passwordEncrypted)) 
			errorMessages.add("Invalid Password");
		
		/*Check if exist*/
		if(!newEmailEmployeeEdit.isEmpty()) {
			boolean isEmailExists = employeeRepository.isEmailExists(newEmailEmployeeEdit);
			if (isEmailExists)
				errorMessages.add("Email Address exists");
			else
				employee.getContact().setEmailAddress(newEmailEmployeeEdit);
		}
		
		if(!newUsernameEmployeeEdit.isEmpty()) {
			Employee registeredEmployee = employeeRepository.findAccountByUsername(newUsernameEmployeeEdit);
			if(Objects.nonNull(registeredEmployee))
				errorMessages.add("username exists");
			else
				employee.setUsername(newUsernameEmployeeEdit);
		}
		
		/*Check if exist*/
		
		
		if(!newPassword.isEmpty() && !retypePassword.isEmpty()) {
			RuleResult result = passwordValidator.validate(newPassword);
			RuleResult sResult = passwordValidator.validateSpecialCharacters(newPassword);
			
			if(!result.isValid()) {
				for(String errorMessage : passwordValidator.getPasswordValidator().getMessages(result)) {
					if(StringUtils.isNotEmpty(errorMessage))
						errorMessages.add(errorMessage);
				}
			}
			
			if(sResult.isValid())
				errorMessages.add("New password must not contain special characters");
			
			if(!newPassword.equals(retypePassword)) 
				errorMessages.add("New password mismatched");
			else 
				employee.setPassword(newPassword);
		}
		
		if(errorMessages.isEmpty()) {
			employee.setPassword(passwordEncoder.encode(employee.getPassword()));
			try {
				byte[] imageBytes = profileImage.getBytes();
				
				Map <String, String> imageTypes = new HashMap<String, String>() {{
					put("image/jpeg", ".jpg");
					put("image/png", ".png");
				}};
				
				String profileImageLink = StringUtils.EMPTY;
				
				if (!profileImage.isEmpty()) {
					
					String profileImageFilename = DigestUtils.md5Hex(employee.getUsername()) + imageTypes.get(profileImage.getContentType());
					
					Path path = FileSystems.getDefault().getPath("src\\main\\webapp\\profile-img\\" + profileImageFilename);
					Files.write(path, imageBytes);
					
					profileImageLink = serverDomainName + "/profile-img/" + profileImageFilename;
					employee.setProfileImageLink(profileImageLink);
					
					employeeRepository.save(employee);
				} else {
					
					employeeRepository.save(employee);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		return errorMessages;

	}
	
	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = new ArrayList<>();
		for(Employee employee : employeeRepository.findAll()) {
			employees.add(employee);
		}
		return employees;
	}

	@Override
	public void editEnabledEmployee(String username) {
		Employee employee = employeeRepository.findAccountByUsername(username);
		if(employee.isEnabled()) {
			employee.setEnabled(false);
		}else {
			employee.setEnabled(true);
		}
		
		employeeRepository.save(employee);
	}

	@Override
	public Employee getEmployeeByUsername(String username) {
		
		return employeeRepository.findAccountByUsername(username);
	}

}
