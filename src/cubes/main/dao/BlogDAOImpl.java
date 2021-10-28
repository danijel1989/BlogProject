package cubes.main.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.persistence.Query;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Blog;
import cubes.main.entity.Tag;
import cubes.main.entity.User;

@Repository
public class BlogDAOImpl implements BlogDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public List<Blog> getBlogList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogList = session.createQuery("from Blog b", Blog.class).getResultList();
		
		for(Blog b: blogList) {
			Hibernate.initialize(b.getComments());
		}
		
		return blogList;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogListDesc() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogs = session.createQuery("from Blog b order by b.dateCreated DESC", Blog.class).getResultList();
		
		for(Blog b: blogs) {
			Hibernate.initialize(b.getComments());
		}
		
		return blogs;
	}
	
	@Transactional
	@Override
	public List<Blog> getImportantBlogsForMainPage() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> list = session.createQuery("from Blog b where b.isImportant = 1 order by b.dateCreated DESC",Blog.class)
				.setMaxResults(3).setFirstResult(0)
				.getResultList();
		
		for(Blog b: list) {
			Hibernate.initialize(b.getComments());
		}
		
		return list;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogListForAside() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogs = session.createQuery("select distinct b from Blog b order by b.seenCount DESC",Blog.class)
				.setMaxResults(3).setFirstResult(0).getResultList();
		
		for(Blog b: blogs) {
			Hibernate.initialize(b.getComments());
		}
		
		return blogs;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogsForFooter() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogs = session.createQuery("select distinct b from Blog b order by b.dateCreated DESC", Blog.class)
				.setMaxResults(3).setFirstResult(0)
				.getResultList();
		
		return blogs;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogsSliderHomepage() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> list = session.createQuery("from Blog b order by b.dateCreated DESC",Blog.class)
				.setMaxResults(3).setFirstResult(0)
				.getResultList();
		
		System.out.println(list.toString());
		
		return list;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogsSliderHomepage1() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> list1 = session.createQuery("from Blog b order by b.dateCreated DESC",Blog.class)
				.setMaxResults(3).setFirstResult(3)
				.getResultList();
		
		System.out.println(list1.toString());
		
		return list1;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogsSliderHomepage2() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> list1 = session.createQuery("from Blog b order by b.dateCreated DESC",Blog.class)
				.setMaxResults(3).setFirstResult(6)
				.getResultList();
		
		System.out.println(list1.toString());
		
		return list1;
	}
	
	

	@Transactional
	@Override
	public void saveBlog(Blog blog) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(blog);
		
	}

	@Transactional
	@Override
	public void deleteBlog(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Blog where id=:id");
		query.setParameter("id", id);
		query.executeUpdate();
		
	}

	@Transactional
	@Override
	public Blog getBlogById(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		Blog blog = session.get(Blog.class, id);
		
		Hibernate.initialize(blog.getTags());
		Hibernate.initialize(blog.getComments());
		
		return blog;
	}

	@Transactional
	@Override
	public List<Blog> getBlogList(Integer category) {
		
		Session session = sessionFactory.getCurrentSession();
		
		if(category == null || category == 0) {
			return getBlogList();
		}
		
		Query q = session.createQuery("from Blog b where b.category.id=:categoryId");
		q.setParameter("categoryId", category);
		
		return q.getResultList();
	}

	@Transactional
	@Override
	public List<Blog> getBlogList(Integer[] tags) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogs = session.createQuery("select distinct b from Blog b left join b.tags t where t.id in (:tags)")
				.setParameterList("tags", tags).getResultList();
		
		for(Blog b: blogs) {
			Hibernate.initialize(b.getComments());
		}
		
	
		return blogs;
	
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogListUser(String user) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Blog> blogs = session.createQuery("from Blog b where b.user.username=:username")
				.setParameter("username", user)
				.getResultList();
		
		for(Blog b: blogs) {
			Hibernate.initialize(b.getComments());
		}
		
		
		return blogs;
	}


	@Transactional
	@Override
	public List<Blog> getBlogList(String text) {
		
		Session session = sessionFactory.getCurrentSession();
		
		String stringQuery = "from Blog b where b.name like :text or b.description like :text";
		
		org.hibernate.query.Query query = session.createQuery(stringQuery);
		query.setParameter("text","%"+text+"%");
		
		
		return query.getResultList();
	}

//	public List<Product> getProductList(String text) {
//	
//	Session session = sessionFactory.getCurrentSession();
//	
//	String stringQuery = "from Product p where p.title like :text or p.description like :text";
//	
//    Query query = session.createQuery(stringQuery);
//    query.setParameter("text", "%" + text + "%");
//	
//	
//	return query.getResultList();
//}
	
	@Transactional
	@Override
	public List<Blog> getBlogsForAdminSearch(String text, Integer category, String user, Boolean enabled) {
		
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = "from Blog b";
		
		if(text != null) {
			queryString = queryString + " where b.name like :name";
		}
		
		if(category != null && category>0) {
			
			if(!queryString.contains("where")) {
				queryString = queryString + " where ";
			}
			else {
				queryString = queryString + " and ";
			}
			queryString = queryString + "b.category.id = :categoryId";
		}
		
		if(user != null) {
			
			if(!queryString.contains("where")) {
				queryString = queryString + " where ";
			}
			else {
				queryString = queryString + " and ";
			}
			queryString = queryString + "b.user.username like :username";
		}
		
		if(enabled != null) {
			
			if(!queryString.contains("where")) {
				queryString = queryString + " where ";
			}
			else {
				queryString = queryString + " and ";
			}
			queryString = queryString + "b.enabled=:enabled";
		}
		
		org.hibernate.query.Query query = session.createQuery(queryString, Blog.class);
		
		System.out.println(query.toString());
		
		if(text !=null) {
			query.setParameter("name","%"+text+"%");
		}
		if(category != null && category>0) {
			query.setParameter("categoryId", category);
		}
		if(user != null) {
			query.setParameter("username", user);
		}
		if(enabled != null) {
			query.setParameter("enabled", enabled);
		}
		
		List<Blog> blogs = query.getResultList();
		
			
		return blogs;
	    
	
	
	}

	





	
	

	
	
	

	

	
	
	

}
