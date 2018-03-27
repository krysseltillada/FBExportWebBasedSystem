package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Employee;

public interface ManageEmployeeService {
	public List<String> addNewEmployee(Employee employee, MultipartFile profileImage, String retypePassword, String role);
	
	public List<String> editEmployee(Employee employee,
									 MultipartFile profileImage,
									 String newEmailEmployeeEdit,
									 String newUsernameEmployeeEdit,
									 String encryptedPassword,
									 String newPassword,
									 String retypePassword);
	
	public List<Employee> getAllEmployees();
	
	public void editEnabledEmployee(String username);
	
	public void saveEmployee(Employee employee);
	
	public Employee getEmployeeByUsername(String username);
	
}
