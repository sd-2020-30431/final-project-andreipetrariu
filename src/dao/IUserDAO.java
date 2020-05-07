package dao;

import org.springframework.stereotype.Repository;

import model.User;

public interface IUserDAO {
	public void register(User user);
	public User readUser(String username, String password);
	public void updateStatus(String username);
}
