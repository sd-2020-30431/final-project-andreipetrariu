package dao;

import java.util.List;
import model.Book;

public interface IBookDAO {
	public Book readBook(int id);
	public List<Book> readBooks();
	public List<Integer> readFavoriteBookIds(int id);
	public List<Book> readPublishedBooks(int id);
	public void updateModify(int id, int status);
	public List<Book> readBooksByCategory(String parameter);
}
