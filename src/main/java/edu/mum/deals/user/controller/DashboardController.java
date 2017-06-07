package edu.mum.deals.user.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.deals.deal.domain.Deal;
import edu.mum.deals.deal.service.DealService;
import edu.mum.deals.user.domain.User;
import edu.mum.deals.user.service.SecurityService;
import edu.mum.deals.user.service.UserService;

@Controller
public class DashboardController {
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private DealService dealService;
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping("/user/dashboard")
	public String dashboard(){
		return"user.dashboard";
	}
	
	@RequestMapping("/user/dashboard/profile")
	public String profile(Model model){
		User user = userService.findByEmail(securityService.findLoggedInUsername());
		model.addAttribute("user",user);
		return"user.profile";
	}
	
	
	@RequestMapping("/user/dashboard/offers")
	public String offers(Model model,Pageable p){
		User user = userService.findByEmail(securityService.findLoggedInUsername());
		Page<Deal> page = dealService.findByUserIdOrderByTimestampDesc(user.getId(), p);
		model.addAttribute("page",page);

		return"user.offers";
	}
	
	@RequestMapping("/user/dashboard/offers/next")
	public @ResponseBody Page<Deal> moreOffers(Pageable p){
		User user = userService.findByEmail(securityService.findLoggedInUsername());
		Page<Deal> page = dealService.findByUserIdOrderByTimestampDesc(user.getId(), p);
		return page;

	}
	
	@RequestMapping(value="/user/profile/update",method = RequestMethod.POST)
	public @ResponseBody User update(@Valid @RequestBody User user){
		return userService.update(user);

	}
	@RequestMapping(value ="/user/offer/{id}",method= RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	@ResponseBody
	public void delete(@PathVariable("id") long id){
		dealService.deleteById(id);
		
	}
	
	
	

}
