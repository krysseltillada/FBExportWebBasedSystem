package com.fb.exportorder.module.customer.tracker;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
public class CustomerAspectConfiguration {
	
	@Bean
	public OrderNotificationTracker orderNotificationTracker() {
		return new OrderNotificationTracker();
	}
	
	@Bean
	public ActivityTracker activityTracker() {
		return new ActivityTracker();
	}
	
}
