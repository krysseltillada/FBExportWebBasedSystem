package com.fb.exportorder.module.customer.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	
	
	@Override
	public Order order(Customer customer, ShippingAddress shippingAddress, PaymentMethod paymentMethod, double totalPrice,
			double totalWeight) {
		
		Order newOrder = new Order();
		
		Cart customerCart = customer.getCart();
		Cart orderedCart = new Cart();
		
		for (Item itemOrdered : customerCart.getItems()) {
			Item newItemOrdered = new Item();
			
			newItemOrdered.setPrice(itemOrdered.getPrice());
			newItemOrdered.setProduct(itemOrdered.getProduct());
			newItemOrdered.setWeight(itemOrdered.getWeight());
			
			orderedCart.getItems().add(newItemOrdered);
		}
		
		customerCart.clearItems();
		
		customerRepository.save(customer);
		
		newOrder.setCustomer(customer);
		newOrder.setCart(orderedCart);
		newOrder.setOrderStatus(OrderStatus.PENDING);
		newOrder.setPaymentMethod(paymentMethod);
		newOrder.setShippingAddress(shippingAddress);
		newOrder.setTotalItems(orderedCart.getItemCount());
		newOrder.setTotalWeight(totalWeight);
		newOrder.setTotalPrice(totalPrice);
		newOrder.setDateOrdered(new Date());
		
		return orderRepository.save(newOrder);
	}


	@Override
	public List<Order> getAllOrders() {
		return (List<Order>) orderRepository.findAll();
	}


	@Override
	public Order getOrderById(long id) {
		return orderRepository.findOne(id);
	}

}
