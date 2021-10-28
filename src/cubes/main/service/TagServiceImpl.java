package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.TagDAO;
import cubes.main.entity.Tag;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDAO tagDAO;
	
	@Transactional
	@Override
	public List<Tag> getTagList() {
		
		return tagDAO.getTagList();
	}

	@Transactional
	@Override
	public void saveTag(Tag tag) {

		tagDAO.saveTag(tag);	
	}

	@Transactional
	@Override
	public Tag getTagById(int id) {
		
		return tagDAO.getTagById(id);
	}

	@Transactional
	@Override
	public void deleteTag(int id) {

		tagDAO.deleteTag(id);
	}

}
