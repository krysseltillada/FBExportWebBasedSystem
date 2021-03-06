package com.fb.exportorder.module.customer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.customer.Customer;

public interface AccountSettingsService {

	List<String> editAccount(Customer customer, String oldPassword, MultipartFile profileImage, HttpSession session);

	String editEmail(Long id, String hashAddress, String email);
}


