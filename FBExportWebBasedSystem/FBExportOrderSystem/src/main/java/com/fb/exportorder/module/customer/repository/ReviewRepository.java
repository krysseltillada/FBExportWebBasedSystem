package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {
	
	@Query("SELECT r FROM Review r WHERE r.username = :username")
	List<Review> findReviewByUsername (@Param("username")String username);
}
