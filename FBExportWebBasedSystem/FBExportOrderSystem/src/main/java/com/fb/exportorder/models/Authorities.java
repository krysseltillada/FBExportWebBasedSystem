package com.fb.exportorder.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "AUTHORITIES")
public class Authorities {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private Long id;
  
  private String authority;

  @ManyToOne
  @JsonBackReference
  private Account account;

	public String getAuthority() {
		return authority;
	}
	
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public Account getAccount() {
		return account;
	}
	
	public void setAccount(Account account) {
		this.account = account;
	}

}
