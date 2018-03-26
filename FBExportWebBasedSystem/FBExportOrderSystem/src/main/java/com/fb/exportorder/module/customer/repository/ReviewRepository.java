package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Review;

@Repository
public interface ReviewRepository extends PagingAndSortingRepository<Review, Long> {
	
	@Query("SELECT r FROM Review r WHERE r.username = :username")
	List<Review> findReviewByUsername (@Param("username")String username);
	
	@Query(value = "SELECT * FROM review r INNER JOIN rating_reviews e ON r.review_id = e.reviews_review_id WHERE e.rating_rating_id = :id ORDER BY r.date DESC LIMIT :record OFFSET :offset",
			   nativeQuery=true)
	List<Object[]> getCustomerReviewsRecordsAndOffset(@Param("record") int record,
														 @Param("offset") int offset,
														 @Param("id") long id);
	
	@Query(value="SELECT COUNT(*) FROM rating_reviews r WHERE r.rating_rating_id = :id", nativeQuery=true)
	int getReviewCount (@Param("id")long id);
}
