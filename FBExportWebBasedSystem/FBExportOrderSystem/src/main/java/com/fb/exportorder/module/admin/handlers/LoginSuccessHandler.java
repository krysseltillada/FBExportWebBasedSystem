package com.fb.exportorder.module.admin.handlers;

import java.io.IOException;
import java.util.Date;
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
import com.fb.exportorder.module.admin.session.EmployeeSessionBean;
import com.fb.exportorder.utilities.Time;


@Component("adminLoginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	ManageEmployeeRepository employeeRepository;
	
	@Autowired
	SystemSettingsRepository systemSettingsRepository;
	
	@Autowired
	EmployeeSessionBean employeeSessionBean;
	
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
		
		String gender = (Objects.nonNull(employee)) ? employee.getGender().toString() :
														employeeByEmail.getGender().toString();
		
		String profileImageLink = (Objects.nonNull(employee)) ? employee.getProfileImageLink() :
																employeeByEmail.getProfileImageLink();
		
		long employeeId = (Objects.nonNull(employee)) ? employee.getId() :
														employeeByEmail.getId();
		
		session.setAttribute("employeeName", name);
		session.setAttribute("position", position);
		session.setAttribute("employeeId", employeeId);
		session.setAttribute("employeeProfileImageLink", profileImageLink);
		session.setAttribute("employeeUsername", username);
		session.setAttribute("employeeGender", gender);
		
		employeeSessionBean.setEmployeeId(employeeId);
		
		Date logoutTime = ((List<SystemSettings>)systemSettingsRepository.findAll()).get(0).getLogoutTime();
		
		session.setAttribute("logoutTime", Time.convertTimeToMilliseconds(logoutTime.getHours(), logoutTime.getMinutes(), logoutTime.getSeconds()));
		
		if(Objects.nonNull(employee)) {
			employee.setOnline(true);
			employeeRepository.save(employee);
		}else {
			employeeByEmail.setOnline(true);
			employeeRepository.save(employeeByEmail);
		}
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/admin/dashboard");
		
	}

}
