package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Order;

@Repository
public interface OrderRepository extends PagingAndSortingRepository<Order, Long> {
	
	@Query("SELECT o FROM Orders o ORDER BY o.orderId DESC")
	List<Order> getAllOrders();
	
	@Query(value="SELECT COUNT(*), o.order_status From orders o GROUP BY o.order_status", nativeQuery=true)
	List<Object[]> getOrdersCount();
	
	@Query(value="SELECT * FROM orders o ORDER BY o.date_ordered DESC LIMIT 5", nativeQuery=true)
	List<Order> getLatestOrders();
	
	@Query(value="SELECT * FROM orders o WHERE o.order_status = 'PAID'", nativeQuery=true)
	List<Order> getPaidOrders();
	
	@Query(value="SELECT * FROM orders o WHERE o.order_status = 'PAID' AND o.date_paid >= DATE_ADD(CURDATE(), INTERVAL - 4 MONTH) AND o.date_paid <= CURDATE()", nativeQuery=true)
	List<Order> getPaidOrdersPreviousMonths();

}
