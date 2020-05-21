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
	public boolean checkPassword(String username,String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User u where u.username=:username").setParameter("username", username);
		User user = (User) query.getResultList().get(0);
		if(user.getPassword().compareTo(password)==0)
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public User readOfflineUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User u where u.username=:username and u.password=:password and status=0").setParameter("username", username).setParameter("password",password);
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
	public void updateStatus(String username,int status) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User u set u.status=:status where u.username = :username").setParameter("status", status).setParameter("username", username);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public int readUserId(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User u where u.username=:username").setParameter("username", username);
		User result = (User) query.getResultList().get(0);
		return result.getId();
	}

	@Override
	@Transactional
	public void updatePassword(String username, String newPassword) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User u set u.password = :pass where u.username=:username").setParameter("pass", newPassword).setParameter("username",username);
		query.executeUpdate();
	}

}
