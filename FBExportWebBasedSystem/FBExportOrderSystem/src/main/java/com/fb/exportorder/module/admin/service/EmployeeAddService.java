package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Employee;

public interface EmployeeAddService {
	public List<String> addNewEmployee(Employee employee, MultipartFile profileImage);
}
