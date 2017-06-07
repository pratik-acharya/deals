package edu.mum.deals.deal.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.deals.deal.domain.Deal;
import edu.mum.deals.deal.repository.DealRepository;
import edu.mum.deals.deal.service.DealService;
import edu.mum.deals.user.service.SecurityService;
import edu.mum.deals.user.service.UserService;

@Service
@Transactional
public class DealServiceImpl implements DealService {

	@Autowired
	private DealRepository dealRepository;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserService userService;

	@Override
	public Deal addDeal(Deal deal) {

		deal.setUser(userService.findByEmail(securityService.findLoggedInUsername()));
		return dealRepository.save(deal);

	}

	@Override
	public Deal findById(long id) {
		return dealRepository.findOne(id);
	}

	@Override
	public Page<Deal> findByUserIdOrderByTimestampDesc(long userId, Pageable p) {
		Page<Deal> page = dealRepository.findByUserIdOrderByTimestampDesc(userId, p);
		return page;

	}

	@Override
	public void deleteById(long id) {
		dealRepository.delete(id);
	}

	
	

	@Override
	public Page<Deal> getDealsByFilterAndSorting(String filter, long value, String sort, String direction, Pageable p) {
		System.out.println("here in sorting and filtering");

		Page<Deal> page = null;
		
			switch (sort) {

			case "price":
				if (direction.equals("desc")) {
					page = dealRepository.findByCategoryIdOrderByPriceDesc(value, p);

				} else {
					page = dealRepository.findByCategoryIdOrderByPriceAsc(value, p);
				}
			default:
				if (direction.equals("desc")) {
					page = dealRepository.findByCategoryIdOrderByTimestampDesc(value, p);
				} else {
					page = dealRepository.findByCategoryIdOrderByTimestampAsc(value, p);

				}

			}
		
		return page;

	}

	@Override
	public Page<Deal> getDealsBySorting(String sort, String direction, Pageable p) {
		System.out.println("here in sorting");
		System.out.println(direction);
		System.out.println(sort);

		Page<Deal> page = null;

		switch (sort) {

		case "price":
			if (direction.equals("desc")) {
				page = dealRepository.findByOrderByPriceDesc(p);

			} else {
				page = dealRepository.findByOrderByPriceAsc(p);
			}
		default:
			if (direction.equals("desc")) {
				page = dealRepository.findByOrderByTimestampDesc(p);
			} else {
				page = dealRepository.findByOrderByTimestampAsc(p);

			}

		}
		return page;
	}

}
