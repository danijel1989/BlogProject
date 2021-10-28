package cubes.main.controller;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import cubes.main.dao.BlogDAO;
import cubes.main.dao.CommentDAO;
import cubes.main.dao.MessageDAO;
import cubes.main.dao.SliderDAO;
import cubes.main.dao.UserDAO;
import cubes.main.entity.Blog;
import cubes.main.entity.Category;
import cubes.main.entity.Comment;
import cubes.main.entity.Message;
import cubes.main.entity.Slider;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
import cubes.main.service.CategoryService;
import cubes.main.service.TagService;

@Controller
public class FrontController {
	
	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TagService tagService;
	@Autowired
	private SliderDAO sliderDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CommentDAO commentDAO;
	
//--------------------------- HOMEPAGE -----------------------------------
	
	@RequestMapping( value = {"/homepage", "/"} )
	public String getHomepage(Model model) {
		
		List<Blog> list = blogDAO.getImportantBlogsForMainPage();
		model.addAttribute("blogs", list);
		List<Slider> sliders = sliderDAO.getSLiderList();
		model.addAttribute("sliders", sliders);
		
		List<Blog> blogs = blogDAO.getBlogsSliderHomepage();
		model.addAttribute("blogsSlider", blogs);
		List<Blog> blogs1 = blogDAO.getBlogsSliderHomepage1();
		model.addAttribute("blogsSlider1", blogs1);
		List<Blog> blogs2 = blogDAO.getBlogsSliderHomepage2();
		model.addAttribute("blogsSlider2", blogs2);
		
		//FOOTER
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
	
		
		return "homepage";
	}
	

//----------------------- CONTACT PAGE -----------------------------------	
	
	@RequestMapping(value = "/contact-form")
	public String getContactPage(Model model) {
		
		model.addAttribute("message", new Message());
		
		//ASIDE------------------------------------------------
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		
		
		//FOOTER ---------------------------------------
		List<Blog> blogs = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogs);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		
		return "contact-form";
	}
	
	@RequestMapping(value = "/contact-save")
	public String getContactSavePage(@ModelAttribute Message message) {
		
		messageDAO.saveMessage(message);
		
		return "redirect:contact-form";
	}
	

