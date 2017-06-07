package edu.mum.deals.deal.domain;

public enum Condition {
	EXCELLENT("Excellent"),
	FAIR("Fair"),
	GOOD("Good"),
	NEEDS_REPAIR("Needs repair"),
	VERY_GOOD("Very good");
	
	private String condition;
	private Condition(String condition){
		this.condition = condition;
		
	}
	public String getCondition() {
		return condition;
	}
	

}
