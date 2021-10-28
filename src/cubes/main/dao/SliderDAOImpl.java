package cubes.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Slider;

@Repository
public class SliderDAOImpl implements SliderDAO{

	@Autowired
    private SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public List<Slider> getSLiderList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Slider> list = session.createQuery("from Slider s order by s.orderNum ASC", Slider.class).getResultList();
		
		return list;
	}
	
	

	@Transactional
	@Override
	public void saveSlider(Slider slider) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(slider);
		
	}

	@Transactional
	@Override
	public Slider getSliderById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Slider s = session.get(Slider.class, id);
		
		return s;
	}

	@Transactional
	@Override
	public void deleteSlider(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
//		Slider s = session.get(Slider.class, id);
//		
//		session.delete(s);
		
		Query query = session.createQuery("delete Slider s where s.id =: id");
		query.setParameter("id", id);
		query.executeUpdate();
		
	}

}
