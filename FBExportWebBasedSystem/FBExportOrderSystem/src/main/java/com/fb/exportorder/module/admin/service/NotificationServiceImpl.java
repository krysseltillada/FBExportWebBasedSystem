package com.fb.exportorder.module.admin.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	private long addNotificationToEmployee(SystemNotification notification, Employee employee) {
		
		employee.getSystemNotificationList()
				.add(notification);
		
		manageEmployeeService.saveEmployee(employee);
		
		return getAllNotificationByEmployeeId(employee.getId(), 1, 0).get(0).getNotificationId();

	}
	
	
	@Override
	public void pushNotification(SystemNotification notification) {
			
			long notificationId = addNotificationToEmployee(notification, manageEmployeeService.getEmployeeById(employeeSessionBean.getEmployeeId()));
			
			List<Employee> otherEmployeeList = manageEmployeeService.getAllEmployees();
			
			for(Employee otherEmployee : otherEmployeeList) {
				if (otherEmployee.getId() != employeeSessionBean.getEmployeeId())
					addNotificationToEmployee(notification, otherEmployee);
			}
			
		
			try {
					
				notification.setNotificationId(notificationId);
				
				simpMessagingTemplate.convertAndSend("/topic/notification", 
													 new ObjectMapper().writeValueAsString(notification));
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
