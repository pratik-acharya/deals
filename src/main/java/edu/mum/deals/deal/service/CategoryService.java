package edu.mum.deals.deal.service;

import java.util.List;

import edu.mum.deals.deal.domain.Category;

public interface CategoryService {
	public void saveCategory(Category category);
	public void deleteCategory(Long id);
	public Category findById(long id);
	
	public List<Category> findAll();
	
	void editCategory(Category category);
	

}
