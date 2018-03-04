package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.SystemSettings;

public interface SystemSettingsService {
	
	public List<SystemSettings> findAll();
	
	public void addSystemSettings(SystemSettings systemSettings);
}
