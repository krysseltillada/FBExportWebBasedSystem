package com.fb.exportorder;

import java.util.Date;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.models.enums.ActionType;
import com.fb.exportorder.module.admin.service.SystemLogService;

@Component
public class ApplicationEvent  {

	@Autowired
	private SystemLogService systemLogService;
	
	@PostConstruct
	public void OnApplicationStart() {
		
		SystemLog systemLog = new SystemLog();
		
		systemLog.setActionType(ActionType.SYSTEM);
		systemLog.setDescription("System Start");
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		
		systemLogService.addSystemLog(systemLog);
		
	}
	
	@PreDestroy
	public void OnApplicationEnd() {
		
		SystemLog systemLog = new SystemLog();
		
		systemLog.setActionType(ActionType.SYSTEM);
		systemLog.setDescription("System Shutdown");
		systemLog.setTimeOccured(new Date());
		systemLog.setDateOccured(new Date());
		
		systemLogService.addSystemLog(systemLog);
		
	}

	

}
