package edu.mum.deals.deal.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import edu.mum.deals.deal.domain.Deal;
@Repository
public interface DealRepository extends JpaRepository<Deal,Long> {
	
	public Page<Deal> findByUserIdOrderByTimestampDesc(long userId, Pageable p);
	
	@Query("SELECT d FROM Deal d order by d.timestamp DESC")
	public Page<Deal> findByOrderByTimestampDesc(Pageable p);
	@Query("SELECT d FROM Deal d order by d.timestamp ASC")
	public Page<Deal> findByOrderByTimestampAsc(Pageable p);
	@Query("SELECT d FROM Deal d order by d.price DESC")
	public Page<Deal> findByOrderByPriceDesc(Pageable p);
	@Query("SELECT d FROM Deal d order by d.price ASC")
	public Page<Deal> findByOrderByPriceAsc(Pageable p);
	
	
	public Page<Deal> findByCategoryIdOrderByTimestampDesc(long categoryId,Pageable p);
	public Page<Deal> findByCategoryIdOrderByTimestampAsc(long categoryId,Pageable p);
	public Page<Deal> findByCategoryIdOrderByPriceDesc(long CategoryId,Pageable p);
	public Page<Deal> findByCategoryIdOrderByPriceAsc(long CategoryId,Pageable p);
	



	

}
