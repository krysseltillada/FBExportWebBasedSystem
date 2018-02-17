package com.fb.exportorder.module.customer.handlers;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	CustomerRepository customerRepository;
	
	@Value("${fbexport.server.domain.name}")
	String serverDomainName;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response, 
										Authentication auth)
			throws IOException, ServletException {
		
		String usernameOrEmail = request.getParameter("username");
		
		Customer customer = customerRepository.findAccountByUsername(usernameOrEmail);
		Customer customerByEmail = customerRepository.findAccountByEmail(usernameOrEmail);
		
		HttpSession session = request.getSession();
		
		String name = (Objects.nonNull(customer)) ? customer.getFirstname() :
													customerByEmail.getFirstname();
		
		String profileImageLink = (Objects.nonNull(customer)) ? customer.getProfileImageLink() :
									 						    customerByEmail.getProfileImageLink();
		
	
		
		long customerId = (Objects.nonNull(customer)) ? customer.getId() :
														customerByEmail.getId();
		
		
		session.setAttribute("name", name);
		session.setAttribute("customerId", customerId);
		session.setAttribute("profileImageLink", profileImageLink);
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/");
		
	}

}
