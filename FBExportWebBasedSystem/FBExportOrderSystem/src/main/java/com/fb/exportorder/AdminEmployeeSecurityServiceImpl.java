package com.fb.exportorder;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.module.admin.repository.EmployeeRepository;

@Service("adminEmployeeUserDetailsService")
public class AdminEmployeeSecurityServiceImpl implements UserDetailsService{

	@Autowired
	private EmployeeRepository employeeRepository;
	
	private UserDetails setUserDetailsBuilder (Employee employee) {
		
		System.out.println(employee.getAuthorities().iterator().next());
		
		UserBuilder userBuilder = org.springframework.security.core.userdetails.User.withUsername(employee.getUsername());
		userBuilder.disabled(!employee.isEnabled());
		userBuilder.password(employee.getPassword());

		userBuilder.authorities(employee.getAuthorities()
							.stream().map(a -> a.getAuthority()).toArray(String[]::new));
		
		return userBuilder.build();
		
	}
	
	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		System.out.println(username + " employee");
		
		Employee customer = employeeRepository.findAccountByUsername(username);
		Employee customerByEmail = employeeRepository.findAccountByEmail(username);
		
		UserDetails userDetails = null;

		if (Objects.nonNull(customer)) 
			userDetails = setUserDetailsBuilder(customer);
		else if (Objects.nonNull(customerByEmail))
			userDetails = setUserDetailsBuilder(customerByEmail);
		else {
			throw new UsernameNotFoundException("Username not found");
		}
		
		return userDetails;
	}

}

