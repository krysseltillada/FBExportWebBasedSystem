package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ShippingLog {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long shippingLogId;
	
	private String header;
	private String description;
	
	@Lob
	private String address;
	
	@Temporal(TemporalType.DATE)
	private Date date;
	
	@Temporal(TemporalType.TIME)
	private Date time;

	public Long getShippingLogId() {
		return shippingLogId;
	}

	public void setShippingLogId(Long shippingLogId) {
		this.shippingLogId = shippingLogId;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "ShippingLog [shippingLogId=" + shippingLogId + ", header=" + header + ", description=" + description
				+ ", address=" + address + ", date=" + date + ", time=" + time + "]";
	}
	
	

}
