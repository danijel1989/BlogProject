package cubes.main.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

DANEE

import cubes.main.dao.BlogDAO;
import cubes.main.dao.CommentDAO;
import cubes.main.dao.MessageDAO;
import cubes.main.dao.SliderDAO;
import cubes.main.dao.UserDAO;
import cubes.main.entity.Blog;
import cubes.main.entity.Category;
import cubes.main.entity.ChangePassword;
import cubes.main.entity.Comment;
import cubes.main.entity.Message;
import cubes.main.entity.Slider;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
import cubes.main.service.CategoryService;
import cubes.main.service.TagService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TagService tagService;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private SliderDAO sliderDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CommentDAO commentDAO;
	
//------------------------ DASHBOARD -----------------------------------------------	
	
	@RequestMapping(value ={"/","dashboard"})
	public String getDashboardPage(Model model) {
	
		long unreadMessagesCount = messageDAO.getUnreadMessagesCount();
		
		model.addAttribute("unreadMessagesCount", unreadMessagesCount);
		
		return "dashboard";
	}
	
	
	
//---------------------- CATEGORIES -------------------------------------
	
	@RequestMapping(value = "/category-list")
	public String getCategoryList(Model model) {
		
		List<Category> list = categoryService.getCategoryList();
		
		model.addAttribute("categories", list);
		
		System.out.println(list.toString());
		
		return "category-list";
	}
	
	@RequestMapping(value = "/category-form")
	public String getCategoryForm(Model model) {
		
		model.addAttribute("category", new Category());
		
		return "category-form";
	}
	
	@RequestMapping(value = "/category-save")
	public String getCategorySave(@ModelAttribute Category category) {
		
		categoryService.saveCategory(category);
		
		return "redirect:category-list";
	}
	
	@RequestMapping(value = "category-update")
	public String getCategoryUpdate(@RequestParam int id, Model model) {
		
		Category category = categoryService.getCategoryById(id);
		
		model.addAttribute("category", category);
		
		
		return "category-form";
	}
	
	@RequestMapping(value = "category-delete")
	public String getCategoryDelete(@RequestParam int id) {
		
		categoryService.deleteCategory(id);
		
		return "redirect:category-list";
	}
	
//-------------------------- TAGS ---------------------------------------------	

	@RequestMapping(value = "/tag-list")
	public String getTagList(Model model) {
		
		List<Tag> list = tagService.getTagList();
		
		model.addAttribute("tags", list);
		
		System.out.println(list.toString());
		
		return "tag-list";
	}
	
	@RequestMapping(value = "/tag-form")
	public String getTagForm(Model model) {
		
		model.addAttribute("tag", new Tag());
		
		return "tag-form";
	}
	
	@RequestMapping(value = "/tag-save")
	public String getTagSave(@ModelAttribute Tag tag) {
		
		tagService.saveTag(tag);
		
		return "redirect:tag-list";
	}
	
	@RequestMapping(value = "/tag-update")
	public String getTagUpdate(@RequestParam int id, Model model) {
		
		Tag tag = tagService.getTagById(id);
		
		model.addAttribute("tag", tag);
		
		return "tag-form";
	}
	
	@RequestMapping(value = "/tag-delete")
	public String getTagDelete(@RequestParam int id) {
		
		tagService.deleteTag(id);
		
		return "redirect:tag-list";
	}
	
