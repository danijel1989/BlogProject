package cubes.main.entity;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String content;
	
	@Column(name = "date_created")
	private LocalDateTime dateCreated;
	@Column
	private String name;

	@Column
	private String email;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="id_blog")
	private Blog blog;
	
	@Column
	private boolean enabled;
	

	public Comment() {
		
	}
	
	public Comment(String id) {
		this.id = Integer.valueOf(id);
	}

	public Comment(int id, String content, LocalDateTime dateCreated, String name, String email) {
		super();
		this.id = id;
		this.content = content;
		this.dateCreated = dateCreated;
		this.name = name;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	
	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public String getDateFormatted() {
		
		LocalDateTime date = this.dateCreated;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d-MMMM-yyyy HH:mm:ss");
		
		String formattedDateTime = date.format(formatter);
		
		String finalDate = formattedDateTime.substring(0, 12);
		
		return finalDate;
	}
	
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return name+" - "+id+" - "+blog;
	}

	
	
	


	
	
	
	
	
	

}
