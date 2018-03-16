package com.fb.exportorder.module.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
	@Query(value="SELECT * FROM rating r WHERE r.rate != 0.0 ORDER BY r.rate DESC LIMIT 3", nativeQuery=true)
	List<Rating> getTopThreeMostRatedProduct();
	
	@Query(value="SELECT * FROM rating r WHERE r.views != 0.0 ORDER BY r.views DESC LIMIT 3", nativeQuery=true)
	List<Rating> getTopThreeMostViewedProduct();
}
