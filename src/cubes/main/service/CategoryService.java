package cubes.main.service;

import java.util.List;

import cubes.main.entity.Category;

public interface CategoryService {
	
	public List<Category> getCategoryList();
	
	public Category getCategoryById(int id);
	
	public void saveCategory(Category category);
	
	public void deleteCategory(int id);
	
	public List<Category> getCatListByPriority();
	


}
