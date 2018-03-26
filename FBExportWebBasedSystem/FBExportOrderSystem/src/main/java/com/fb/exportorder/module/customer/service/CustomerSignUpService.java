package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.customer.Customer;


public interface CustomerSignUpService {
	public List<String> register(Customer customer, String recaptcha, String ip, MultipartFile profileImage);
}
