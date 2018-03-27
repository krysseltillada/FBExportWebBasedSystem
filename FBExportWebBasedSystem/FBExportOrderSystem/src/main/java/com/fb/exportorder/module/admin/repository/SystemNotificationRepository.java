package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.fb.exportorder.models.SystemNotification;

public interface SystemNotificationRepository 
				 extends PagingAndSortingRepository<SystemNotification, Long> {
	
	@Query(value = "SELECT * FROM system_notification sn ORDER BY sn.date DESC LIMIT :record OFFSET :offset",
		   nativeQuery = true)
	List<Object[]> getAllNotification(@Param("record") int record,
									  @Param("offset") int offset);

}
