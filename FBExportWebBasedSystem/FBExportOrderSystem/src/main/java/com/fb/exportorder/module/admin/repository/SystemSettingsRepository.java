package com.fb.exportorder.module.admin.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.SystemSettings;

@Repository
public interface SystemSettingsRepository extends CrudRepository<SystemSettings, Long>{
	
	@Query("SELECT s FROM SystemSettings s WHERE s.systemSettingsId = :id")
	SystemSettings findById(long id);
}
