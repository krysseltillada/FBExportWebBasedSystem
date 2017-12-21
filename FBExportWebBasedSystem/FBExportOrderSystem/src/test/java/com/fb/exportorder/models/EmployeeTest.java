package com.fb.exportorder.models;

import static org.junit.Assert.*;


import java.util.Date;

import org.junit.Test;

import com.fb.exportorder.module.model.Employee;
import com.fb.exportorder.module.types.AccountStatus;


public class EmployeeTest {

	@Test
	public void test_EmployeeBuilder() {
		
		Date currentDate = new Date();
		Date currentTime = new Date();
		
		Employee testEmployee = new Employee() {{
			setAccountId(1L);
			setFirstName("kryssel");
			setLastName("de leon");
			setMiddleName("tillada");
			setAddress("rivera compound saint joseph subdivision");
			setAge(19);
			setEmail("krysseltillada@gmail.com");
			setUserName("krysseltillada");
			setPassword("1234667");
			setAccountStatus(AccountStatus.ACTIVATE);
			setDateCreated(currentDate);
			setTimeCreated(currentTime);
			setPosition("nothing");
			setDepartment("waht department");
		}};
		
		Employee employee = Employee.Builder.createBuilder()
											.accountId(1L)
											.firstName("kryssel")
											.lastName("de leon")
											.middleName("tillada")
											.address("rivera compound saint joseph subdivision")
											.age(19)
											.email("krysseltillada@gmail.com")
											.passWord("1234667")
											.userName("krysseltillada")
											.accountStatus(AccountStatus.ACTIVATE)
											.dateCreated(currentDate)
											.timeCreated(currentTime)
											.position("nothing")
											.department("waht department")
											.build();
		
		assertEquals(testEmployee, employee);
											
		
	}

}
