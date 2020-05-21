package dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.Comment;

@Repository
public class CommentDAO implements ICommentDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Comment> readComments(int pageId) {
		List<Comment> comments;
		Session session = sessionFactory.getCurrentSession();
		Query query;
		query = session.createQuery("from Comment c where c.pageId = :id").setParameter("id",pageId);
		comments = query.getResultList();
		return comments;
	}

	@Override
	@Transactional
	public void createComment(Comment theComment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(theComment);
	}

}
