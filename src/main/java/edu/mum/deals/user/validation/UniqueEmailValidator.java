package edu.mum.deals.user.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import edu.mum.deals.user.service.UserService;


public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String>{
	
	@Autowired
	UserService userService;

	@Override
	public void initialize(UniqueEmail unique) {
		
		
	}

	
	@Override
	public boolean isValid(String email, ConstraintValidatorContext context) {
		return userService.doesEmailExist(email);
	}
}
