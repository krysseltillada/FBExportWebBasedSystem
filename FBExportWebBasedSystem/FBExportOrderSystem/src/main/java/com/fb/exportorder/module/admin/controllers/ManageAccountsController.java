package com.fb.exportorder.module.admin.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.admin.service.ManageActivityService;
import com.fb.exportorder.module.admin.service.ManageCustomerService;
import com.fb.exportorder.module.admin.service.ManageEmployeeService;
import com.google.gson.Gson;

@Controller
public class ManageAccountsController {
	
	@Autowired
	ManageEmployeeService employeeService;
	
	@Autowired
	ManageCustomerService customerService;
	
	@Autowired
	ManageActivityService activityService;
	
	@RequestMapping("/admin/manage-accounts")
	public String manageAccounts(Model model) {
		
		List<Customer> customerList = customerService.getAllCustomers();
		model.addAttribute("customerList", customerList);
		
		List<Employee> employeeList = new ArrayList<>();
		List<Employee> adminList = new ArrayList<>();
		
		for(Employee employeeAuthority : employeeService.getAllEmployees()) {
			employeeAuthority.getAuthorities().forEach((authority) -> {
				if(authority.getAuthority().equals("EMPLOYEE")) {
					employeeList.add((Employee)authority.getAccount());
				}else {
					adminList.add((Employee)authority.getAccount());
				}
				
			});
		}
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("adminList", adminList);

		
		return "manage-accounts";
	}
	
	
	@RequestMapping(value="/admin/show-customer-activity", method=RequestMethod.POST)
	@ResponseBody
	public String showCustomerActivity(@RequestBody String username) {
		Customer customer = customerService.getCustomerByUsername(username);
		List<Activity> activityList = activityService.getCustomerActivitiesById(customer.getId());
		
		Gson gson = new Gson();
		String json = gson.toJson(activityList);
		return json;
		
	}
	
	@RequestMapping(value="/admin/enabled-customer", method=RequestMethod.POST)
	@ResponseBody
	public String editCustomerEnabled(@RequestBody String username) {
		customerService.editEnabledCustomer(username);
		return "Success";
	}
	
