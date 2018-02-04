package com.fb.exportorder.models;

import javax.persistence.Embeddable;

@Embeddable
public class VesselStatus {
	
	private String vesselName;
	private String mmsiNumber;
	private String imoNumber;
	private String destination;

	public String getVesselName() {
		return vesselName;
	}
	public void setVesselName(String vesselName) {
		this.vesselName = vesselName;
	}
	public String getMmsiNumber() {
		return mmsiNumber;
	}
	public void setMmsiNumber(String mmsiNumber) {
		this.mmsiNumber = mmsiNumber;
	}
	public String getImoNumber() {
		return imoNumber;
	}
	public void setImoNumber(String imoNumber) {
		this.imoNumber = imoNumber;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
}
