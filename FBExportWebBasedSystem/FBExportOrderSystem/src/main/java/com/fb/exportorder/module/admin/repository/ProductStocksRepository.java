package com.fb.exportorder.module.admin.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.ProductStock;

@Repository
public interface ProductStocksRepository extends CrudRepository<ProductStock, Long> {

}