	@RequestMapping(value="/admin/edit-customer", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String editClient(String usernameClientEdit,
							   String firstnameClientEdit,
							   String middlenameClientEdit,
							   String lastnameClientEdit,
							   String genderClientEdit,
							   int ageClientEdit,
							   String emailClientEdit,
							   String countryClientEdit,
							   String cityClientEdit,
							   String addressClientEdit,
							   String zipcodeClientEdit,
							   String countryCodeClientEdit,
							   String phonenumberClientEdit,
							   String newUsernameClientEdit,
							   String newEmailClientEdit) {

		Customer customer = customerService.getCustomerByUsername(usernameClientEdit);
		
		if(customer != null) {
			if(customer.getContact().getEmailAddress().equals(emailClientEdit)) {
				customer.setUsername(usernameClientEdit);
				customer.getContact().setEmailAddress(emailClientEdit);
				customer.setFirstname(firstnameClientEdit);
				customer.setMiddlename(middlenameClientEdit);
				customer.setLastname(lastnameClientEdit);
				customer.setGender((genderClientEdit.equals("Male")) ? Gender.MALE : Gender.FEMALE);
				customer.setAge(ageClientEdit);
				customer.getAddress().setCity(cityClientEdit);
				customer.getAddress().setCountry(countryClientEdit);
				customer.getAddress().setAddress(addressClientEdit);
				customer.getAddress().setZipCode(zipcodeClientEdit);
				customer.getContact().setCountryCode(countryCodeClientEdit);
				customer.getContact().setPhoneNumber(phonenumberClientEdit);

				List<String> errorMessages = customerService.editCustomer(customer,
																		  newEmailClientEdit,
																		  newUsernameClientEdit);
				
				if(!errorMessages.isEmpty()) {
					Gson gson = new Gson();
					String json = gson.toJson(errorMessages);
					return json;		
				}
			}else {
				return "[\"Email not found\"]";
			}
		}else {
			return "[\"Username not found\"]";
		}
		
		return "Success";
		
	}
	
	@RequestMapping(value="/admin/enabled-employee", method=RequestMethod.POST)
	@ResponseBody
	public String editEmployeeEnabled(@RequestBody String username) {
		employeeService.editEnabledEmployee(username);
		return "Success";
	}
	
	@RequestMapping(value="/admin/add-new-employee", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String addNewEmployee(String usernameEmployeeAdd,
								 String firstnameEmployeeAdd,
								 String middlenameEmployeeAdd,
								 String lastnameEmployeeAdd,
								 String passwordEmployeeAdd,
								 String retypePasswordEmployeeAdd,
								 String positionEmployeeAdd,
								 String genderEmployeeAdd,
								 int ageEmployeeAdd,
								 String emailEmployeeAdd,
								 String countryEmployeeAdd,
								 String cityEmployeeAdd,
								 String addressEmployeeAdd,
								 String zipcodeEmployeeAdd,
								 String countryCodeEmployeeAdd,
								 String phonenumberEmployeeAdd,
								 @RequestParam("fileEmployeeAdd") MultipartFile profileImage) {
		
		Employee newEmployee = new Employee();
		Address employeeAddress = new Address();
		Contact employeeContact = new Contact();
		
		return addNewEmployee(newEmployee,
				  			  employeeAddress,
				  			  employeeContact,
				  			  usernameEmployeeAdd,
				  			  firstnameEmployeeAdd,
				  			  middlenameEmployeeAdd,
				  			  lastnameEmployeeAdd,
				  			  passwordEmployeeAdd,
				  			  retypePasswordEmployeeAdd,
				  			  positionEmployeeAdd,
				  			  genderEmployeeAdd,
				  			  ageEmployeeAdd,
				  			  emailEmployeeAdd,
				  			  countryEmployeeAdd,
				  			  cityEmployeeAdd,
				  			  addressEmployeeAdd,
				  			  zipcodeEmployeeAdd,
				  			  countryCodeEmployeeAdd,
				  			  phonenumberEmployeeAdd,
				  			  profileImage,
				  			  "EMPLOYEE");
		
	}
	
	@RequestMapping(value="/admin/edit-employee", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String editEmployee(String usernameEmployeeEdit,
							   String firstnameEmployeeEdit,
							   String middlenameEmployeeEdit,
							   String lastnameEmployeeEdit,
							   String passwordEmployeeEdit,
							   String positionEmployeeEdit,
							   String genderEmployeeEdit,
							   int ageEmployeeEdit,
							   String emailEmployeeEdit,
							   String countryEmployeeEdit,
							   String cityEmployeeEdit,
							   String addressEmployeeEdit,
							   String zipcodeEmployeeEdit,
							   String countryCodeEmployeeEdit,
							   String phonenumberEmployeeEdit,
							   String newEmailEmployeeEdit,
							   String newUsernameEmployeeEdit,
							   String newRetypePasswordEmployeeEdit,
							   String newPasswordEmployeeEdit,
							   @RequestParam("fileEmployeeEdit") MultipartFile profileImage) {
		
		Employee employee = employeeService.getEmployeeByUsername(usernameEmployeeEdit);
	
		return editEmployee(employee,
							emailEmployeeEdit,
							usernameEmployeeEdit,
							firstnameEmployeeEdit,
							lastnameEmployeeEdit,
							middlenameEmployeeEdit,
							positionEmployeeEdit,
							genderEmployeeEdit,
							ageEmployeeEdit,
							cityEmployeeEdit,
							countryEmployeeEdit,
							addressEmployeeEdit,
							zipcodeEmployeeEdit,
							countryCodeEmployeeEdit,
							phonenumberEmployeeEdit,
							passwordEmployeeEdit,
							profileImage,
							newEmailEmployeeEdit,
							newUsernameEmployeeEdit,
							newPasswordEmployeeEdit,
							newRetypePasswordEmployeeEdit);
		
	}
	
	@RequestMapping(value="/admin/enabled-admin", method=RequestMethod.POST)
	@ResponseBody
	public String editAdminEnabled(@RequestBody String username) {
		employeeService.editEnabledEmployee(username);
		return "Success";
	}
	
	@RequestMapping(value="/admin/add-new-admin", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String addNewAdmin(String usernameAdminAdd,
							  String firstnameAdminAdd,
							  String middlenameAdminAdd,
							  String lastnameAdminAdd,
							  String passwordAdminAdd,
							  String retypePasswordAdminAdd,
							  String positionAdminAdd,
							  String genderAdminAdd,
							  int ageAdminAdd,
							  String emailAdminAdd,
							  String countryAdminAdd,
							  String cityAdminAdd,
							  String addressAdminAdd,
							  String zipcodeAdminAdd,
							  String countryCodeAdminAdd,
							  String phonenumberAdminAdd,
							  @RequestParam("fileAdminAdd") MultipartFile profileImage) {
		
		Employee newAdmin = new Employee();
		Address adminAddress = new Address();
		Contact adminContact = new Contact();
		
		
		return addNewEmployee(newAdmin,
							  adminAddress,
							  adminContact,
							  usernameAdminAdd,
							  firstnameAdminAdd,
							  middlenameAdminAdd,
							  lastnameAdminAdd,
							  passwordAdminAdd,
							  retypePasswordAdminAdd,
							  positionAdminAdd,
							  genderAdminAdd,
							  ageAdminAdd,
							  emailAdminAdd,
							  countryAdminAdd,
							  cityAdminAdd,
							  addressAdminAdd,
							  zipcodeAdminAdd,
							  countryCodeAdminAdd,
							  phonenumberAdminAdd,
							  profileImage,
							  "ADMIN");
	}
	
	@RequestMapping(value="/admin/edit-admin", method=RequestMethod.POST, consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String editAdmin(String usernameAdminEdit,
							   String firstnameAdminEdit,
							   String middlenameAdminEdit,
							   String lastnameAdminEdit,
							   String passwordAdminEdit,
							   String positionAdminEdit,
							   String genderAdminEdit,
							   int ageAdminEdit,
							   String emailAdminEdit,
							   String countryAdminEdit,
							   String cityAdminEdit,
							   String addressAdminEdit,
							   String zipcodeAdminEdit,
							   String countryCodeAdminEdit,
							   String phonenumberAdminEdit,
							   String newEmailAdminEdit,
							   String newUsernameAdminEdit,
							   String newRetypePasswordAdminEdit,
							   String newPasswordAdminEdit,
							   @RequestParam("fileAdminEdit") MultipartFile profileImage) {
		
		Employee admin = employeeService.getEmployeeByUsername(usernameAdminEdit);
	
		
		
		return editEmployee(admin,
							emailAdminEdit,
							usernameAdminEdit,
							firstnameAdminEdit,
							lastnameAdminEdit,
							middlenameAdminEdit,
							positionAdminEdit,
							genderAdminEdit,
							ageAdminEdit,
							cityAdminEdit,
							countryAdminEdit,
							addressAdminEdit,
							zipcodeAdminEdit,
							countryCodeAdminEdit,
							phonenumberAdminEdit,
							passwordAdminEdit,
							profileImage,
							newEmailAdminEdit,
							newUsernameAdminEdit,
							newPasswordAdminEdit,
							newRetypePasswordAdminEdit);
		
	}
	
	public String addNewEmployee(Employee newEmployee,
								 Address employeeAddress,
								 Contact employeeContact,
								 String usernameEmployeeAdd,
			  					 String firstnameEmployeeAdd,
			  					 String middlenameEmployeeAdd,
			  					 String lastnameEmployeeAdd,
			  					 String passwordEmployeeAdd,
			  					 String retypePasswordEmployeeAdd,
			  					 String positionEmployeeAdd,
			  					 String genderEmployeeAdd,
			  					 int ageEmployeeAdd,
			  					 String emailEmployeeAdd,
			  					 String countryEmployeeAdd,
			  					 String cityEmployeeAdd,
			  					 String addressEmployeeAdd,
			  					 String zipcodeEmployeeAdd,
			  					 String countryCodeEmployeeAdd,
			  					 String phonenumberEmployeeAdd,
			  					 MultipartFile profileImage,
			  					 String role) {
		newEmployee.setUsername(usernameEmployeeAdd);
		newEmployee.setPassword(passwordEmployeeAdd);
		
		newEmployee.setFirstname(firstnameEmployeeAdd);
		newEmployee.setMiddlename(middlenameEmployeeAdd);
		newEmployee.setLastname(lastnameEmployeeAdd);
		newEmployee.setPosition(positionEmployeeAdd);
		
		newEmployee.setGender((genderEmployeeAdd.equals("Male")) ? Gender.MALE : Gender.FEMALE);
		
		newEmployee.setAge(ageEmployeeAdd);
		
		employeeAddress.setAddress(addressEmployeeAdd);
		employeeAddress.setCity(cityEmployeeAdd);
		employeeAddress.setCountry(countryEmployeeAdd);
		employeeAddress.setZipCode(zipcodeEmployeeAdd);
		
		employeeContact.setEmailAddress(emailEmployeeAdd);
		employeeContact.setPhoneNumber(phonenumberEmployeeAdd);
		employeeContact.setCountryCode(countryCodeEmployeeAdd);
		
		newEmployee.setAddress(employeeAddress);
		newEmployee.setContact(employeeContact);
		
		List<String> errorMessages = employeeService.addNewEmployee(newEmployee, profileImage, retypePasswordEmployeeAdd, role);
		
		if(!errorMessages.isEmpty()) {
			
			Gson gson = new Gson();
			String json = gson.toJson(errorMessages);
			return json;
			
		}
		
		return "Success";
	}
	
	public String editEmployee(Employee employee,
							   String emailEdit,
							   String usernameEdit,
							   String firstnameEdit,
							   String lastnameEdit,
							   String middlenameEdit,
							   String positionEdit,
							   String genderEdit,
							   int ageEdit,
							   String cityEdit,
							   String countryEdit,
							   String addressEdit,
							   String zipcodeEdit,
							   String countryCodeEdit,
							   String phonenumberEdit,
							   String passwordEdit,
							   MultipartFile profileImage,
							   String newEmailEdit,
							   String newUsernameEdit,
							   String newPasswordEdit,
							   String newRetypePasswordEdit) {
		if(employee != null) {
			
			if(employee.getContact().getEmailAddress().equals(emailEdit)) {
				String encryptedPassword = employee.getPassword();

				
				employee.setUsername(usernameEdit);
				employee.getContact().setEmailAddress(emailEdit);
				employee.setFirstname(firstnameEdit);
				employee.setMiddlename(middlenameEdit);
				employee.setLastname(lastnameEdit);
				employee.setPosition(positionEdit);
				employee.setGender((genderEdit.equals("Male")) ? Gender.MALE : Gender.FEMALE);
				employee.setAge(ageEdit);
				employee.getAddress().setCity(cityEdit);
				employee.getAddress().setCountry(countryEdit);
				employee.getAddress().setAddress(addressEdit);
				employee.getAddress().setZipCode(zipcodeEdit);
				employee.getContact().setCountryCode(countryCodeEdit);
				employee.getContact().setPhoneNumber(phonenumberEdit);
				employee.setPassword(passwordEdit);

				List<String> errorMessages = employeeService.editEmployee(employee,
																		  profileImage,
																		  newEmailEdit,
																		  newUsernameEdit,
																		  encryptedPassword,
																		  newPasswordEdit,
																		  newRetypePasswordEdit);	
				if(!errorMessages.isEmpty()) {
					Gson gson = new Gson();
					String json = gson.toJson(errorMessages);
					return json;
				}
			}else {
				return "[\"Email not found\"]";
			}
		}else {
			return "[\"Username not found\"]";
		}
		
		return "Success";
	}
}
