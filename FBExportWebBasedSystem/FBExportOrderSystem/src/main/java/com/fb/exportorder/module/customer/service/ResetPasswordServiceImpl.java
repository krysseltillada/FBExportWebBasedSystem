package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.utilities.MD5Encoder;
import com.fb.exportorder.utilities.PasswordValidator;

import edu.vt.middleware.password.RuleResult;

@Service
public class ResetPasswordServiceImpl implements ResetPasswordService{
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private MD5Encoder encoder;
	
	@Autowired
	private PasswordValidator passwordValidator;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String checkAccount(Long id, String hash, String newPassword) {
		Customer customer = customerRepository.findOne(id);
		if(Objects.isNull(customer)) {
			return "redirect:/login";
		}else {
			if(!encoder.encode(customer.getUsername()+customer.getContact().getEmailAddress()).equals(hash)) {
				return "redirect:/login";
			}
				
		}
		return "reset-password";
	}
	
	@Override
	public List<String> validatePassword(String newPassword, String retypePassword) {
		List<String> errorMessages = new ArrayList<>();
		
		RuleResult result = passwordValidator.validate(newPassword);
		RuleResult sResult = passwordValidator.validateSpecialCharacters(newPassword);
		
		if (!result.isValid()) {
			for (String errorMessage : passwordValidator.getPasswordValidator().getMessages(result)) {
					if (StringUtils.isNotEmpty(errorMessage))
						errorMessages.add(errorMessage);
			}
		}
		
		if (sResult.isValid())
			errorMessages.add("Password must not contain special characters");
		
		if(!newPassword.equals(retypePassword))
			errorMessages.add("Retype password is not equal");
		
		return errorMessages;
	}
	
	@Override
	public String resetPassword(String newPassword, Long id) {
		Customer customer = customerRepository.findOne(id);
		String encryptedPassword = passwordEncoder.encode(newPassword);
		customer.setPassword(encryptedPassword);
		customerRepository.save(customer);
		
		return "redirect:/login";
	}
}
