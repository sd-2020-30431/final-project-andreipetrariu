package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.IUserDAO;
import model.User;

@Controller
public class OLController {
	
	@Autowired
	private IUserDAO userDAO;
	
	@RequestMapping("/")
	public String showHomePage() {
		return "home-guest";
	}
	@RequestMapping("/login")
	public String showLoginPage(Model theModel) {
		User theUser = new User();
		theModel.addAttribute("user",theUser);
		theModel.addAttribute("registerMessage",new String());
		theModel.addAttribute("usernameError",new String());
		theModel.addAttribute("passwordError",new String());
		return "login";
	}
	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam String login, Model theModel,
			@ModelAttribute("user") User user) {
		if(user.getUsername().strip().length()<1 || user.getPassword().strip().length()<1) {
			if(user.getUsername().strip().length()<1)
				theModel.addAttribute("usernameError",new String("required field"));
			if(user.getPassword().strip().length()<1)
				theModel.addAttribute("passwordError",new String("required field"));
		}
		else {
			if(login.contains("Login")) {
				if(userDAO.readUser(user.getUsername(),user.getPassword())!=null) {
					userDAO.updateStatus(user.getUsername());
					return "home";
				}
			}
			else if(login.contains("Register")) {
				if(userDAO.readUser(user.getUsername(),user.getPassword()) == null) {
					userDAO.register(user);
					theModel.addAttribute("registerMessage",new String("Registration successful!"));
				}
				return "login";
			}
		}
		return "login";
	}
}
