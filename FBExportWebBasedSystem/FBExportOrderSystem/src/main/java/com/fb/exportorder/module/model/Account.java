package com.fb.exportorder.module.model;

import java.util.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fb.exportorder.module.types.AccountStatus;

@MappedSuperclass
public abstract class Account {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long accountId;
	
	private String userName;
	private String password;
	
	private String firstName;
	private String lastName;
	private String middleName;
	
	private int age;
	
	private String address;
	private String phoneNumber;
	private String telephoneNumber;
	private String email;
	
	@Enumerated(EnumType.STRING)
	@Column(name="status")
	private AccountStatus accountStatus;
	
	@Temporal(TemporalType.DATE)
	private Date dateCreated;
	
	@Temporal(TemporalType.TIME)
	private Date timeCreated;
	
	
}



