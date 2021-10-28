package cubes.main.entity;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sliders")
public class Slider {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String image;
	@Column
	private String title;
	@Column
	private String description;
	@Column
	private String url;
	@Column(name = "button_title")
	private String buttonTitle;
	@Column
	private boolean enabled;
	@Column(name = "order_num")
	private int orderNum;
	
	public Slider() {
		
	}

	public Slider(String image, String title, String description, String url, String buttonTitle) {
		super();
		this.image = image;
		this.title = title;
		this.description = description;
		this.url = url;
		this.buttonTitle = buttonTitle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getButtonTitle() {
		return buttonTitle;
	}

	public void setButtonTitle(String buttonTitle) {
		this.buttonTitle = buttonTitle;
	}
	
	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return title+" - "+description+" - "+id;
	}
	
	
}
