package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.fb.exportorder.models.SystemNotification;

public interface SystemNotificationRepository 
				 extends PagingAndSortingRepository<SystemNotification, Long> {
	
	@Query(value = "SELECT sn.notification_id, sn.date, sn.description, sn.header, sn.is_seen, sn.system_notification_status FROM system_notification sn " + 
				   "INNER JOIN employee_system_notification_list esnl ON sn.notification_id = esnl.system_notification_list_notification_id " +  
				   "WHERE esnl.employee_id = :employeeId ORDER BY sn.date DESC LIMIT :record OFFSET :offset",
		   nativeQuery = true)
	List<Object[]> getAllNotificationByEmployeeId(@Param("employeeId") long employeeId,
												  @Param("record") int record,
									  			  @Param("offset") int offset);
	
	@Query(value = "SELECT sn.notification_id, sn.date, sn.description, sn.header, sn.is_seen, sn.system_notification_status FROM system_notification sn " + 
				   "INNER JOIN employee_system_notification_list esnl ON sn.notification_id = esnl.system_notification_list_notification_id " +  
				   "WHERE esnl.employee_id = :employeeId AND sn.is_seen = false ORDER BY sn.date DESC",
		   nativeQuery = true)
	List<Object[]> getAllNotificationByEmployeeId(@Param("employeeId") long employeeId);
	
	@Modifying
	@Query(value = "UPDATE SystemNotification sn SET sn.isSeen = true WHERE sn.notificationId = :notificationId")
	void seenNotificationByNotificationId(@Param("notificationId") long notificationId);

}
