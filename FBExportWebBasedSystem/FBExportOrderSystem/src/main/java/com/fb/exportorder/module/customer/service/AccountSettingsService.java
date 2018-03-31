package com.fb.exportorder.module.customer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.models.customer.Customer;

public interface AccountSettingsService {
	public List<String> editAccount(Customer customer, String oldPassword, MultipartFile profileImage, HttpSession session);

	public String editEmail(Long id, String hashAddress, String email);
}
