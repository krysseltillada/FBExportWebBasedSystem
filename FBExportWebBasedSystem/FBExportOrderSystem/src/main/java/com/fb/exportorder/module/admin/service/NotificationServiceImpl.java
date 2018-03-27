package com.fb.exportorder.module.admin.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.MessagingException;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.SystemNotification;
import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.enums.SystemNotificationStatus;
import com.fb.exportorder.module.admin.repository.SystemNotificationRepository;

@Service("AdminNotificationService")
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private SystemNotificationRepository systemNotificationRepository;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@Override
	public void pushNotification(SystemNotification notification) {
		
			systemNotificationRepository.save(notification);
		
			try {
					
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
	public List<SystemNotification> getAllNotification(int record, int offset) {
		
		List<SystemNotification> systemNotificationList = new ArrayList<SystemNotification>();
		List<Object[]> rawSystemNotificationList = systemNotificationRepository.getAllNotification(record, offset);
		
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
