package dao;

import org.springframework.stereotype.Repository;

import model.User;

public interface IUserDAO {
	public void register(User user);
	public User readOfflineUser(String username, String password);
	public void updateStatus(String username, int status);
	public int readUserId(String username);
	public boolean checkPassword(String username, String password);
	public void updatePassword(String parameter, String newPassword);
}
