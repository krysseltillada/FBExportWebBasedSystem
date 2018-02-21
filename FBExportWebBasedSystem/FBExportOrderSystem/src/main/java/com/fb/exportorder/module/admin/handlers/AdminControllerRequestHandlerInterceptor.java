package com.fb.exportorder.module.admin.handlers;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminControllerRequestHandlerInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if (StringUtils.equals(request.getDispatcherType().name(),
							   "REQUEST")) {
			
			HttpSession session = request.getSession(false);
			
			if (Objects.nonNull(session)) {
				
				if (Objects.nonNull(session.getAttribute("employeeName"))) {
					
					System.out.println(session.getAttribute("employeeName"));
					
					if (StringUtils.equals(request.getRequestURI(), 
										   "/FBExportSystem/admin/login") || 
						StringUtils.equals(request.getRequestURI(), 
									   	   "/FBExportSystem/admin")) {
						response.sendRedirect("/FBExportSystem/admin/dashboard");
					}
					
				} 
			} 
			
		
		}

		
		return true;
	}

}