//-------------------------- BLOGS -------------------------------------------	
	
	@RequestMapping(value = "/blog-list")
	public String getBlogList(@RequestParam(required = false) String text, @RequestParam(required = false) Integer category, 
		@RequestParam(required = false) String user, @RequestParam(required = false) Boolean enabled,  Model model, Principal principal) {
		
		if(text != null && text.length()==0) {
			text = null;
		}
		
		if(user != null && user.length()==0) {
			user = null;
		}
		
		if(text != null) {
			model.addAttribute("textSelected", text);
		}
		
		if(category != null) {
			model.addAttribute("categorySelected", category);
		}
		
		if(user != null) {
			model.addAttribute("userSelected", user);
		}
		
		if(enabled != null) {
			model.addAttribute("enabledSelected", enabled);
		}
		
		//---------------------------------------------------------------------------------------
		List<Blog> blogsSearch = blogDAO.getBlogsForAdminSearch(text, category, user, enabled);
		model.addAttribute("blogsSearch", blogsSearch);
		
		List<Category> categories = categoryService.getCategoryList();
		model.addAttribute("categories", categories);
		
		
		List<User> users = userDAO.getAllUsers();
		model.addAttribute("authors", users);
		
		
	
		//----------------ZA GET PARAMETRE DA OSTANU SELECT NAKON IZABRANOG PARAMETRA ----------------------
		
		
		
		
		return "blog-list";
	}
	
	
	@RequestMapping(value = "blog-form")
	public String getBlogForm(Model model) {
		
		List<Category> categories = categoryService.getCategoryList();
		List<Tag> tags = tagService.getTagList();
		
		model.addAttribute("blog", new Blog());
		model.addAttribute("categories", categories);
		model.addAttribute("tags", tags);
		
		
		return "blog-form";
	}
	
	@RequestMapping(value = "/blog-save")
	public String getBlogSave(@ModelAttribute Blog blog, Principal principal) {
		
		Category cat = categoryService.getCategoryById(blog.getCategory().getId());
		
		User user = userDAO.getUser(principal.getName());
		   
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Tag t : blog.getTags()) {
			
			Tag tempTag = tagService.getTagById(t.getId());
			
			tags.add(tempTag);
		}
		
		if(blog.getDateCreated() == null) {
			
			LocalDateTime datetime = blog.getDateCreated().now();
			
			blog.setDateCreated(datetime);
		}
		
		LocalDateTime datetime = blog.getDateCreated();
		
		blog.setDateCreated(datetime);
		
		blog.setUser(user);
		
		blog.setCategory(cat);
		
		blog.setUser(user);
		
		System.out.println("USER: "+user);
		
		blog.setTags(tags);
	
		blogDAO.saveBlog(blog);
		
	
		
		return "redirect:blog-list";
	}
	
	@RequestMapping(value = "/blog-update")
	public String getBlogUpdate(@RequestParam int id, Model model) {
		
		Blog blog = blogDAO.getBlogById(id);
		List<Category> categories = categoryService.getCategoryList();
		List<Tag> tags = tagService.getTagList();
		

		model.addAttribute("blog", blog);
		
		model.addAttribute("categories", categories);
		
		model.addAttribute("tags", tags);
		
		
		return "blog-form";
	}
	
	@RequestMapping(value = "/blog-delete")
	public String getBlogDelete(@RequestParam int id) {
		
		blogDAO.deleteBlog(id);
		
		return "redirect:blog-list";
	}
	
	@RequestMapping(value = "/blog-detail")
	public String getBlogDetail(@RequestParam int id, Model model) {
		
		Blog blog = blogDAO.getBlogById(id);
        
		model.addAttribute("blog", blog);
		
		
		
		return "blog-detail";
	}
	
	@RequestMapping(value = "/blog-important")
	public String getBlogImportantPage(@RequestParam int id) {
		
		Blog blog = blogDAO.getBlogById(id);
		
		if(blog.getIsImportant() == false) {
			blog.setIsImportant(true);
			blogDAO.saveBlog(blog);
		}
		else{
			blog.setIsImportant(false);
			blogDAO.saveBlog(blog);	
		}
	
		return "redirect:blog-list";
	}
	
	@RequestMapping(value = "/blog-enabled")
	public String getBlogEnable(@RequestParam int id) {
		
		Blog b = blogDAO.getBlogById(id);
		
		b.setEnabled(!b.getEnabled());
		
		blogDAO.saveBlog(b);
		
		return "redirect:blog-list";
	}
	
//------------------------ MESSAGES ----------------------------------------	
	
	@RequestMapping(value = "/message-list")
	public String getMessageList(Model model) {
		
		List<Message> list = messageDAO.getMessageList();
		
		model.addAttribute("messages", list);
		
		return "message-list";
	}
	
	@RequestMapping(value = "/message-seen")
	public String getCommentSeenPage(@RequestParam int id) {
		
		Message message = messageDAO.getMessageById(id);
		
		message.setIsSeen(true);
		
		messageDAO.saveMessage(message);
		
		return "redirect:message-list";
	}
	
//---------------------------- SLIDERS ----------------------------------------
	
	@RequestMapping(value = "/slider-list")
	public String getSliderList(Model model) {
		
		List<Slider> sliders = sliderDAO.getSLiderList();
		
		
		model.addAttribute("sliders", sliders);
		
		
		return "slider-list";
	}
	
	@RequestMapping(value = "/slider-form")
	public String getSliderFormPage(Model model) {
		
		model.addAttribute("slider", new Slider());
		
		
		
		return "slider-form";
	}
	
	@RequestMapping(value = "/slider-update")
	public String getSliderUpdate(@RequestParam int id, Model model) {
		
		Slider s = sliderDAO.getSliderById(id);
		
		model.addAttribute("slider", s);
		
		return "slider-form";
	}
	
	@RequestMapping(value = "/slider-save")
	public String getSliderSave(@ModelAttribute Slider slider) {
		
		slider.setEnabled(true);
		
		sliderDAO.saveSlider(slider);
		
		return "redirect:slider-list";
	}
	
	@RequestMapping(value = "/slider-delete")
	public String getSliderDelete(@RequestParam int id) {
		
		sliderDAO.deleteSlider(id);
		
		return "redirect:slider-list";
	}
	
	@RequestMapping(value = "slider-enabled")
	public String getSliderEnable(@RequestParam int id) {
		
		Slider s = sliderDAO.getSliderById(id);
		
		s.setEnabled(!s.getEnabled());
		
		sliderDAO.saveSlider(s);
		
		return "redirect:slider-list";
	}
	

