package com.fb.exportorder.models.customer;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;

@Entity
public class Cart {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long cartId;
	
	@OneToMany(cascade=CascadeType.ALL)
	@Cascade({org.hibernate.annotations.CascadeType.DELETE,
        org.hibernate.annotations.CascadeType.MERGE,
        org.hibernate.annotations.CascadeType.PERSIST,
        org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
	List<Item> items = new ArrayList<Item>();

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
	
	public Cart addItem (Item item) {
		items.add(item);
		return this;
	}
	
	public Cart removeItem (Item item) {
		items.remove(item);
		return this;
	}
	
	public Cart clearItems () {
		items.clear();
		return this;
	}
	
	public int getItemCount() {
		return items.size();
	}
	
}
