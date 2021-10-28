package cubes.main.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Hibernate;


@Entity
@Table(name = "blogs")
public class Blog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String name;
	@Column
	private String image;
	@Column
	private String description;
	@Column
	private boolean enabled;
	@Column
	private boolean isImportant;
	@Column(name = "date_created")
	private LocalDateTime dateCreated;
	@Column
	private int seenCount;
	
	
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name = "username_user")
	private User user;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name = "id_category")
	private Category category;
	
	@ManyToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable(name = "blogs_tags", joinColumns = @JoinColumn(name="blog_id"), inverseJoinColumns = @JoinColumn(name="tag_id"))
	private List<Tag> tags;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "blog")
    private List<Comment> comments;
	
	
	public Blog() {
		
	}
	
	public Blog(String id) {
		this.id = Integer.valueOf(id);
	}

	public Blog(String name, String image, String description, boolean enabled, boolean isImportant, LocalDateTime dateCreated, int seenCount) {
		super();
		this.name = name;
		this.image = image;
		this.description = description;
		this.enabled = enabled;
		this.isImportant = isImportant;
		this.dateCreated = dateCreated;
		this.seenCount = seenCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	                      
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	
	public boolean getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(boolean isImportant) {
		this.isImportant = isImportant;
	}
	
	public LocalDateTime getDateCreated() {
		return dateCreated;
	}
	
	
	
	public String getDateFormatted() {
		
		LocalDate created = this.dateCreated.toLocalDate();
		
		LocalDate now = LocalDate.now();
		
		Period period = Period.between(now, created);
		
		int y = period.getYears();
		int m = period.getMonths();
		int d = period.getDays();
		
		String years = String.valueOf(y).replace("-", "");
		String months = String.valueOf(m).replace("-", "");
		String days = String.valueOf(d).replace("-", "");
		
		if(period.getYears() == 0 && period.getMonths() == 0) {
			return days+" days ago.";
		}
		
		else if(period.getYears() == 0){
				return months+" months and "+days+" days ago.";
		}
		
		else {
			return years+" years, "+months+" months and "+days+" days ago.";
		}
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	
	public String getSeoName() {
		
		return name.replaceAll(" ", "-").toLowerCase();
	}
	
	
	public int getSeenCount() {
		return seenCount;
	}

	public void setSeenCount(int seenCount) {
		this.seenCount = seenCount;	
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
    public int getCommentsNum() {
    	
    	int commentsNumber = 0;
    	for(Comment c : comments) {
    		if(c.getEnabled()) {
    			
    			commentsNumber ++;
    		}
    		
    	}
    	
    	return commentsNumber;
    }
	
	
	
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return name+" - "+id;
	}
	
	
}
