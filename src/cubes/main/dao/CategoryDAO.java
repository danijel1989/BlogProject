package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Category;

public interface CategoryDAO {
	
	public List<Category> getCategoryList();
	
	public Category getCategoryById(int id);
	
	public void saveCategory(Category category);
	
	public void deleteCategory(int id);
	
	public List<Category> getCatListByPriority();
	
	
	
	
	
	

	
	
}
