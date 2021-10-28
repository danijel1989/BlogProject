package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Role;
import cubes.main.entity.User;

public interface UserDAO {
	
	public List<User> getAllUsers();
	
	public void saveUser(User user);
	
	public void deleteUser(String username);
	
	public User getUser(String username);
	
	public List<Role> getUserRoles();
	

}
