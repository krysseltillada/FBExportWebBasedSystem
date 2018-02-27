package com.fb.exportorder.models.customer;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.fb.exportorder.models.enums.WeightType;

@Embeddable
public class Weight {
	
	private double weight;
	
	@Enumerated(EnumType.STRING)
	private WeightType weightType;
	
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public WeightType getWeightType() {
		return weightType;
	}
	public void setWeightType(WeightType weightType) {
		this.weightType = weightType;
	}
	
}
