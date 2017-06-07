package edu.mum.deals.deal.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import edu.mum.deals.deal.domain.Deal;

public interface DealService {
	
	public Deal addDeal(Deal deal);
	public Deal findById(long id);
	public void deleteById(long id);
	Page<Deal> findByUserIdOrderByTimestampDesc(long userId, Pageable p);
	public Page<Deal> getDealsByFilterAndSorting(String filter,long value,String sort, String direction,Pageable p);
	public Page<Deal> getDealsBySorting(String sort, String direction,Pageable p);


}
