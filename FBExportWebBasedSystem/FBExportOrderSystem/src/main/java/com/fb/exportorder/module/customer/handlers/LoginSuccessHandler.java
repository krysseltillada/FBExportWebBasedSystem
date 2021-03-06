package com.fb.exportorder.module.customer.handlers;

import java.io.IOException;
import java.util.Date;
import java.util.List;
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

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.admin.repository.SystemSettingsRepository;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.session.CustomerSessionBean;
import com.fb.exportorder.utilities.Time;

@Component("customerLoginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private CustomerSessionBean customerSessionBean;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private SystemSettingsRepository systemSettingsRepository;
	
	@Value("${fbexport.server.domain.name}")
	private String serverDomainName;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response, 
										Authentication auth)
			throws IOException, ServletException {
		
		
		String usernameOrEmail = request.getParameter("username");
		
		Customer customer = customerRepository.findAccountByUsername(usernameOrEmail);
		Customer customerByEmail = customerRepository.findAccountByEmail(usernameOrEmail);
		
		HttpSession session = request.getSession();
		
		if (Objects.nonNull(session.getAttribute("employeeName"))) {
			session.removeAttribute("employeeName");
			session.removeAttribute("position");
			session.removeAttribute("employeeId");
			session.removeAttribute("employeeProfileImageLink");
		}
		
		
		System.out.println(session.getId());
		
		String name = (Objects.nonNull(customer)) ? customer.getFirstname() :
													customerByEmail.getFirstname();
		
		String profileImageLink = (Objects.nonNull(customer)) ? customer.getProfileImageLink() :
									 						    customerByEmail.getProfileImageLink();
		
		String username = (Objects.nonNull(customer)) ? customer.getUsername() :
														customerByEmail.getUsername();
		
		long customerId = (Objects.nonNull(customer)) ? customer.getId() :
														customerByEmail.getId();
		
		
		session.setAttribute("customerName", name);
		session.setAttribute("customerId", customerId);
		session.setAttribute("customerProfileImageLink", profileImageLink);
		session.setAttribute("customerUsername", username);
		
		customerSessionBean.setCustomerId(customerId);
		
		Date logoutTime = ((List<SystemSettings>)systemSettingsRepository.findAll()).get(0).getLogoutTime();
		
		session.setAttribute("logoutTime", Time.convertTimeToMilliseconds(logoutTime.getHours(), logoutTime.getMinutes(), logoutTime.getSeconds()));
		
		if(Objects.nonNull(customer)) {
			customer.setOnline(true);
			customerRepository.save(customer);
		}else {
			customerByEmail.setOnline(true);
			customerRepository.save(customerByEmail);
		}
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/");
		
	}

}
