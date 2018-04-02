package com.fb.exportorder.module.customer.service;

import java.util.List;

public interface ResetPasswordService {
	List<String> validatePassword(String newPassword, String retypePassword);
	String checkAccount(Long id, String hash, String newPassword);
	String resetPassword(String newPassword, Long id);
}
