package edu.mum.deals.user.domain;

public enum RoleType {
	USER("USER"),
	ADMIN("ADMIN");
	
	String role;
	private RoleType(String role){
		this.role = role;
	}
	
	public String getRole(){
		return role;
	}
	

}
