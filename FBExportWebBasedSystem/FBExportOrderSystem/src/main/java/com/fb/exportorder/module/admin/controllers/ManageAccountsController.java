package com.fb.exportorder.module.admin.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.admin.service.EmployeeAddService;

@Controller
public class ManageAccountsController {
	
	@Autowired
	EmployeeAddService employeeAddService;
	
	@RequestMapping("/manage-accounts")
	public String manageAccounts() {
		return "manage-accounts";
	}
	
	@RequestMapping(value="/add-new-employee", method=RequestMethod.POST)
	public String addNewEmployee(@RequestParam("fileEmployeeAdd") MultipartFile profileImage,
								 String usernameEmployeeAdd,
								 String firstnameEmployeeAdd,
								 String middlenameEmployeeAdd,
								 String lastnameEmployeeAdd,
								 String passwordEmployeeAdd,
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
								 Model model) {
		
		System.out.println(usernameEmployeeAdd);
		System.out.println(firstnameEmployeeAdd);
		System.out.println(middlenameEmployeeAdd);
		System.out.println(lastnameEmployeeAdd);
		System.out.println(passwordEmployeeAdd);
		System.out.println(positionEmployeeAdd);
		System.out.println(genderEmployeeAdd);
		System.out.println(ageEmployeeAdd);
		System.out.println(emailEmployeeAdd);
		System.out.println(countryEmployeeAdd);
		System.out.println(cityEmployeeAdd);
		System.out.println(addressEmployeeAdd);
		System.out.println(zipcodeEmployeeAdd);
		System.out.println(countryCodeEmployeeAdd);
		System.out.println(phonenumberEmployeeAdd);
		
		Employee newEmployee = new Employee();
		Address employeeAddress = new Address();
		Contact employeeContact = new Contact();
		
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
		
		newEmployee.setAddress(employeeAddress);
		newEmployee.setContact(employeeContact);
		
		List<String> errorMessages = employeeAddService.addNewEmployee(newEmployee, profileImage);
		
		if(!errorMessages.isEmpty()) {
			model.addAttribute(errorMessages);
			return "manage-accounts";
		}
		
		return "redirect:manage-accounts";
	}
}
