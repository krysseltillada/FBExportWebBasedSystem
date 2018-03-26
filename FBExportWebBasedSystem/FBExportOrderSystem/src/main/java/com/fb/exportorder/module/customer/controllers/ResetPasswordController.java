package com.fb.exportorder.module.customer.controllers;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.module.customer.service.ResetPasswordService;

@Controller
public class ResetPasswordController {
	
	@Autowired
	private ResetPasswordService resetPasswordService;
	
	@RequestMapping("/resetpassword/{id}/{hash}")
	public String resetPassword(@PathVariable Long id,
								@PathVariable String hash,
								String newPassword,
								String retypePassword,
								RedirectAttributes redirectAttributes,
								Model model) {
		
		
		if(Objects.nonNull(newPassword) && Objects.nonNull(retypePassword)) {
			List<String> errors = resetPasswordService.validatePassword(newPassword, retypePassword);
			if(!errors.isEmpty()) {
				model.addAttribute("errorForgotPassword", errors);
				return "reset-password";
			}else {
				redirectAttributes.addFlashAttribute("accountFound", "You've successfully change your password");
				return resetPasswordService.resetPassword(newPassword, id);
			}
		}
		
		redirectAttributes.addFlashAttribute("accountNotFound", "Can't change password. Account not found");
	
		return resetPasswordService.checkAccount(id, hash, newPassword);
		
	}
	
}
