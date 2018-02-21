package com.fb.exportorder;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.fb.exportorder.module.admin.handlers.AdminControllerRequestHandlerInterceptor;
import com.fb.exportorder.module.customer.handlers.ControllerRequestHandlerInterceptor;

@Configuration
public class WebConfiguration extends WebMvcConfigurerAdapter {

	@Bean
	ControllerRequestHandlerInterceptor controllerRequestHandlerInterceptor() {
		return new ControllerRequestHandlerInterceptor();
	}
	
	@Bean
	AdminControllerRequestHandlerInterceptor adminControllerRequestHandlerInterceptor() {
		return new AdminControllerRequestHandlerInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(controllerRequestHandlerInterceptor());
		registry.addInterceptor(adminControllerRequestHandlerInterceptor());
	}
	
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
	
	


}
