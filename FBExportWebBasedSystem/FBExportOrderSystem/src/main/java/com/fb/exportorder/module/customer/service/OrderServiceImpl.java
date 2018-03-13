package com.fb.exportorder.module.customer.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.VesselStatus;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;
import com.fb.exportorder.models.enums.ShipmentStatus;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	SessionFactory sessionFactory;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	private void removeShippingIfExistsFromOrder(Order order) {
		Shipping shipping = order.getShipping();
		
		if (Objects.nonNull(shipping))
			order.setShipping(null);
		
	}
	
	public List<String> validate (String shipmentStatus,
								  String expectedDate,
								  String departureDate,
								  String arrivalDate,
								  String vesselName,
								  String mmsiNumber,
								  String imoNumber,
								  String destination) {
		
		List <String> errorMessages = new ArrayList<String>();
		
		if (StringUtils.isBlank(shipmentStatus))
			errorMessages.add("choose a shipment status");
		
		try {
			
			if (StringUtils.isEmpty(expectedDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(expectedDate);
		} catch (ParseException e) {
			errorMessages.add("invalid expected date");
		}
			
		try {
			
			if (StringUtils.isEmpty(departureDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(departureDate);
		} catch (ParseException e) {
			errorMessages.add("invalid departure date");
		}
		
		try {
			
			if (StringUtils.isEmpty(arrivalDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(arrivalDate);
		} catch (ParseException e) {
			errorMessages.add("invalid arrival date");
		}
		
		if (StringUtils.equals(shipmentStatus, "On Cargo Ship")) {
			
			if (StringUtils.isBlank(vesselName))
				errorMessages.add("vessel name is empty");
			
			if (!StringUtils.isNumeric(mmsiNumber))
				errorMessages.add("MMSI Number is invalid");
			
			if (!StringUtils.isNumeric(imoNumber))
				errorMessages.add("IMO Number is invalid");
			
			if (StringUtils.isBlank(destination))
				errorMessages.add("destination is empty");
			
			
		}
		
		return errorMessages;
	}
	
	
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


	@Override
	public List<String> addToShipInformation(long id, String shipmentStatus, String expectedDate, 
										     String departureDate, String arrivalDate, String vesselName,
										     String mmsiNumber, String imoNumber, String destination) {
		
		List<String> errorMessages = validate(shipmentStatus, 
											  expectedDate,
											  departureDate, 
											  arrivalDate, 
											  vesselName,
											  mmsiNumber, 
											  imoNumber, 
											  destination);
		if (errorMessages.isEmpty()) {
			
			Order currentAddToShipInformationOrder = orderRepository.findOne(id);
			
			Shipping toShipInformation = new Shipping();
			
			toShipInformation.setShipmentStatus((StringUtils.equals(shipmentStatus, "On Cargo Ship")) ? ShipmentStatus.ON_CARGO_SHIP :
																										ShipmentStatus.ON_TRUCK);	
			
			try {
				
				toShipInformation.setExpectedDate(dateFormat.parse(expectedDate));
				toShipInformation.setDepartureDate(dateFormat.parse(departureDate));
				toShipInformation.setArrivalDate(dateFormat.parse(arrivalDate));
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if (toShipInformation.getShipmentStatus() == ShipmentStatus.ON_CARGO_SHIP) {
				
				VesselStatus vesselStatus = new VesselStatus();
				
				vesselStatus.setVesselName(vesselName);
				vesselStatus.setMmsiNumber(mmsiNumber);
				vesselStatus.setImoNumber(imoNumber);
				vesselStatus.setDestination(destination);
				
				toShipInformation.setVesselStatus(vesselStatus);
				
			}
			
			currentAddToShipInformationOrder.setOrderStatus(OrderStatus.TO_SHIP);
			currentAddToShipInformationOrder.setShipping(toShipInformation);
			
			orderRepository.save(currentAddToShipInformationOrder);
			
			System.out.println("validation success");
			
		}
		
		return errorMessages;
		
	}


	@Override
	public void markApproved(Order order, String message) {
		
		removeShippingIfExistsFromOrder(order);
		
		order.setMessage(message);
		order.setOrderStatus(OrderStatus.APPROVED);
		orderRepository.save(order);
	}


	@Override
	public void markRejected(Order order, String reason) {
	
		removeShippingIfExistsFromOrder(order);
		
		order.setMessage(reason);
		order.setOrderStatus(OrderStatus.REJECTED);
		orderRepository.save(order);
	}


	@Override
	public void markPending(Order order) {
		
		removeShippingIfExistsFromOrder(order);
		
		order.setOrderStatus(OrderStatus.PENDING);
		order.setMessage(StringUtils.EMPTY);
		order.setReason(StringUtils.EMPTY);
		orderRepository.save(order);
	}


	@Override
	public void markReceived(Order order) {
		order.setOrderStatus(OrderStatus.RECEIVED);
		order.setMessage(StringUtils.EMPTY);
		order.setReason(StringUtils.EMPTY);
		orderRepository.save(order);
	}


	@Override
	public boolean checkIfShippingExists(long id) {
		return Objects.nonNull(orderRepository.findOne(id).getShipping());
	}


	@Override
	public void markToShip(Order order) {
		order.setOrderStatus(OrderStatus.TO_SHIP);
		orderRepository.save(order);
	}

	@Override
	public void markCancelled(Order order, String reason) {
		order.setOrderStatus(OrderStatus.CANCELLED);
		order.setReason(reason);
		orderRepository.save(order);
	}

	@Override
	public void reOrder(Order order) {
		order.setOrderStatus(OrderStatus.PENDING);
		order.setMessage(StringUtils.EMPTY);
		order.setReason(StringUtils.EMPTY);
		orderRepository.save(order);
	}

	@Override
	public void markPaid(Order order) {
		
		order.setOrderStatus(OrderStatus.PAID);
		order.setDatePaid(new Date());
		orderRepository.save(order);
		
	}

	@Override
	public void refund(Order order, String reason) {
		
		order.setOrderStatus(OrderStatus.REFUND);
		order.setReason(reason);
		orderRepository.save(order);
		
	}

	@Override
	public void reviewOrder(Order order, String review) {
		
		order.setReview(review);
		orderRepository.save(order);
		
	}

	@Override
	public void returnRefundOrder(Order order, String reason) {
		order.setReason(reason);
		order.setOrderStatus(OrderStatus.RETURNED);
		orderRepository.save(order);
	}

	@Override
	@Transactional
	public List<Order> filterAndSortByCustomer(long customerId, String filterBy, String sortBy, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		
		String filterByJPQL = (StringUtils.equals(filterBy, "Cash on delivery") || 
							   StringUtils.equals(filterBy, "Paypal")) ? " AND o.paymentMethod = '" + filterBy.toUpperCase().replace(" ", "_") + "'" 
							   : (StringUtils.equals(filterBy, "All")) ? "" : " AND o.orderStatus = '" + filterBy.toUpperCase().replace(" ", "_") + "'"; 
		
		String sortByJPQL = (StringUtils.equals(sortBy, "Date ordered(latest)") ? " ORDER BY o.dateOrdered DESC" :
							 StringUtils.equals(sortBy, "Date ordered(oldest)") ? " ORDER BY o.dateOrdered ASC" :
							 StringUtils.equals(sortBy, "Order id(latest)") ? " ORDER BY o.orderId DESC" :
							 StringUtils.equals(sortBy, "Order id(oldest)") ? " ORDER BY o.orderId ASC" : "");
		
		System.out.println("SELECT o FROM Order o " + filterByJPQL + sortByJPQL);
		
		Session session = sessionFactory.getCurrentSession();
		Query filterAndSortQuery = session.createQuery("FROM Orders o WHERE o.customer.id = '" + customerId + "'" + filterByJPQL + sortByJPQL);
		
		filterAndSortQuery.setFirstResult(pageNumber);
		filterAndSortQuery.setMaxResults(pageSize);
		
		return (List<Order>)filterAndSortQuery.list();
	}

	@Override
	@Transactional
	public int filterAndSortByCustomerCount(long customerId, String filterBy, String sortBy) {
		
		String filterByJPQL = (StringUtils.equals(filterBy, "Cash on delivery") || 
				   StringUtils.equals(filterBy, "Paypal")) ? " AND o.paymentMethod = '" + filterBy.toUpperCase().replace(" ", "_") + "'" 
				   : (StringUtils.equals(filterBy, "All")) ? "" : " AND o.orderStatus = '" + filterBy.toUpperCase().replace(" ", "_") + "'"; 

		String sortByJPQL = (StringUtils.equals(sortBy, "Date ordered(latest)") ? " ORDER BY o.dateOrdered DESC" :
						 StringUtils.equals(sortBy, "Date ordered(oldest)") ? " ORDER BY o.dateOrdered ASC" :
						 StringUtils.equals(sortBy, "Order id(latest)") ? " ORDER BY o.orderId DESC" :
						 StringUtils.equals(sortBy, "Order id(oldest)") ? " ORDER BY o.orderId ASC" : "");
		
		System.out.println("SELECT o FROM Order o " + filterByJPQL + sortByJPQL);
		
		Session session = sessionFactory.getCurrentSession();
		Query filterAndSortQuery = session.createQuery("FROM Orders o WHERE o.customer.id = '" + customerId + "'" + filterByJPQL + sortByJPQL);
		
		return ((List<Order>)filterAndSortQuery.list()).size();
				
	}

	

}
