package com.fb.exportorder.module.customer.service;

import java.util.List;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface ResetPasswordService {
	public List<String> validatePassword(String newPassword, String retypePassword);
	public String checkAccount(Long id, String hash, String newPassword);
	public String resetPassword(String newPassword, Long id);
}
