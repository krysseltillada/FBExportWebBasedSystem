package com.fb.exportorder.module.customer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.ShippingAddress;

@Repository
public interface ShippingAddressRepository extends CrudRepository<ShippingAddress, Long>{

}
