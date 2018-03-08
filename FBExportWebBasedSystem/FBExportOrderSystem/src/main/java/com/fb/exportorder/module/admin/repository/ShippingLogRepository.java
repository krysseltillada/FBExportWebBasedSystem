package com.fb.exportorder.module.admin.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.ShippingLog;

@Repository
public interface ShippingLogRepository 
				 extends CrudRepository<ShippingLog, Long>{

}
