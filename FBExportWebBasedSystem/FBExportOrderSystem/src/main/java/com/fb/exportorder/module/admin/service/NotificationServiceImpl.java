package com.fb.exportorder.module.admin.service;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.messaging.MessagingException;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.repository.SystemNotificationRepository;
import com.fb.exportorder.module.admin.session.EmployeeSessionBean;

@Service("AdminNotificationService")
public class NotificationServiceImpl implements NotificationService {
	
	@Autowired
	private EmployeeSessionBean employeeSessionBean;

	@Autowired
	private SystemNotificationRepository systemNotificationRepository;
	
	@Autowired
	private ManageEmployeeService manageEmployeeService;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	
	private long addNotificationToEmployee(SystemNotification notification, Employee employee) {
		
		String timeStampFormat = simpleDateFormat.format(notification.getDate());
		long employeeId = employee.getId();
		
		String insertSystemNotificationStatement
				= "INSERT INTO system_notification (date, description, header, is_seen, system_notification_status)" +
				  "VALUES ('" + timeStampFormat+ "', '" + notification.getDescription() + "', '" + notification.getHeader() + "', " + notification.isSeen() + ", '" + notification.getSystemNotificationStatus() +  "' )";
		
		jdbcTemplate.execute(insertSystemNotificationStatement);
		
		long notificationId = (Long)jdbcTemplate.queryForList("SELECT notification_id FROM system_notification ORDER BY notification_id DESC").get(0).get("notification_id");
	
		jdbcTemplate.execute("INSERT INTO employee_system_notification_list VALUES (" + employeeId + ", " + notificationId + ")");
		
		return notificationId;

	}
	
	
	@Override
	public void pushNotification(SystemNotification notification) {
			
//			long notificationId = addNotificationToEmployee(notification, manageEmployeeService.getEmployeeById(employeeSessionBean.getEmployeeId()));
			
			List<Employee> employeeList = manageEmployeeService.getAllEmployees();
			
			for(Employee employee : employeeList) {
				notification.setNotificationId(null);

				if (employee.isOnline()) { 
					long notificationId = addNotificationToEmployee(notification, employee);
					notification.setNotificationId(notificationId);
					
					try {
						
						simpMessagingTemplate.convertAndSend("/queue/push-notification-employee-id-" + employee.getId(), 
															 new ObjectMapper().writeValueAsString(notification));
						
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JsonProcessingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				} else {
					
					addNotificationToEmployee(notification, employee);
					
				}
			}
			
	}


	@Override
	@Transactional
	public void seenNotification(long notificationId) {
		systemNotificationRepository.seenNotificationByNotificationId(notificationId);
	}

	@Override
	public List<SystemNotification> getAllNotificationByEmployeeId(long employeeId, int record, int offset) {
		
		List<SystemNotification> systemNotificationList = new ArrayList<SystemNotification>();
		List<Object[]> rawSystemNotificationList = systemNotificationRepository.getAllNotificationByEmployeeId(employeeId, record, offset);
		
		for(Object[] rawSystemNotification : rawSystemNotificationList) {
			
			SystemNotification systemNotification = new SystemNotification();
			
			systemNotification.setNotificationId(((BigInteger)rawSystemNotification[0]).longValue());
			systemNotification.setDate((Date)rawSystemNotification[1]);
			systemNotification.setDescription((String)rawSystemNotification[2]);
			systemNotification.setHeader((String)rawSystemNotification[3]);
			systemNotification.setSeen((Boolean)rawSystemNotification[4]);
			systemNotification.setSystemNotificationStatus(SystemNotificationStatus.valueOf((String)rawSystemNotification[5]));
			
			systemNotificationList.add(systemNotification);
			
		}
		
		return systemNotificationList;

	}


	@Override
	public List<SystemNotification> getAllNotificationByEmployeeId(long employeeId) {
		
		List<SystemNotification> systemNotificationList = new ArrayList<SystemNotification>();
		List<Object[]> rawSystemNotificationList = systemNotificationRepository.getAllNotificationByEmployeeId(employeeId);
		
		for(Object[] rawSystemNotification : rawSystemNotificationList) {
			
			SystemNotification systemNotification = new SystemNotification();
			
			systemNotification.setNotificationId(((BigInteger)rawSystemNotification[0]).longValue());
			systemNotification.setDate((Date)rawSystemNotification[1]);
			systemNotification.setDescription((String)rawSystemNotification[2]);
			systemNotification.setHeader((String)rawSystemNotification[3]);
			systemNotification.setSeen((Boolean)rawSystemNotification[4]);
			systemNotification.setSystemNotificationStatus(SystemNotificationStatus.valueOf((String)rawSystemNotification[5]));
			
			systemNotificationList.add(systemNotification);
			
		}
		
		return systemNotificationList;
		
	}
	
}
