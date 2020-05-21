package dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Repository;
import model.Book;

@Repository
public class BookDAO implements IBookDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public Book readBook(int id) {
		Book theBook;
		Session session = sessionFactory.getCurrentSession();
		Query query;
		query = session.createQuery("from Book b where b.id = :id").setParameter("id",id);
		theBook = (Book) query.getResultList().get(0);
		return theBook;
	}
	
	@Override
	@Transactional
	public List<Book> readBooks(){
		List<Book> books;
		Session session = sessionFactory.getCurrentSession();
		Query query;
		query = session.createQuery("from Book b order by b.publishDate");
		books = query.getResultList();
		return books;	
	}
	
	@Override
	@Transactional
	public List<Integer> readFavoriteBookIds(int id) {
		List<Integer> ids;
		Session session = sessionFactory.getCurrentSession();
		Query query;
		query = session.createSQLQuery("select fk_book from online_library.favorite_books where fk_user = :id").setParameter("id",id);
		ids = query.getResultList();
		return ids;
	}
	
	@Override
	@Transactional
	public List<Book> readPublishedBooks(int id){
		List<Book> result;
		Session session = sessionFactory.getCurrentSession();
		Query query;
		query = session.createQuery("from Book b where b.publisherId = :id").setParameter("id",id);
		result = query.getResultList();
		return result;
	}

	@Override
	@Transactional
	public void updateModify(int id,int status) {
	Session session = sessionFactory.getCurrentSession();
	Query query = session.createQuery("update Book b set b.isModified=:modified where b.id = :id").setParameter("modified",status).setParameter("id",id);
	query.executeUpdate();
	}

	@Override
	@Transactional
	public List<Book> readBooksByCategory(String category) {
		List<Book> books;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book b where b.category = :category").setParameter("category",category);
		books = query.getResultList();
		return books;
	}

}