//----------------------------- BLOGS ---------------------------------------
	
	
	@RequestMapping(value = {"/front-blog-list","/front-blog-list/{page}"})
	public String getFrontBlogPage(Model model, @PathVariable(required=false, name="page") String page, HttpServletRequest request, HttpServletResponse response) {
		
		PagedListHolder<Blog> blogList;
		
		if(page == null) {
			
			blogList = new PagedListHolder<Blog>();
			List<Blog> blogsList = blogDAO.getBlogList();
			blogList.setSource(blogsList);
			blogList.setPageSize(4);
			request.getSession().setAttribute("blogList", blogList);
			System.out.println(blogList.getPageCount());
			
		}
		
		else if(page.equals("prev")) {
			
			blogList = (PagedListHolder<Blog>) request.getSession().getAttribute("blogList");
			blogList.previousPage();
			
		}
		
		else if(page.equals("next")) {
			
			blogList = (PagedListHolder<Blog>) request.getSession().getAttribute("blogList");
			blogList.nextPage();
			
		}
		
		else {
			
			int pageNum = Integer.parseInt(page);
			blogList = (PagedListHolder<Blog>) request.getSession().getAttribute("blogList");
			blogList.setPage(pageNum-1);
			
		}
		
		
//		List<Blog> blogs = blogDAO.getBlogListDesc();
//	    model.addAttribute("blogs", blogs);
	      
	      
		
		//ASIDE
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		List<Category> categories = categoryService.getCategoryList();
		model.addAttribute("categoriesAside", categories);
		List<Tag> tags = tagService.getTagList();
		model.addAttribute("tagsAside", tags);
		
		
		//FOOTER
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		return "front-blog-list";
		
	}
	
	@RequestMapping(value = "/front-blog-category/{seoName}/{id}")
	public String getBlogListByCategory(@PathVariable(required = false) String seoName,@PathVariable(required = false) Integer id, Model model) {
		
		//NASLOV
		Category c = categoryService.getCategoryById(id);
		model.addAttribute("category", c);
		
		//BLOGOVI PO KATEGORIJI
		List<Blog> blogs = blogDAO.getBlogList(id);
		model.addAttribute("blogs", blogs);
		
		//SETOVANJE BROJA BLOGOVA PO KATEGORIJI
		int catBlogs = blogs.size();
	    c.setNumBlogs(catBlogs);
	    categoryService.saveCategory(c);
		
		//ASIDE ----------------------------------------------
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		
		
		List<Category> categoriesAside = categoryService.getCategoryList();
		model.addAttribute("categoriesAside", categoriesAside);
		
		List<Tag> tags = tagService.getTagList();
		model.addAttribute("tagsAside", tags);
		
		
		//FOOTER -------------------------------------------
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		
		return "front-blog-category";
	}
	
	@RequestMapping(value = "/front-blog-tag/{seoTitle}/{id}")
	public String getBlogListByTags(@PathVariable String seoTitle,@PathVariable(required = false, value = "id") Integer[] tags, Model model) {
		
		//lista tagova i int indeks taga
        List<Tag> tagList = tagService.getTagList();
        int tagId = tags[0];
        
        //for petljom prolazim kroz listu i uporedjujem id taga iz niza tags i dobijene vrednosti iz niza 
	        for(int i=0; i<tagList.size();i++) {
	        	
		        	if(tagId == tags[0]) {
		        		//System.out.println(tagId+" - "+tags[0]);
		        		Tag t = tagService.getTagById(tagId);
		        		model.addAttribute("tagName", t.getTitle());
		        		//System.out.println(t.getTitle());
		        		break;
		        	}
	        	
	        }
        
		//BLOGOVI PO TAGU
		List<Blog> blogs = blogDAO.getBlogList(tags);
		model.addAttribute("blogs", blogs);
		
		//ASIDE ----------------------------------------------
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		
		List<Category> categories = categoryService.getCategoryList();
	    model.addAttribute("categoriesAside", categories);
	    
	    List<Tag> tagss = tagService.getTagList();
	    model.addAttribute("tagsAside", tagss);
	    
	    //FOOTER --------------------------------------------
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		
		return "front-blog-tag";
	}
	
	@RequestMapping(value = "/front-blog-user/{seoName}/{username}")
	public String getBlogListByAuthor(@PathVariable(required = false) String seoName,@PathVariable(required = false) String username, Model model) {
		
		User u = userDAO.getUser(username);
		model.addAttribute("user", u);
		
		 //BLOGOVI PO AUTORU
		 List<Blog> blogs = blogDAO.getBlogListUser(username);
		 model.addAttribute("blogs", blogs);
		 
		
		 //ASIDE ----------------------------------------------
	     List<Blog> blogsAside = blogDAO.getBlogListForAside();
		 model.addAttribute("blogsAside", blogsAside);
				
		 List<Category> categories = categoryService.getCategoryList();
		 model.addAttribute("categoriesAside", categories);
			    
		 List<Tag> tagss = tagService.getTagList();
	     model.addAttribute("tagsAside", tagss);
			    
		 //FOOTER --------------------------------------------
		 List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		 model.addAttribute("blogsFooter", blogsFooter);
		 List<Category> categoryFooter = categoryService.getCatListByPriority();
			model.addAttribute("categoryFooter", categoryFooter);
		 
		 
		return "front-blog-user";
	}
	
	@RequestMapping(value = "/front-blog-details/{seoName}/{id}")
	public String getBlogDetailsPage(@PathVariable String seoName ,@PathVariable int id ,Model model ) {
	
		
		Blog blog = blogDAO.getBlogById(id);
		blog.setSeenCount(blog.getSeenCount()+1);
		blogDAO.saveBlog(blog);
		model.addAttribute("blog", blog);
		
		List<Tag> tags = blog.getTags();
		model.addAttribute("blogTags", tags);
		
		List<Blog> blogsList = blogDAO.getBlogList();
		
		for(int i=0;i<blogsList.size();i++) {
			//System.out.println(blogsList.get(i));
            
				if(blogsList.get(i).toString().equals(blog.toString())) {
	            	//System.out.println("USAOOOO");
					
	            	ListIterator<Blog> iterator = blogsList.listIterator(i+1);
	            	
		            	if(iterator.hasNext()) {
		            		Blog next = (Blog) iterator.next();
		            		//System.out.println("Next element is: "+next.toString());
		            		model.addAttribute("next", next);
		            	}
	            	
	            	ListIterator<Blog> iterator1 = blogsList.listIterator(i);
	            		
		            	if(iterator1.hasPrevious()) {
		            		Blog prev = (Blog) iterator1.previous();
		            		//System.out.println("Previous element is: "+prev.toString());
		            		model.addAttribute("prev", prev);
		            	}
	            break;
	            }
		}
		
		//ASIDE -----------------------------------------------------
		
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		
		List<Category> categories = categoryService.getCategoryList();
		model.addAttribute("categoriesAside", categories);
		
		List<Tag> tagsAside = tagService.getTagList();
		model.addAttribute("tagsAside", tagsAside);
		
		//FOOTER ----------------------------------------------------
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		//DODAVANJE COMMENT OBJEKTA ZA FORMU
		model.addAttribute("comment", new Comment());
		
		return "front-blog-details";
	}
	
	
	@RequestMapping(value = "/front-search")
	public String getBlogSearchPage(@RequestParam String text, Model model) {
	    
		//BLOGOVI PO SEARCH-u
		List<Blog> blogs = blogDAO.getBlogList(text);
		model.addAttribute("blogs", blogs);
		
		
		//ASIDE -----------------------------------------------
		List<Blog> blogsAside = blogDAO.getBlogListForAside();
		model.addAttribute("blogsAside", blogsAside);
		
		List<Category> categories = categoryService.getCategoryList();
		model.addAttribute("categoriesAside", categories);
		
		List<Tag> tags = tagService.getTagList();
		model.addAttribute("tagsAside", tags);
		
		
		
		//FOOTER-----------------------------------------------
		List<Blog> blogsFooter = blogDAO.getBlogsForFooter();
		model.addAttribute("blogsFooter", blogsFooter);
		List<Category> categoryFooter = categoryService.getCatListByPriority();
		model.addAttribute("categoryFooter", categoryFooter);
		
		
		return "front-search";
	}
	
//----------------------------- COMMENTS -----------------------------------------------
	
	@RequestMapping(value = "comment-save/{seoName}/{id}")
	public String getCommentSave(@ModelAttribute Comment comment,@PathVariable String seoName, @PathVariable int id) {
		
		
		Blog b = blogDAO.getBlogById(id);
		
		
		comment.setBlog(b);
		comment.setEnabled(true);
		comment.setDateCreated(comment.getDateCreated().now());
		
		commentDAO.saveComment(comment);
		
		String s = "redirect:/front-blog-details/"+seoName+"/"+id;
		
	    return s;
	    
	}
	
	
}
