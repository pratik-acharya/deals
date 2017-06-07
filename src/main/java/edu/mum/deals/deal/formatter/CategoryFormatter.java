package edu.mum.deals.deal.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

import edu.mum.deals.deal.domain.Category;
import edu.mum.deals.deal.service.CategoryService;

public class CategoryFormatter implements Formatter<Category> {
	@Autowired
	private CategoryService categoryService;

	@Override
	public String print(Category category, Locale arg1) {
		return category.getName();
	}

	@Override
	public Category parse(String id, Locale arg1) throws ParseException {
		return categoryService.findById(Long.parseLong(id));
	}



}
