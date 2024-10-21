package com.jtgz.jtgzproject.regionSolar.dto;

public class RegionSolarDTO {
	private String region;
	private Double meanSolar;
	
	
	public RegionSolarDTO() {
		super();
	}


	public RegionSolarDTO(String region, Double meanSolar) {
		super();
		this.region = region;
		this.meanSolar = meanSolar;
	}


	@Override
	public String toString() {
		return "RegionSolarDTO [region=" + region + ", meanSolar=" + meanSolar + "]";
	}


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public Double getMeanSolar() {
		return meanSolar;
	}


	public void setMeanSolar(Double meanSolar) {
		this.meanSolar = meanSolar;
	}
	
	
	
}
