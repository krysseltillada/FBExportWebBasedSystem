package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.module.admin.repository.SystemSettingsRepository;

@Service
public class SystemSettingsServiceImpl implements SystemSettingsService {
	
	@Autowired
	SystemSettingsRepository systemSettingsRepository;

	@Override
	public List<SystemSettings> findAll() {
		return (List<SystemSettings>)systemSettingsRepository.findAll();
	}

	@Override
	public void addSystemSettings(SystemSettings systemSettings) {
		systemSettingsRepository.save(systemSettings);
	}
	
	
}
