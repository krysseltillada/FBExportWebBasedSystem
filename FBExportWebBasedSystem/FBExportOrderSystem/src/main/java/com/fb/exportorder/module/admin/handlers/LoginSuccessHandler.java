package com.fb.exportorder.module.admin.handlers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
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
import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.module.admin.repository.ManageEmployeeRepository;
import com.fb.exportorder.module.admin.repository.SystemSettingsRepository;
import com.fb.exportorder.utilities.Time;


@Component("adminLoginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	ManageEmployeeRepository employeeRepository;
	
	@Autowired
	SystemSettingsRepository systemSettingsRepository;
	
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
		
		String username = (Objects.nonNull(employee)) ? employee.getUsername() :
														employeeByEmail.getUsername();
		
		String profileImageLink = (Objects.nonNull(employee)) ? employee.getProfileImageLink() :
																employeeByEmail.getProfileImageLink();
		
	
		
		long customerId = (Objects.nonNull(employee)) ? employee.getId() :
														employeeByEmail.getId();
		
		session.setAttribute("employeeName", name);
		session.setAttribute("position", position);
		session.setAttribute("employeeId", customerId);
		session.setAttribute("employeeProfileImageLink", profileImageLink);
		session.setAttribute("employeeUsername", username);
		
		Date logoutTime = ((List<SystemSettings>)systemSettingsRepository.findAll()).get(0).getLogoutTime();
		
		session.setAttribute("logoutTime", Time.convertTimeToMilliseconds(logoutTime.getHours(), logoutTime.getMinutes(), logoutTime.getSeconds()));
		
		if(Objects.nonNull(employee))
			employee.setOnline(true);
		else
			employeeByEmail.setOnline(true);
		
		employeeRepository.save(employee);
		
//		String time = ((List<SystemSettings>)systemSettingsRepository.findAll()).get(0).getLogoutTime().toString();
//		String[] timeSplit = time.split(":");
//		
//		System.out.println(timeSplit[1].charAt(1));
		
//		session.setAttribute("logoutTime", timeSplit[1].charAt(1));
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/admin/dashboard");
		
	}

}
