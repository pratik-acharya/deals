package edu.mum.deals.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.mum.deals.user.service.SecurityService;


@Controller
public class LoginController {
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value={"/login"})
	public String login(Model model, String error, String logout){
		 if (error != null)
	      model.addAttribute("error", "Your username and password is invalid.");

	   if (logout != null)
	            model.addAttribute("message", "You have been logged out successfully.");

	if(securityService.isGuest()){
			return "login"	;	
		}
		
	return "redirect:/dashboard";
	}
	
	
	
	

	
	

}
