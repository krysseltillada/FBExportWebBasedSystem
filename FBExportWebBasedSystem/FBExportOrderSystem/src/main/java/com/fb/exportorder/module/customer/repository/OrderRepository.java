package com.fb.exportorder.module.customer.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Order;

@Repository
public interface OrderRepository extends PagingAndSortingRepository<Order, Long> {

}
