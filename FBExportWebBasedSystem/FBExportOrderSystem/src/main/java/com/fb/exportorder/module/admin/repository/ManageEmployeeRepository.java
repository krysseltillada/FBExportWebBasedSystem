package com.fb.exportorder.module.admin.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.Employee;

@Repository
public interface ManageEmployeeRepository extends CrudRepository<Employee, Long>{
	
	@Query("SELECT c FROM Employee c WHERE c.username = :username")
	Employee findAccountByUsername(@Param("username")String username);
	
	@Query("SELECT COUNT(c.contact.emailAddress) > 0 FROM Employee c WHERE c.contact.emailAddress = :email")
	boolean isEmailExists (@Param("email") String username);
	
}
