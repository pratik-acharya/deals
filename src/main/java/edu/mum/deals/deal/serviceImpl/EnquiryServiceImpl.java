package edu.mum.deals.deal.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.deals.deal.domain.Enquiry;
import edu.mum.deals.deal.repository.EnquiryRepository;
import edu.mum.deals.deal.service.EnquiryService;
import edu.mum.deals.user.service.SecurityService;
import edu.mum.deals.user.service.UserService;
@Service
@Transactional
public class EnquiryServiceImpl implements EnquiryService {
	
	@Autowired
	EnquiryRepository enquiryRepository;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private UserService userService;
	
	@Override
	public Enquiry saveComment(Enquiry enquiry) {
		enquiry.setUser(userService.findByEmail(securityService.findLoggedInUsername()));
		return enquiryRepository.save(enquiry);
		
	}

	@Override
	public List<Enquiry> getAllComments() {

		return (List<Enquiry>) enquiryRepository.findAll();
		
		
	}

	
}