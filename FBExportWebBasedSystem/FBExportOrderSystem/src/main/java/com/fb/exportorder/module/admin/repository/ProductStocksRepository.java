package com.fb.exportorder.module.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fb.exportorder.models.ProductStock;

@Repository
public interface ProductStocksRepository extends CrudRepository<ProductStock, Long> {
	@Query(value="SELECT p.product_id, SUM(ps.weight) as max_stocks, ps.date FROM product p INNER JOIN product_stock ps ON p.product_id = ps.product_id WHERE ps.date >= DATE_ADD(CURDATE(), INTERVAL - 4 MONTH) AND ps.date <= CURDATE() GROUP BY p.product_id ORDER BY max_stocks DESC LIMIT 3", nativeQuery=true)
	public List<Object[]> getTopProductStocks();
	
	@Query(value="SELECT p.name, ps.weight, ps.date FROM product p INNER JOIN product_stock ps ON p.product_id = ps.product_id WHERE ps.product_id = :id AND ps.date >= DATE_ADD(CURDATE(), INTERVAL - 4 MONTH) AND ps.date <= CURDATE() ORDER BY ps.date DESC", nativeQuery=true)
	public List<Object[]> getTopProductStocksPreviousMonths(@Param("id") Long id);
}
