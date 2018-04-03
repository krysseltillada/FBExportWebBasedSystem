package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.SystemLog;

public interface SystemLogService {
	void addSystemLog(SystemLog systemLog);
	List<SystemLog> getAllSystemLog();
}
