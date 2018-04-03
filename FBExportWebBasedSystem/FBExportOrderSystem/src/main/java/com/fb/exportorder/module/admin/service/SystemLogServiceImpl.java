package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.SystemLog;
import com.fb.exportorder.module.admin.repository.SystemLogRepository;

@Service
public class SystemLogServiceImpl implements SystemLogService {

	@Autowired
	private SystemLogRepository systemLogRepository;
	
	@Override
	public void addSystemLog(SystemLog systemLog) {
		systemLogRepository.save(systemLog);
	}

	@Override
	public List<SystemLog> getAllSystemLog() {
		return systemLogRepository.getAllSystemLog();
	}

}
