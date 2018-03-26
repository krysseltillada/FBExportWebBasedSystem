package com.fb.exportorder.module.customer.controllers;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.service.EmailService;
import com.fb.exportorder.utilities.MD5Encoder;

@Controller("customerLoginController")
public class LoginController {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private MD5Encoder encoder;
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/login")
	public String login (HttpServletRequest request, Model model) {
		model.addAttribute("loginErrorMessage", "");
		return "login";
	}
	
	@RequestMapping(value = "/login", params={"errorMessage"})
	public String loginError (@RequestParam String errorMessage,
							  Model model) {
		
		model.addAttribute("loginErrorMessage", errorMessage);

		return "login";
	}
	
	@RequestMapping("/login/{id}/{hashAddress}")
	public String emailActivitation(@PathVariable Long id,
									@PathVariable String hashAddress,
									Model model) {
		Customer customer = customerRepository.findOne(id);
		
		if(Objects.isNull(customer)) {
			model.addAttribute("accountNotFound", "Account not found");
		}else {
			if(hashAddress.equals(encoder.encode(customer.getContact().getEmailAddress()+customer.getUsername()))) {
				if(customer.isEnabled())
					model.addAttribute("accountFound", "Account already activated");
				else {
					customer.setEnabled(true);
					customerRepository.save(customer);
					model.addAttribute("accountFound", "You've successfully activate your account");
				}
			}else
				model.addAttribute("accountNotFound", "Account not found");
		}
		
		return "login";
	}
	
	@RequestMapping(value="/forgotpassword", method=RequestMethod.POST)
	@ResponseBody
	public String contactUsEmail(String email) {
		return emailService.forgotPassword(email);
	}
	
}
