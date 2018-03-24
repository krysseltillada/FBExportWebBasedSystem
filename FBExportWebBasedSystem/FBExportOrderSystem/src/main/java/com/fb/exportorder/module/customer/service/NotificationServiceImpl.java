package com.fb.exportorder.module.customer.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.MessagingException;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Notification;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void pushNotification(Notification notification, Customer customer) {

		customerService.addNotificationToCustomer(notification, customer);
		
		
		try {
			
			if (customer.isOnline()) {

				
				simpMessagingTemplate.convertAndSend("/queue/push-notification-user-id-" + customer.getId(), 
													 new ObjectMapper().writeValueAsString(notification));
				
			}
			
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
		
		sessionFactory.getCurrentSession()
					  .createQuery("UPDATE Notification n SET n.isSeen = true WHERE n.notificationId =" + notificationId)
					   .executeUpdate();
		
	}

}
