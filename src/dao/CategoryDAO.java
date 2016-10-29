package dao;

import java.util.List;

import model.Category;

public interface CategoryDAO {

	public void insertCategory(Category c);

	public List<Category> getCategoryByParent();
	
	public List<Category> getCategory();
	
	public List<Category> getCategoryChildren();

	public List<Category> getCategoryByChildren(int parent);
	
	public void updateCategory(Category c);

}
