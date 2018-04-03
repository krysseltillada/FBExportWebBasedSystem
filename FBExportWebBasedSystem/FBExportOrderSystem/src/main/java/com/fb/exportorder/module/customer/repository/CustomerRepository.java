package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;

@Repository
public interface CustomerRepository
				 extends PagingAndSortingRepository<Customer, Long>{

	@Query("SELECT c FROM Customer c WHERE c.username = :username")
	Customer findAccountByUsername (@Param("username")String username);
	
	@Query("SELECT COUNT(c.contact.emailAddress) > 0 FROM Customer c WHERE c.contact.emailAddress = :email")
	boolean isEmailExists (@Param("email") String email);
	
	@Query("SELECT c FROM Customer c WHERE c.contact.emailAddress = :email")
	Customer findAccountByEmail (@Param("email") String email);
	
	@Query("SELECT c.activities FROM Customer c WHERE c.id = :id")
	List<Activity> getActivitiesById(@Param("id") long id);
	
	@Query("SELECT c.activities FROM Customer c WHERE c.id = :id")
	List<Activity> getActivitiesById(@Param("id") long id, 
            Pageable pageRequest);
	
	@Query(value = "SELECT * FROM activity a WHERE a.customer_id = :id ORDER BY a.date DESC LIMIT :record OFFSET :offset", 
		   nativeQuery=true)
	List<Object[]> getActivitiesByIdRecordsAndOffset(@Param("id") long customerId,
													 @Param("record") int record,
													 @Param("offset") int offset); 	
	
	@Query("SELECT COUNT (c.username) > 0 FROM Customer c WHERE c.username = :username")
	boolean isUsernameExists (@Param("username") String username);
	
	@Query("SELECT o FROM Orders o WHERE o.customer.id = :customerId ORDER BY o.orderId DESC")
	List<Order> getOrdersByCustomerId (@Param("customerId") long customerId, Pageable pageable);
	
	@Query(value="SELECT COUNT(*), c.online FROM customer c GROUP BY c.online", nativeQuery=true)
	List<Object[]> getOnlineUsersCount();
	
	@Query(value = "SELECT * FROM notification n INNER JOIN customer_notifications cn ON n.notification_id = cn.notifications_notification_id WHERE cn.customer_id = :id ORDER BY n.date DESC LIMIT :record OFFSET :offset",
		   nativeQuery = true)
	List<Object[]> getNotificationsByIdRecordsAndOffset(@Param("id") long customerId,
														@Param("record") int record,
														@Param("offset") int offset);
	
	@Query(value = "SELECT * FROM notification n INNER JOIN customer_notifications cn ON n.notification_id = cn.notifications_notification_id WHERE cn.customer_id = :id AND n.is_seen = false ORDER BY n.date DESC",
		   nativeQuery = true)
	List<Object[]> getNotificationsByCustomerId(@Param("id") long customerId);
	
}
