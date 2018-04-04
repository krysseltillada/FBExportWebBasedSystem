package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.SystemSettings;

public interface SystemSettingsService {
	
	List<SystemSettings> findAll();
	
	void addSystemSettings(SystemSettings systemSettings);
	
	boolean isSystemBackupFileExist(String filePathString);
	
	String uploadFile(MultipartFile file);
}
