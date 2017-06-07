package edu.mum.deals.deal.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.deals.deal.domain.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>{

}
