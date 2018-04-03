package com.fb.exportorder.module.admin.controllers;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.models.UserAccessLog;
import com.fb.exportorder.models.enums.ActionType;
import com.fb.exportorder.module.admin.service.ManageEmployeeService;
import com.fb.exportorder.module.admin.service.SystemLogService;
import com.fb.exportorder.module.admin.service.UserAccessLogService;

@Controller("adminSignOutController")
public class SignOutController {
	
	@Autowired
	private ManageEmployeeService employeeService;
	
	@Autowired
	private SystemLogService systemLogService;
	
	@Autowired
	private UserAccessLogService userAccessLogService;
	
	@RequestMapping("/admin/sign-out")
	public String signOut (@RequestParam(required=false) String isSystemAutoLogout,
						   HttpSession session, 
						   HttpServletRequest request,
						   HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext()
												   .getAuthentication();
		
		
		if (auth != null) {
			
			if(session.getAttribute("employeeUsername") != null) {
				Employee employee = employeeService.getEmployeeByUsername(session.getAttribute("employeeUsername").toString());
				employee.setOnline(false);
				employeeService.saveEmployee(employee);
				
				if (StringUtils.isNotBlank(isSystemAutoLogout)) {
				
					SystemLog systemLog = new SystemLog();
					
					systemLog.setActionType(ActionType.SYSTEM);
					systemLog.setDescription("Auto logout called on " + employee.getFirstname() + " " + employee.getLastname());
					systemLog.setTimeOccured(new Date());
					systemLog.setDateOccured(new Date());
					
					systemLogService.addSystemLog(systemLog);
					
				} else {
					
					UserAccessLog userAccessLog = new UserAccessLog();
					
					userAccessLog.setEmployee(employee);
					userAccessLog.setDescription(employee.getFirstname() + " " + employee.getLastname() + " has logged out");
					
					userAccessLog.setIpAddress(request.getRemoteAddr());
					userAccessLog.setTimeOccured(new Date());
					userAccessLog.setDateOccured(new Date());
					
					userAccessLogService.addUserAccessLog(userAccessLog);
					
				}
				
			}
			
			new SecurityContextLogoutHandler().logout(request, response, auth);
		} 
		
		return "redirect:/admin/login";
	}
	
}
