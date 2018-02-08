package com.fb.exportorder;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.fb.exportorder.module.customer.handlers.ControllerRequestHandlerInterceptor;

@Configuration
public class WebConfiguration extends WebMvcConfigurerAdapter {

	@Bean
	ControllerRequestHandlerInterceptor controllerRequestHandlerInterceptor() {
		return new ControllerRequestHandlerInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(controllerRequestHandlerInterceptor());
	}


}
