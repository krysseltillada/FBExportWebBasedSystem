package com.fb.exportorder.module.customer.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.fb.exportorder.models.customer.Notification;

public interface NotificationRepository 
				 extends PagingAndSortingRepository<Notification, Long> {

}
