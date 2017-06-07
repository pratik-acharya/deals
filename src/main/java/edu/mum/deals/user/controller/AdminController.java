package edu.mum.deals.user.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.deals.deal.domain.Category;
import edu.mum.deals.deal.service.CategoryService;
import edu.mum.deals.user.domain.User;
import edu.mum.deals.user.service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService  userService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String dashboard(Model model){
		List<Category> categories= categoryService.findAll();
		model.addAttribute("categories",categories);
		model.addAttribute("users",userService.findAllUsers());
		return "admin";
	}
	
	@RequestMapping(value="/generalerror", method=RequestMethod.GET)
	public String accessDenied(Model model){
		model.addAttribute("reason","Access denied");
		return "general-error";
	}
	
	
	//Category CRUD
    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public @ResponseBody Category saveCategory( @Valid  @RequestBody Category category) {
    	 
         categoryService.saveCategory(category);
         return category;
    }
    
    @RequestMapping(value = "/deleteCategory", method = RequestMethod.DELETE)
    public @ResponseBody void deleteCategory( @Valid  @RequestBody Long id) {
        categoryService.deleteCategory(id);
         
    }
    
    @RequestMapping(value = "/editCategory", method = RequestMethod.GET)
    public @ResponseBody Category editCategory( @RequestParam("id") Long id) {
    	
        return categoryService.findById(id);
    }
    
    @RequestMapping(value = "/editCategory", method = RequestMethod.PUT)
    public @ResponseBody Category editCategory( @Valid  @RequestBody Category category) {
    	 
         categoryService.saveCategory(category);
         return category;
    }
    
    //User CRUD
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public @ResponseBody User saveUser( @Valid  @RequestBody User user) {
    	 
         userService.save(user);
         return user;
    }
    
    @RequestMapping(value = "/deleteUser", method = RequestMethod.DELETE)
    public @ResponseBody void userCategory( @Valid  @RequestBody Long id) {
        userService.deleteUser(id);
         
    }
    
    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public @ResponseBody User editUser( @RequestParam("id") Long id) {
    	
        return userService.findById(id);
    }
    
    @RequestMapping(value = "/editUser", method = RequestMethod.PUT)
    public @ResponseBody String editUser(@Valid @RequestBody User user) {
    	
         userService.save(user);
         return "Success";
    }
    
}
