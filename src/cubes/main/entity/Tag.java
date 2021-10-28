package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Table;

@Entity
@Table(name = "tags")
public class Tag {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String title;
	@Column
	private String color;
	
	
	
	public Tag() {
		
	}
    
	public Tag(String id) {
		this.id = Integer.valueOf(id);
	}
	
	public Tag(String title, String color) {
		super();
		this.title = title;
		this.color = color;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public String getSeoTitle() {
		
		return title.replaceAll(" ", "-").toLowerCase();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return title+" - "+id;
	}

}
