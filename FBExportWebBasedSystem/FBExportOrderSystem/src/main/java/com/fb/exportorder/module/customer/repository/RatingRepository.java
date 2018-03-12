package com.fb.exportorder.module.customer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.customer.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
}
