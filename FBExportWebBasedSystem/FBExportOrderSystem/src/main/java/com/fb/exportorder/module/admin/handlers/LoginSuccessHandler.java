package com.fb.exportorder.module.admin.handlers;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.admin.repository.EmployeeRepository;


@Component("adminLoginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	EmployeeRepository employeeRepository;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
	
		
		String usernameOrEmail = request.getParameter("username");
		
		Employee employee = employeeRepository.findAccountByUsername(usernameOrEmail);
		Employee employeeByEmail = employeeRepository.findAccountByEmail(usernameOrEmail);
		
		HttpSession session = request.getSession();
		
		System.out.println(session.getId());
		
		if (Objects.nonNull(session.getAttribute("customerName"))) {
			session.removeAttribute("customerName");
			session.removeAttribute("customerId");
			session.removeAttribute("customerProfileImageLink");
		}
		
		
		String name = (Objects.nonNull(employee)) ? employee.getFirstname() + " " + employee.getLastname():
													employeeByEmail.getFirstname() + " " + employeeByEmail.getLastname();
		
		String position = (Objects.nonNull(employee)) ? employee.getPosition() :
														employeeByEmail.getPosition();
		
		String profileImageLink = (Objects.nonNull(employee)) ? employee.getProfileImageLink() :
																employeeByEmail.getProfileImageLink();
		
	
		
		long customerId = (Objects.nonNull(employee)) ? employee.getId() :
														employeeByEmail.getId();
		
		session.setAttribute("employeeName", name);
		session.setAttribute("position", position);
		session.setAttribute("employeeId", customerId);
		session.setAttribute("employeeProfileImageLink", profileImageLink);
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/admin/dashboard");
		
	}

}
