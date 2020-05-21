package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="feedback")
public class BookFeedback {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_feedback")
	private int id;
	
	@Column(name="likes")
	private int likes;
	
	@Column(name="dislikes")
	private int dislikes;

	public BookFeedback() {}
	
	public BookFeedback(int id, int likes, int dislikes) {
		super();
		this.id = id;
		this.likes = likes;
		this.dislikes = dislikes;
	}

	public int getId() {
		return id;
	}

	public int getLikes() {
		return likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}
	
}
