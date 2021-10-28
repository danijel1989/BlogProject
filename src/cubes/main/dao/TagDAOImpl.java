package cubes.main.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Tag;

@Repository
public class TagDAOImpl implements TagDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Tag> getTagList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Tag> tagList = session.createQuery("from Tag", Tag.class).getResultList();
		
		return tagList;
	}

	@Override
	public void saveTag(Tag tag) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(tag);
		
	}

	@Override
	public Tag getTagById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Tag tag = session.get(Tag.class, id);
		
		return tag;
	}

	@Override
	public void deleteTag(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Tag where id=:id");
		
		query.setParameter("id", id);
		
		query.executeUpdate();
		
	}

}
