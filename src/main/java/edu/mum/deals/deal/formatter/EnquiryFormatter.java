package edu.mum.deals.deal.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

import edu.mum.deals.deal.domain.Deal;
import edu.mum.deals.deal.service.DealService;

public class EnquiryFormatter implements Formatter<Deal> {
		
		@Autowired
		DealService dealService;

	@Override
	public String print(Deal arg0, Locale arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Deal parse(String id, Locale arg1) throws ParseException {
		// TODO Auto-generated method stub
		return dealService.findById(Long.parseLong(id));
	}

}