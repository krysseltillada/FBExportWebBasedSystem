package com.fb.exportorder.module.admin.service;

import java.util.List;

import com.fb.exportorder.models.UserAccessLog;

public interface UserAccessLogService {
	void addUserAccessLog(UserAccessLog userAccessLog);
	List<UserAccessLog> getAllUserAccessLog();
}
