package cubes.main.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cubes.main.entity.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Category> getCategoryList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Category> categoryList = session.createQuery("from Category", Category.class).getResultList();
		
		return categoryList;
	}

	@Override
	public Category getCategoryById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Category category = session.get(Category.class, id);
		
		return category;
	}

	@Override
	public void saveCategory(Category category) {

		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(category);
		
	}
	
	@Override
	public void deleteCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Category where id=:id");
		query.setParameter("id", id);
		query.executeUpdate();
		
	}

	@Override
	public List<Category> getCatListByPriority() {

		Session session = sessionFactory.getCurrentSession();
		
		List<Category> categories = session.createQuery("from Category c where c.priority>0", Category.class).setFirstResult(0).setMaxResults(4)
				.getResultList();
		
		return categories;
	}

	

	
	
		
	

}
