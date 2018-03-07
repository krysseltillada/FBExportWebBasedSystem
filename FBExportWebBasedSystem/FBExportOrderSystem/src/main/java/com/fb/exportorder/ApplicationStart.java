package com.fb.exportorder;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

public class ApplicationStart extends ContextLoaderListener{

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		super.contextDestroyed(event);
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
	}
	
	
}
