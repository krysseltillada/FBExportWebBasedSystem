package com.fb.exportorder.module.customer.handlers;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class ControllerRequestHandlerInterceptor extends HandlerInterceptorAdapter  {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if (StringUtils.equals(request.getDispatcherType().name(),
							   "REQUEST")) {
			
			HttpSession session = request.getSession(false);
			
			if (Objects.nonNull(session)) {
				
				if (Objects.nonNull(session.getAttribute("customerName"))) {
					
					System.out.println(session.getAttribute("customerName"));
					
					if (StringUtils.contains(request.getRequestURI(), 
										   "/FBExportSystem/login")) {
						response.sendRedirect("/FBExportSystem/");
					}
					
				} 
			} 
			
		
		}

		
		return true;
	}

}
