package edu.mum.deals.user.dto;

import org.hibernate.validator.constraints.NotBlank;

import edu.mum.deals.user.validation.UniqueEmail;
import edu.mum.deals.user.validation.ValidEmail;

public class RegistrationDto {	
	@NotBlank
	private String name;
	
	@ValidEmail
	@UniqueEmail
	@NotBlank
	private String email;
	
	@NotBlank
	private String password;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	

}