//----------------------------USERS PAGES -------------------------------------
	
	@RequestMapping(value = "/user-list")
	public String getUsersListPage(Model model) {
		
		List<User> users = userDAO.getAllUsers();
		
		model.addAttribute("users", users);
		
		return "user-list";
	}
	
	@RequestMapping(value = "/user-enabled")
	public String getUserEnabled(@RequestParam String username) {
		
		User user = userDAO.getUser(username);
		
		user.setEnabled(!user.getEnabled());
		
		userDAO.saveUser(user);
		
		return "redirect:user-list";
	}
	
	@RequestMapping(value = "/user-delete")
	public String getUserDelete(@RequestParam String username) {
		
		userDAO.deleteUser(username);
		
		return "redirect:user-list";
	}
	
	@RequestMapping(value = "/user-form")
	public String getUserForm(Model model) {
		
		model.addAttribute("user", new User());
		model.addAttribute("userRoles", userDAO.getUserRoles());
		
		return "user-form";
	}
	
	@RequestMapping(value = "/user-save")
	public String getUserSave(@ModelAttribute User user) {
		
		user.setEnabled(true);
		user.generateBCryptPassword();
		userDAO.saveUser(user);
		
		return "redirect:user-list";
	}
	
	@RequestMapping(value = "/user-update")
	public String getUserUpdate(@RequestParam String username, Model model) {
		
		model.addAttribute("user", userDAO.getUser(username));
		model.addAttribute("userRoles", userDAO.getUserRoles());
		model.addAttribute("isAdmin", true);
		
		User u = userDAO.getUser(username);
		System.out.println(u.getRole());
		
		if(u.getRoles() != null) {
			
			System.out.println("USAO");
			System.out.println(u.getRoles().get(0).getTitle());
			model.addAttribute("roleSelected", u.getRoles().get(0).getTitle());
			
	
		}
		
		
		
		return "user-form-update";
	}
	
	@RequestMapping(value = "/user-myupdate")
	public String getUserMyUpdate(Principal principal, Model model) {
		
		model.addAttribute("user", userDAO.getUser(principal.getName()));
		
		return "user-form-update";
	}
	
    @RequestMapping(value = "user-change-password")
	public String getUserChangePasswordPage(Principal principal, Model model) {
		
    	model.addAttribute("changePassword", new ChangePassword());
		
		return "user-form-change-password";
	}
    
    @RequestMapping(value = "/user-save-change-password")
    public String getChangePasswordSave(@ModelAttribute ChangePassword changePassword, Principal principal, Model model) {
    	
    	User user = userDAO.getUser(principal.getName());
    	
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    	
    	if(!changePassword.getNewPassword().equalsIgnoreCase(changePassword.getConfirmPassword())) {
    		
    		model.addAttribute("message", "New password and confirmation of new password are not same!");
    	    model.addAttribute("changePassword", changePassword);
    		
    		
    	}
    	
    	else if(!encoder.matches(changePassword.getOldPassword(), user.getEncodedPassword())) {
    		
    		model.addAttribute("message", "Old password is not correct!");
    	    model.addAttribute("changePassword", changePassword);
    		
    	}
    	
    	else {
    		
    		user.setPassword(changePassword.getNewPassword());
    		user.generateBCryptPassword();
    		userDAO.saveUser(user);
    		
    		model.addAttribute("message", "You have changed password successfully");
    	    model.addAttribute("changePassword", new ChangePassword());
    		
    	}
    	
    	return "user-form-change-password";
    }
    
    
//---------------------------- COMMENTS -------------------------------------------------
    
    @RequestMapping(value = "/comment-list")
    public String getCommentList(Model model) {
    	
    	List<Comment> list = commentDAO.getCommentList();
    	model.addAttribute("comments", list);
    	
    	return "comment-list";
    }
    
    @RequestMapping(value = "/comment-enabled")
    public String getCommentEnabled(@RequestParam int id) {
    	
    	Comment c = commentDAO.getCommentByid(id);
    	
    	c.setEnabled(!c.getEnabled());
    	
    	commentDAO.saveComment(c);
    	
    	
    	return "redirect:comment-list";
    }
    
    
    
	
	
	
	
	
	
	
	
	
  
	
}
