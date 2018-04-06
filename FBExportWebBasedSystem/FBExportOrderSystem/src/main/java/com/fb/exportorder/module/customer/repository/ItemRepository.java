
package com.fb.exportorder.module.customer.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.customer.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long> {
	

}
