package edu.mum.deals.deal.controller;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.deals.deal.domain.Enquiry;
import edu.mum.deals.deal.service.EnquiryService;
import edu.mum.deals.mail.MailHelper;


@Controller
public class EnquiryController {
	
	@Autowired
	EnquiryService enquiryService;
	
	@Autowired
	private MailHelper mailHelper;

	
	
	@RequestMapping(value = "/saveComment", method = RequestMethod.POST)
	public @ResponseBody Enquiry  saveComment(@Valid @RequestBody Enquiry enquiry) {
		Date nowDate = new Date();
		enquiry.setDate(nowDate);
		
		Enquiry toAddenquiry = enquiryService.saveComment(enquiry);
		
		mailHelper.sendMail(toAddenquiry.getUser().getEmail(),
				toAddenquiry.getDeal().getUser().getEmail(),
	    		   "Offer Enquiry",
	    		   toAddenquiry.getContent());
		
	     return toAddenquiry;
	}

	
	
}