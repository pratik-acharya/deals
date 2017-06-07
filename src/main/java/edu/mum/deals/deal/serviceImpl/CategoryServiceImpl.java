package edu.mum.deals.deal.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.deals.deal.domain.Category;
import edu.mum.deals.deal.repository.CategoryRepository;
import edu.mum.deals.deal.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public Category findById(long id) {
		return categoryRepository.findOne(id);
	}

	@Override
	public List<Category> findAll() {
		return (List<Category>)categoryRepository.findAll();
	}


	@Override
	public void saveCategory(Category category) {
		// TODO Auto-generated method stub
		categoryRepository.save(category);
	}

	@Override
	public void deleteCategory(Long id) {
		// TODO Auto-generated method stub
		categoryRepository.delete(id);
	}

	@Override
	public void editCategory(Category category) {
		// TODO Auto-generated method stub
		
	}

	

}
