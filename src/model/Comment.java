package model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_comment")
	private int id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="content")
	private String content;
	
	@Column(name="likes")
	private int likes;
	
	@Column(name="dislikes")
	private int dislikes;
	
	@Column(name="post_date")
	private Date postDate;
	
	@Column(name="fk_page")
	private int pageId;

	public Comment() {}
	
	public Comment(int id, String username, String content, int likes, int dislikes,int page) {
		super();
		this.id = id;
		this.username = username;
		this.content = content;
		this.likes = likes;
		this.dislikes = dislikes;
		this.pageId = page;
	}

	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getContent() {
		return content;
	}

	public int getLikes() {
		return likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public int getPageId() {
		return pageId;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}
	
}
