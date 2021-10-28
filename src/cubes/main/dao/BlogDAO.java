package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Blog;
import cubes.main.entity.User;

public interface BlogDAO {
	
	public List<Blog> getBlogList();
	
	public List<Blog> getBlogListDesc();
	
	public void saveBlog(Blog blog);
	
	public void deleteBlog(int id);

	public Blog getBlogById(int id);
	
	public List<Blog> getImportantBlogsForMainPage();
	
	public List<Blog> getBlogsSliderHomepage();
	
	public List<Blog> getBlogsSliderHomepage1();
	
	public List<Blog> getBlogsSliderHomepage2();
	
	public List<Blog> getBlogList(Integer category);
	
    public List<Blog> getBlogList(Integer[] tags);
    
    public List<Blog> getBlogListUser(String user);
    
    public List<Blog> getBlogListForAside();
    
    public List<Blog> getBlogList(String text);
    
    public List<Blog> getBlogsForFooter();
    
    public List<Blog> getBlogsForAdminSearch(String text, Integer category, String user, Boolean enabled);
    

}
