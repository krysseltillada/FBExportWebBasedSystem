package com.fb.exportorder.module.admin.handlers;

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

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.module.admin.repository.ManageEmployeeRepository;

@Component("adminLoginFailureHandler")
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	ManageEmployeeRepository employeeRepository;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException ex)
			throws IOException, ServletException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Employee employee = employeeRepository.findAccountByUsername(username);
		Employee employeeByEmail = employeeRepository.findAccountByEmail(username);
		
		String errorMessage = "";
		
		if (Objects.nonNull(employee)) {
			
			if (!StringUtils.equals(employee.getPassword(), password))
				errorMessage = "invalid password";
			
		} else if (Objects.nonNull(employeeByEmail)) {
			
			if (!StringUtils.equals(employeeByEmail.getPassword(), password))
				errorMessage = "invalid password";
			
		}
		else {
			errorMessage = "invalid username or email";
		}
		System.out.println("tngina");
		response.sendRedirect(request.getServletContext().getContextPath() + "/admin/login?errorMessage=" + errorMessage);
		
	}

}
