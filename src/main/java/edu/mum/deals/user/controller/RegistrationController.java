package edu.mum.deals.user.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.deals.user.dto.RegistrationDto;
import edu.mum.deals.user.service.SecurityService;
import edu.mum.deals.user.service.UserService;


@Controller
public class RegistrationController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value= "/register", method = RequestMethod.GET)
	public String showRegistrationForm(Model model){
		if(securityService.isGuest()){
			RegistrationDto registrationDto = new RegistrationDto();
			model.addAttribute("user", registrationDto);
			return "signup"	;	
		}
		return "redirect:/dashboard";

	
		
	}
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String registerUser( @Valid @ModelAttribute("user")  RegistrationDto registrationDto, BindingResult result){
		if(result.hasErrors()){
			return "signup";
		}
		userService.registerNewUser(registrationDto);
		securityService.autoLogin(registrationDto.getEmail(), registrationDto.getPassword());
		return "redirect:/dashboard";
	
		
	}
	
		
	}
	
	


