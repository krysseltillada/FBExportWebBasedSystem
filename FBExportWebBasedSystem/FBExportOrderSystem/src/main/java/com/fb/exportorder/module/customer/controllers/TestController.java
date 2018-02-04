package com.fb.exportorder.module.customer.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Authorities;
import com.fb.exportorder.models.Gender;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.repository.AccountRepository;
import com.fb.exportorder.module.customer.repository.CustomerRepository;

@Controller
public class TestController {
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	CustomerRepository customerRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String save(Model model) {
		System.out.println("run");
		
		Customer account = new Customer();
		
		account.setUsername("krysseltillada");
		account.setPassword(passwordEncoder.encode("kryssel2821"));
		
		Authorities auth = new Authorities();
		
		auth.setAuthority("GUEST");
		auth.setAccount(account);

		List<Order> orders = new ArrayList<Order>();
		
		Order order = new Order();
		
		order.setCustomer(account);

		orders.add(order);
		
		account.setOrders(orders);
		account.getAuthorities().add(auth);
		
		customerRepository.save(account);
		
		return "manage-accounts";
	}
		
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String testRequest(Model model) {
		System.out.println("run");
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		System.out.println("run");
		return "login";
	}
	
	@RequestMapping(value = "/yay", method = RequestMethod.GET)
	public String yay(Model model) {
		System.out.println("run");
		return "home";
	}
	
	
}
