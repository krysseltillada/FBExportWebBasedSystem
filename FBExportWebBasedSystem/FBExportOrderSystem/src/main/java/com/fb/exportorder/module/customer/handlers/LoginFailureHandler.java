package com.fb.exportorder.module.customer.handlers;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Component("customerLoginFailureHandler")
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException ex)
			throws IOException, ServletException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Customer customer = customerRepository.findAccountByUsername(username);
		Customer customerByEmail = customerRepository.findAccountByEmail(username);
		
		System.out.println(customer);
		System.out.println(customerByEmail);
		
		String errorMessage = "";
		
		if (Objects.nonNull(customer)) {
			
			if (!StringUtils.equals(customer.getPassword(), password))
				errorMessage = "invalid password";
			
		} else if (Objects.nonNull(customerByEmail)) {
			
			if (!StringUtils.equals(customerByEmail.getPassword(), password))
				errorMessage = "invalid password";
			
		}
		else {
			errorMessage = "invalid username or email";
		}
		System.out.println("tngina");
		response.sendRedirect(request.getServletContext().getContextPath() + "/login?errorMessage=" + errorMessage);
		
	}

}
