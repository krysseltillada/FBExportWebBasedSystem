package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.UserAccessLog;
import com.fb.exportorder.module.admin.repository.UserAccessLogRepository;

@Service
public class UserAccessLogImpl implements UserAccessLogService {

	@Autowired
	private UserAccessLogRepository userAccessLogRepository;
	
	@Override
	public List<UserAccessLog> getAllUserAccessLog() {
		return userAccessLogRepository.getAllUserAccessLog();
	}

	@Override
	public void addUserAccessLog(UserAccessLog userAccessLog) {
		userAccessLogRepository.save(userAccessLog);
	}

}
