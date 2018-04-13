package com.fb.exportorder.module.customer.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.customer.Activity;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Notification;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.customer.Weight;
import com.fb.exportorder.models.enums.WeightType;
import com.fb.exportorder.module.customer.repository.ActivityRepository;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.ItemRepository;
import com.fb.exportorder.module.customer.repository.NotificationRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ActivityRepository activityRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private NotificationRepository notificationRepository;
	
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
		
		List<Item> items = currentCustomer.getCart().getItems();
		System.out.println(items);
		boolean itemFound = false;
		if(items != null) {
			for(Item i : items) {
				if(i.getProduct().getProductId() == item.getProduct().getProductId()) {
					double priceAdded = i.getPrice() + item.getPrice();
					i.setPrice(priceAdded);
					
					double weightAdded = i.getWeight().getWeight() + item.getWeight().getWeight();
					i.getWeight().setWeight(weightAdded);
					
					itemFound = true;
					break;
				
				}
			}
		}
		
		
		if(!itemFound)
			currentCustomer.getCart().addItem(item);
		
		Cart saveCart = customerRepository.save(currentCustomer).getCart();  
		Item currentItemAdded = saveCart.getItems().get(saveCart.getItems().size() - 1);
					   
		return currentItemAdded.getItemId();
		
	}

	@Override
	public void removeToCart(Item item, long customerId) {
		
		Customer customer = customerRepository.findOne(customerId); 
		
		customer.getCart()
				.getItems().remove(item);
		
		customerRepository.save(customer);
		
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

	@Override
	public void deleteNotificationByNotificationId(long customerId, long notificationId) {
		
		Customer customer = customerRepository.findOne(customerId);
		
		if (Objects.nonNull(customer)) {
			
			List<Notification> customerNotifications = customer.getNotifications();
			Notification notification = notificationRepository.findOne(notificationId);
			
			if (Objects.nonNull(customerNotifications)) {
			
				customerNotifications.remove(notification);
				customerRepository.save(customer);
			
			}
			
		}
		
	}

	@Override
	public void deleteAllNotification(long customerId, String jsonDeleteDataIds) {
		
		try {
			
			Customer customer = customerRepository.findOne(customerId);
			
			List<Notification> notifications = customer.getNotifications();
			
			JSONObject jsonRawObject = (JSONObject)(new JSONParser().parse(jsonDeleteDataIds));
			JSONArray jsonDeleteDataArr = (JSONArray)jsonRawObject.get("idElem");
			
			if (Objects.nonNull(notifications)) {

				for (int i = 0; i != jsonDeleteDataArr.size(); ++i)  {
					long lNotificationId = (long)jsonDeleteDataArr.get(i);
					Notification notification = notificationRepository.findOne(lNotificationId);
					notifications.remove(notification);
				}
				
				customerRepository.save(customer);
			
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}


	@Override
	public List<Notification> getNotificationsByCustomerId(long customerId) {
		
		List<Notification> userNotificationList = new ArrayList<>();
		List<Object[]> rawNotificationList = customerRepository.getNotificationsByCustomerId(customerId);
		
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

	@Override
	public void addCustomerActivity(Activity activity, Customer customer) {
		
		customer.getActivities()
				.add(activity);
		
		customerRepository.save(customer);
		
	}

	@Override
	public String updateCart(String info, long id) {
		String[] parts = info.split("&");
		List<String> productInfo = new ArrayList<>();
		String product = "";
		for(int i = 0; i < parts.length; ++i) {
			if(product == "") 
				product += parts[i];
			else 
				product += "&"+parts[i];
			if(i % 3 == 2) {
				productInfo.add(product);
				product = "";
			}
		}
		
		Customer currentCustomer = customerRepository.findOne(id);
		
		List<Item> items = currentCustomer.getCart().getItems();
		
		List<String> valueList = new ArrayList<>();
		for(String pInfo : productInfo) {
			String[] partsInfo = pInfo.split("&");
			for(int i = 0; i < partsInfo.length; ++i) {
				String[] value = partsInfo[i].split("=");
				valueList.add(value[1]);
			}
		}
		
		for(int i = 0; i < valueList.size(); ++i) {
			if(i % 3 == 0) {
				double weight = Double.parseDouble(valueList.get(i));
				//int itemId = Integer.parseInt(valueList.get(i + 1));
				int productId = Integer.parseInt(valueList.get(i + 2));
				
				if(items != null) {
					for(Item item : items) {
						if(item.getProduct().getProductId() == productId) {
							double tonLimit = Double.parseDouble(String.format("%.2f",5.0 / 1000.0));
							double poundLimit = Double.parseDouble(String.format("%.2f", 5.0 / 0.453592));
							
							WeightType weightType = item.getWeight().getWeightType();
							
							if(weight <= 5 && weightType.equals(weightType.KILO))
								return "Your order must be above 5.00 " + weightType;
							
							if(weight <= tonLimit && weightType.equals(weightType.TON))
								return "Your order must be above 5.00 " + tonLimit +" "+ weightType;
							
							if(weight <= poundLimit && weightType.equals(weightType.POUND))
								return "Your order must be above " + poundLimit +" "+weightType;
							
							if(weight > item.getProduct().getWeight()) {
								return "Your order exceeds "+item.getProduct().getWeight()+" "+weightType+" available stocks ";
							}
							
							item.getWeight().setWeight(weight);
							
							double price = item.getProduct().getPrice() * weight;
							item.setPrice(price);
							
						}
					}
				}
			}
				
		}
		
		
		customerRepository.save(currentCustomer);
		return "";
	}

}
