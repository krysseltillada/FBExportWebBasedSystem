package com.fb.exportorder.module.admin.tracker;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
public class AdminAspectConfiguration {
		
	@Bean
	public AdminNotificationTracker adminNotificationTracker() {
		return new AdminNotificationTracker();
	}
	
	@Bean
	public ReportLogTracker reportLogTracker() {
		return new ReportLogTracker();
	}

}
