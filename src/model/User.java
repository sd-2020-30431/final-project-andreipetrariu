package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_user")
	private int id;
	
	@Column(name="username")
	@NotNull(message="is required")
	@Size(min=1,message="must contain at least 1 character")
	private String username;
	
	@Column(name="password")
	@NotNull(message="is required")
	@Size(min=1,message="must contain at least 1 character")
	private String password;
	
	@Column(name="status")
	private int status;
	
	public User() {
	}
	
	public User(int id, String username, String password,int status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public int getStatus() {
		return status;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
