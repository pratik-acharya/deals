package edu.mum.deals.deal.domain;

public enum DealType {
	OFFER("Offer"),
	WANTED("wanted");
	 
	private String dealType;
	
	private DealType(String dealType){
		this.dealType = dealType;
	}

	public String getDealType() {
		return dealType;
	}

	public void setDealType(String dealType) {
		this.dealType = dealType;
	}
	
	
	
	

}
