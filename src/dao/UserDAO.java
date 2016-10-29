package dao;

import java.util.List;

import model.User;

public interface UserDAO {

	public void insertUser(User u);

	public User getUser(int user_id);

	public boolean checkLogin(String username, String password);

	public boolean checkUsername(String username);
	
	public boolean checkRole(String role);
	
	public void deleteUser(int user_id);
	
	public void updateUser(User user);
	
	public List<User> getAll();

}
