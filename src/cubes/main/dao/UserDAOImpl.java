package cubes.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Role;
import cubes.main.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<User> getAllUsers() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> list = session.createQuery("from User", User.class).getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public void saveUser(User user) {

		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(user);
		
	}

	@Transactional
	@Override
	public void deleteUser(String username) {
		
		Session session = sessionFactory.getCurrentSession();
		
		User user = session.get(User.class, username);
		
		session.delete(user);
		
	}

	@Transactional
	@Override
	public User getUser(String username) {
		
		Session session = sessionFactory.getCurrentSession();
		
		User user = session.get(User.class, username);
		
		return user;
	}

	@Transactional
	@Override
	public List<Role> getUserRoles() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Role> list = session.createQuery("from Role", Role.class).getResultList();
		
		return list;
	}
	
	

}
