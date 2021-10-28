package cubes.main.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "categories")
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String name;
	@Column
	private String image;
	@Column
	private boolean homepage;
	@Column
	private int numBlogs;
	@Column
	private int priority;
	

	
	
	public Category() {
		
	}
	
	public Category(String name, String image, boolean homepage) {
		super();
		this.name = name;
		this.image = image;
		this.homepage = homepage;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getIntId() {
		return (int)id;
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

	public boolean getHomepage() {
		return homepage;
	}

	public void setHomepage(boolean homepage) {
		this.homepage = homepage;
	}
	
	public String getSeoName() {
		
		return name.replaceAll(" ", "-").toLowerCase();
	}
	
	public int getNumBlogs() {
		return numBlogs;
	}

	public void setNumBlogs(int numBlogs) {
		this.numBlogs = numBlogs;
	}
	
	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return name+" - "+id;
	}
	
	

}
