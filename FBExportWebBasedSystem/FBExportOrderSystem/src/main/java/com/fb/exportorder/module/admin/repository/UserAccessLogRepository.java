package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.UserAccessLog;

@Repository
public interface UserAccessLogRepository 
				 extends CrudRepository<UserAccessLog, Long>{
	
	@Query("SELECT ua FROM UserAccessLog ua ORDER BY ua.timeOccured DESC")
	List<UserAccessLog> getAllUserAccessLog();

}
