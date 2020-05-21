package model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class Book {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_book")
	private int id;
	
	@Column(name="book_name")
	private String bookName;
	
	@Column(name="category")
	private String category;
	
	@Column(name="publish_date")
	private Date publishDate;
	
	@Column(name="content_path")
	private String contentPath;
	
	@Column(name="permission")
	private int permission;

	@Column(name="likes")
	private int likes;
	
	@Column(name="dislikes")
	private int dislikes;

	@Column(name="is_modified")
	private int isModified;	
	
	@Column(name="fk_publisher")
	private int publisherId;

	public Book() {}
	
	public Book(int id, String bookName, String category, String contentPath, int permission,
			int publisher, int likes, int dislikes,int isModified) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.category = category;
		this.contentPath = contentPath;
		this.permission = permission;
		this.publisherId = publisher;
		this.likes = likes;
		this.dislikes = dislikes;
		this.isModified=isModified;
	}

	public int getId() {
		return id;
	}

	public String getBookName() {
		return bookName;
	}

	public String getCategory() {
		return category;
	}

	public String getContentPath() {
		return contentPath;
	}
	
	public Date getPublishDate() {
		return publishDate;
	}

	public int getPermission() {
		return permission;
	}

	public int getPublisherId() {
		return publisherId;
	}

	public int getLikes() {
		return likes;
	}
	
	public int getDislikes() {
		return dislikes;
	}

	public int getIsModified() {
		return isModified;
	}
	
	public void setIsModified(int isModified) {
		this.isModified = isModified;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public void setPublisherId(int publisher) {
		this.publisherId = publisher;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}
	
}
