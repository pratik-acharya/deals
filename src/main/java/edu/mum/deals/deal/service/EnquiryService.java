package edu.mum.deals.deal.service;

import java.util.List;

import edu.mum.deals.deal.domain.Enquiry;



public interface EnquiryService {

	public Enquiry saveComment(Enquiry enquiry);
	
	public List<Enquiry> getAllComments();
}