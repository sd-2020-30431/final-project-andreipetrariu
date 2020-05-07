package dao;


import java.util.Date;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.User;

@Repository
public class UserDAO implements IUserDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public User readUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User u where u.username=:username and u.password=:password").setParameter("username", username).setParameter("password",password);
		User theUser;
		try{
			theUser = (User) query.getResultList().get(0);
		}
		catch(IndexOutOfBoundsException e) {
			theUser = null;
		}
		return theUser;
	}
	
	@Override
	@Transactional
	public void register(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	@Override
	@Transactional
	public void updateStatus(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User u set u.status=1 where u.username = :username").setParameter("username", username);
		query.executeUpdate();
	}

}
