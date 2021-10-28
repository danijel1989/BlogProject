package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private String authority;
	
	public Role() {
		
	}

	public Role(String authority) {
		super();
		this.authority = authority;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
    public String getTitle() {
    	return authority.replace("ROLE_", "").toUpperCase();
    }
    
    @Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return authority;
    }
	
	

}
