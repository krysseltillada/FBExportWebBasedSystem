package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Order;

@Repository
public interface OrderRepository extends PagingAndSortingRepository<Order, Long> {
	
	@Query(value="SELECT COUNT(*), o.order_status From orders o GROUP BY o.order_status", nativeQuery=true)
	public List<Object[]> getOrdersCount();
}
