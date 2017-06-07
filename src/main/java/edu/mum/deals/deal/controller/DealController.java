package edu.mum.deals.deal.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.mum.deals.deal.domain.Category;
import edu.mum.deals.deal.domain.Condition;
import edu.mum.deals.deal.domain.Deal;
import edu.mum.deals.deal.service.CategoryService;
import edu.mum.deals.deal.service.DealService;
import edu.mum.deals.exception.DealNotFoundException;

@Controller
public class DealController {

	@Autowired
	private DealService dealService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ServletContext servletContext;
	
	
	@RequestMapping(value = { "/", "/dashboard", "/dashboard/offers" })
	public String offerList(Model model) {
		
		
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("dealType", "offer");
		return "dashboard";
	}

	@RequestMapping("/dashboard/wishes")
	public String wishList(Model model) {
		model.addAttribute("dealType", "wish");
		return "dashboard";
	}

	@RequestMapping("/deal/{id}")
	public String viewDeal(@PathVariable("id") long id, Model model) {
		Deal deal = dealService.findById(id);
		System.out.println(deal.getUser().getEmail());
		model.addAttribute("deal", dealService.findById(id));
		return "deal";
	}

	@RequestMapping(value = "/add/{dealType}", method = RequestMethod.GET)
	public String displayOfferForm(@PathVariable("dealType") String dealType,@RequestParam(value="id",required=false) Long id, Model model) {
		Map<String, Condition> conditionMap = new HashMap<>();
		for (Condition condition : Condition.values()) {
			conditionMap.put(condition.getCondition(), condition);
		}
		if(id==null){
			model.addAttribute("deal", new Deal());

		}else{
			Deal deal = dealService.findById(id);
			if (deal == null){
				throw new DealNotFoundException(id);
			}
			model.addAttribute("deal", deal);
			model.addAttribute("edit", true);
			

		}

		model.addAttribute("dealType", dealType);
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("conditionMap", conditionMap);
		return "form";
	}

	@RequestMapping(value = "/add/{dealType}", method = RequestMethod.POST)
	public String processDealForm(@PathVariable("dealType") String dealType, @Valid @ModelAttribute("deal") Deal deal,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			Map<String, Condition> conditionMap = new HashMap<>();
			for (Condition condition : Condition.values()) {
				conditionMap.put(condition.getCondition(), condition);
			}
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("conditionMap", conditionMap);
			return "form";
		}
		Deal addedDeal = dealService.addDeal(deal);
		MultipartFile imageFile = deal.getImage();
		String rootDirectory = servletContext.getRealPath("/");
		String fileName = imageFile.getOriginalFilename();
		String extension = null;
		if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
			extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (imageFile != null && !imageFile.isEmpty()) {
			try {
				imageFile.transferTo(
						new File(rootDirectory + "/resources/images/deals/" + addedDeal.getId() + "." + extension));
			} catch (Exception e) {
				throw new RuntimeException("Image saving faile", e);

			}
		}

		return "redirect:/deal/" + addedDeal.getId();
	}
	
	
	
	@RequestMapping("/dashboard/deals")
	public @ResponseBody Page<Deal> deals(@RequestParam(value="filter",required=false) String filter,@RequestParam(value="value",required=false)Long value, @RequestParam(value="sort") String sort,@RequestParam(value="direction") String direction,Pageable p){
		System.out.println("here in deal controller");

		Page<Deal> page = null;
		if(filter==null){
			 page = dealService.getDealsBySorting(sort,direction,p);

		}else{
			page = dealService.getDealsByFilterAndSorting(filter,value,sort,direction,p);

		}
		return page;

	}

}
