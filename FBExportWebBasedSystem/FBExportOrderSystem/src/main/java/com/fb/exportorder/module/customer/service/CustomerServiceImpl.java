package com.fb.exportorder.module.customer.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.hibernate.SessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.repository.ActivityRepository;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.ItemRepository;
import com.mysql.jdbc.StringUtils;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	ActivityRepository activityRepository;
	
	@Autowired
	ItemRepository itemRepository;
	
	@Override
	public Customer getCustomerById(long customerId) {
		return customerRepository.findOne(customerId);
	}

	@Override
	public List<Activity> getCustomerActivitiesById(long customerId, int records, int offset) {
		
		List<Activity> userActivityList = new ArrayList<>();
		List<Object[]> rawActivityList = customerRepository.getActivitiesByIdRecordsAndOffset(customerId,
																					    records,
																					    offset);
		for (Object[] rawActivity : rawActivityList) {
			Activity activity = new Activity();
			
			activity.setActivityId( ((BigInteger)rawActivity[0]).longValue() );
			activity.setDate((Date)rawActivity[1]);
			activity.setDescription((String)rawActivity[2]);
			activity.setHeader((String)rawActivity[3]);
			
			userActivityList.add(activity);
		}
		
		return userActivityList;
		
	}

	@Override
	public void deleteActivityByActivityId(long customerId, long activityId) {
		Customer customer = customerRepository.findOne(customerId);
		
		if (Objects.nonNull(customer)) {
			
			List<Activity> customerActivities = customer.getActivities();
			Activity activity = activityRepository.findOne(activityId);
			
			if (Objects.nonNull(customerActivities)) {
			
//				for (Activity customerActivity : customerActivities) {
//					System.out.println(customerActivity.getActivityId());
//					if (customerActivity.getActivityId() == activityId) {
//						customerActivities.remove(customerActivity);
//						break;
//					}
//				}
				customerActivities.remove(activity);
				customerRepository.save(customer);
			
			}
			
		}
		
		
	}

	@Override
	public void deleteAllActivity(long customerId, String jsonDeleteDataIds) {
		try {
			
			Customer customer = customerRepository.findOne(customerId);
			
			List<Activity> activities = customer.getActivities();
			
			JSONObject jsonRawObject = (JSONObject)(new JSONParser().parse(jsonDeleteDataIds));
			JSONArray jsonDeleteDataArr = (JSONArray)jsonRawObject.get("idElem");
			
			if (Objects.nonNull(activities)) {

				for (int i = 0; i != jsonDeleteDataArr.size(); ++i)  {
					System.out.println("json delete: " + jsonDeleteDataArr.get(i));
					long lActivityId = (long)jsonDeleteDataArr.get(i);
					Activity activity = activityRepository.findOne(lActivityId);
					activities.remove(activity);
				}
				
				customerRepository.save(customer);
			
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public long addToCart(Item item, long customerId) {

		Customer currentCustomer = customerRepository.findOne(customerId);
		
		currentCustomer.getCart()
					   .addItem(item);
		
		Cart saveCart = customerRepository.save(currentCustomer).getCart();  
		Item currentItemAdded = saveCart.getItems().get(saveCart.getItems().size() - 1);
					   
		return currentItemAdded.getItemId();
		
	}

	@Override
	public void removeToCart(Item item, long customerId) {
		
		Customer currentCustomer = customerRepository.findOne(customerId);
		
		currentCustomer.getCart()
					   .removeItem(item);
					   
		
		customerRepository.save(currentCustomer).getCart();  
		
	}

	@Override
	public Item getItemById(long id) {
		return itemRepository.findOne(id);
	}

	@Override
	public List<Order> getOrdersByCustomerId(int pageNumber, long customerId) {
		return customerRepository.getOrdersByCustomerId(customerId, new PageRequest(pageNumber, 5));
	}

	@Override
	public int getOrderCountByCustomerId(long customerId) {
		return customerRepository.findOne(customerId).getOrders().size();
	}

	@Override
	public void saveCustomer(Customer customer) {
		customerRepository.save(customer);
	}

	@Override
	public Map<Boolean, Integer> getOnlineUsersCount() {
		List<Object[]> rawResultSet = customerRepository.getOnlineUsersCount();
		
		Map<Boolean, Integer> onlineUsers = new HashMap<>();
		onlineUsers.put(true, 0);
		onlineUsers.put(false, 0);
		
		for(Object[] data : rawResultSet) {
			onlineUsers.put(Boolean.valueOf(data[1].toString()), Integer.parseInt(data[0].toString()));
		}
		
		return onlineUsers;
	}

	@Override
	public void addNotificationToCustomer(Notification notification, Customer customer) {

		customer.getNotifications()
				.add(notification);
		
		customerRepository.save(customer);
		
		notification.setNotificationId(customer.getNotifications().get(customer.getNotifications().size() - 1).getNotificationId());
		
	}

	@Override
	public List<Notification> getCustomerNotificationsById(long customerId, int records, int offset) {

		List<Notification> userNotificationList = new ArrayList<>();
		List<Object[]> rawNotificationList = customerRepository.getNotificationsByIdRecordsAndOffset(customerId,
																								     records,
																								     offset);
		for (Object[] rawNotification : rawNotificationList) {
			Notification notification = new Notification();
			
			notification.setNotificationId(((BigInteger)rawNotification[0]).longValue());
			notification.setDate((Date)rawNotification[1]);
			notification.setDescription((String)rawNotification[2]);
			notification.setHeader((String)rawNotification[3]);
			notification.setSeen((Boolean)rawNotification[4]);
			notification.setOrderId(((BigInteger)rawNotification[0]).longValue());
			
			
			userNotificationList.add(notification);
		}
		
		
		return userNotificationList;
	}

}
