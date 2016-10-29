package dao;

import java.util.List;

import model.Product;

public interface ProductDAO {

	public void insertProduct(Product p);

	public List<Product> getListProduct();

	public List<Product> getListProductByCategory(int category_id);
	
	public void deleteProduct(int product_id);

	public List<Product> getListProductByName(String name);

	public Product getProduct(int product_id);
	
	public List<Product> getListProductByPagination(List<Product> list,int start,int end);
	
}
