package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Employee;

public interface ManageEmployeeService {
	
	List<String> addNewEmployee(Employee employee, MultipartFile profileImage, String retypePassword, String role);
	
	List<String> editEmployee(Employee employee,
							  MultipartFile profileImage,
							  String newEmailEmployeeEdit,
							  String newUsernameEmployeeEdit,
							  String encryptedPassword,
							  String newPassword,
							  String retypePassword);
	
	List<Employee> getAllEmployees();
	
	void editEnabledEmployee(String username);
	
	void saveEmployee(Employee employee);
	
	Employee getEmployeeByUsername(String username);
	
	Employee getEmployeeById(long employeeId);
	
}
