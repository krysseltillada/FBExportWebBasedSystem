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
	
	@Query(value="SELECT * FROM orders o WHERE o.is_paid = true", nativeQuery=true)
	List<Order> getPaidOrders();
	
	@Query(value="SELECT * FROM orders o WHERE o.is_paid = true AND o.date_paid >= DATE_ADD(CURDATE(), INTERVAL - 4 MONTH) AND o.date_paid <= CURDATE()", nativeQuery=true)
	List<Order> getPaidOrdersPreviousMonths();
	
	@Query(value = "SELECT o.date_paid as date, o.order_id as 'order id', " +
				   "CONCAT(o.total_weight, ' KILO') as 'weight sold', YEAR(o.date_paid) as year, " +
				   "MONTHNAME(o.date_paid) as month, CONCAT(TRUNCATE(((SUM(i.price) * 0.12) + 1000), 2), ' PHP') as expenses, " +
				   "CONCAT(TRUNCATE(SUM(i.price), 2), ' PHP') as revenue FROM (((orders o INNER JOIN cart c ON o.cart_cart_id  = c.cart_id) " +
				   "INNER JOIN cart_items ci ON cart_id = ci.cart_cart_id) INNER JOIN item i ON items_item_id = i.item_id) " +
				   "GROUP BY o.order_id HAVING o.date_paid BETWEEN MIN(o.date_paid) AND MAX(o.date_paid) ORDER BY o.order_id, o.date_paid ASC",
		   nativeQuery = true)
	List<Object[]> getSalesReport();

}
