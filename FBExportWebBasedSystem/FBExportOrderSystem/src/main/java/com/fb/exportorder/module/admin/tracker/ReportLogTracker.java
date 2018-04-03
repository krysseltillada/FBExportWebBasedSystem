package com.fb.exportorder.module.admin.tracker;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class ReportLogTracker {
	
	@After("execution(public void com.fb.exportorder..service.SystemSettingsService+.addSystemSettings(..))")
	void detectSystemEditSettings (JoinPoint joinPoint) {
		
		
		
		
		System.out.println("edit system settings set the logout time to " );
	}

}
