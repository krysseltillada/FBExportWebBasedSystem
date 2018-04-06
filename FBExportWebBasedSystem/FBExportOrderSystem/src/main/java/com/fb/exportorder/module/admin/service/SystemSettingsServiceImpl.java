package com.fb.exportorder.module.admin.service;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.SystemSettings;
import com.fb.exportorder.models.enums.Gender;
import com.fb.exportorder.module.admin.repository.SystemSettingsRepository;

@Service
public class SystemSettingsServiceImpl implements SystemSettingsService {
	
	@Autowired
	private SystemSettingsRepository systemSettingsRepository;

	@Override
	public List<SystemSettings> findAll() {
		return (List<SystemSettings>)systemSettingsRepository.findAll();
	}

	@Override
	public void addSystemSettings(SystemSettings systemSettings) {
		systemSettingsRepository.save(systemSettings);
	}

	@Override
	public boolean isSystemBackupFileExist(String filePathString) {
		File f = new File(filePathString);
		if(f.exists() && !f.isDirectory()) 
		    return true;
		return false;
	}

	@Override
	public String uploadFile(MultipartFile file) {
		
		
			
		try {
			byte[] bytes = file.getBytes();
			
			if (!file.isEmpty()) {
				if(!FilenameUtils.getExtension(file.getOriginalFilename()).equals("sql"))
					return "Error uploading file. Wrong file type";
				
				Path path = FileSystems.getDefault().getPath("src\\main\\webapp\\system-backup\\fbexport_backup.sql");
				Files.write(path, bytes);
			} else {
				
				return "";
			}
			
		}catch(Exception e) {
			return e.getMessage();
		}
		
		return "Success";
		
	}

	@Override
	public void addInitialSystemSettings(SystemSettings systemSettings) {
		systemSettingsRepository.save(systemSettings);
	}
	
	
	
}
