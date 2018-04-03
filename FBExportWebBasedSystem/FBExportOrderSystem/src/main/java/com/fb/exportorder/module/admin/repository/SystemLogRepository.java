package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.SystemLog;

@Repository
public interface SystemLogRepository 
				 extends CrudRepository<SystemLog, Long> {

	@Query("SELECT sl FROM SystemLog sl ORDER BY sl.timeOccured DESC")
	List<SystemLog> getAllSystemLog();
	
}
