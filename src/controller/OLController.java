package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import dao.IBookDAO;
import dao.ICommentDAO;
import dao.IUserDAO;
import model.Book;
import model.BookText;
import model.ChangePasswordModel;
import model.Comment;
import model.UploadBookModel;
import model.User;

@Controller
public class OLController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private IUserDAO userDAO;
	
	@Autowired
	private IBookDAO bookDAO;
	
	@Autowired
	private ICommentDAO commentDAO;
	
	@RequestMapping("/")
	public RedirectView showHomePage(HttpServletRequest request,Model theModel) {
		if(request.getParameter("user")!=null)
			return new RedirectView("/home",true);
		return new RedirectView("/login",true);
	}
	
	@RequestMapping("/login")
	public String showLoginPage(Model theModel){
		User theUser = new User();
		theModel.addAttribute("user",theUser);
		theModel.addAttribute("registerMessage",new String());
		theModel.addAttribute("usernameError",new String());
		theModel.addAttribute("passwordError",new String());
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		userDAO.updateStatus(request.getParameter("user"),0);
		return "redirect:/";
	}
	
	@PostMapping("/loginForm")
	public RedirectView loginForm(@RequestParam String login, Model theModel,
			@ModelAttribute("user") User user, RedirectAttributes redir) {
		if(user.getUsername().strip().length()<1 || user.getPassword().strip().length()<1) {
			if(user.getUsername().strip().length()<1)
				theModel.addAttribute("usernameError",new String("required field"));
			if(user.getPassword().strip().length()<1)
				theModel.addAttribute("passwordError",new String("required field"));
		}
		else {
			if(login.contains("Login")) {
				if(userDAO.readOfflineUser(user.getUsername(),user.getPassword())!=null) {
					userDAO.updateStatus(user.getUsername(),1);
					theModel.addAttribute("user",user);
					RedirectView redirect= new RedirectView("/home?user="+user.getUsername()+"&category=recent",true);
				    return redirect;
				}
			}
			else if(login.contains("Register")) {
				if(userDAO.readOfflineUser(user.getUsername(),user.getPassword()) == null) {
					userDAO.register(user);
					theModel.addAttribute("registerMessage",new String("Registration successful!"));
				}
				RedirectView redirect= new RedirectView("/login",true);
			    return redirect;
			}
		}
		RedirectView redirect= new RedirectView("/login",true);
	    return redirect;
	}
	
	@GetMapping("/home")
	public void showHomeLoggedIn(HttpServletRequest request,Model theModel) {
		String username = request.getParameter("user");
		List<Book> books = null;
		if(request.getParameter("category")==null || request.getParameter("category").compareTo("recent")==0) {
			books = bookDAO.readBooks();
			theModel.addAttribute("section","Recent books");
		}
		else  { books = bookDAO.readBooksByCategory(request.getParameter("category"));
			theModel.addAttribute("section",request.getParameter("category"));
		}
		theModel.addAttribute("password",new ChangePasswordModel());
		theModel.addAttribute("books", books);
		theModel.addAttribute("username",username);
	}
	
	@PostMapping("/changePass")
	public String changePassword(HttpServletRequest request, @ModelAttribute("password") ChangePasswordModel changePassModel) {
		if(request.getParameter("user")==null) 
			return "redirect:/";
		if(userDAO.checkPassword(request.getParameter("user"), changePassModel.getOldPassword()))
			userDAO.updatePassword(request.getParameter("user"),changePassModel.getNewPassword());
		return "redirect:/home?user="+request.getParameter("user");
	}
	
	@GetMapping("/book")
	public String showBookPage(HttpServletRequest request, Model theModel) {
		Book theBook = bookDAO.readBook(Integer.parseInt(request.getParameter("id")));
		Comment inputComment = new Comment();
		inputComment.setPageId(theBook.getId());
		inputComment.setContent("");
		List<Comment> comments = commentDAO.readComments(theBook.getId());
		theModel.addAttribute("modifyErrorMsg",theModel.getAttribute("modifyErrorMsg"));
		theModel.addAttribute("username",request.getParameter("user"));
		theModel.addAttribute("bookName",theBook.getContentPath());
		theModel.addAttribute("id",theBook.getId());
		theModel.addAttribute("comment",inputComment);
		theModel.addAttribute("comments",comments);
		
		String bookText = "";
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(servletContext.getRealPath("/books")+"/"+theBook.getContentPath()+".txt"));
		
        while(br.ready()) {
         	bookText+=br.readLine();
         	bookText+="\n";
        }
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        theModel.addAttribute("bookText",new BookText(theBook.getId(),bookText));
        theModel.addAttribute("theBookText",new BookText());
		/*InputStream inputStream = null;
        try {
            inputStream = servletContext.getResourceAsStream("/books/sample-book.txt");
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            String bookText = new String();
            while(bufferedReader.ready()) {
            	bookText+=bufferedReader.readLine();
            	bookText+="\n";
            }
            bufferedReader.close();
            theModel.addAttribute("bookText",new BookText(theBook.getId(),bookText));
        } catch (IOException e) {
			e.printStackTrace();
		}
        finally {
				try {
		        	if(inputStream!=null)
		        		inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
        }*/
		return "book";
	}
	
	@GetMapping("/editor")
	public String showEditor(HttpServletRequest request,@ModelAttribute("bookText") String text,Model theModel) {
		if(!text.isEmpty()) {
			theModel.addAttribute("username",request.getParameter("user"));
			theModel.addAttribute("text",text);
			theModel.addAttribute("id",request.getParameter("id"));
			theModel.addAttribute("bookText",new BookText(Integer.parseInt(request.getParameter("id")),text));
			return "editor";
		}
		else return "redirect:/book?user="+request.getParameter("user")+"&id="+request.getParameter("id");
	}
	
	@PostMapping("/attemptModify")
	public RedirectView attemptModifyBook(HttpServletRequest request, @ModelAttribute("theBookText") BookText aBookText,
			RedirectAttributes redir) {
		if(bookDAO.readBook(aBookText.getId()).getIsModified()==0) {
			bookDAO.updateModify(aBookText.getId(),1);
			RedirectView redirect = new RedirectView("/online-library/editor?user="+request.getParameter("user")+"&id="+aBookText.getId());
			redir.addFlashAttribute("bookText",aBookText.getText());
			return redirect;
		}
		else {
			RedirectView redirect = new RedirectView("/book?user="+request.getParameter("user")+"&id="+aBookText.getId(),true);
			redir.addFlashAttribute("modifyErrorMsg",new String("Can't modify the book because someone else is modifying it now!"));
			return redirect;
		}
	}
	
	@PostMapping("/modify")
	public String modifyBook(HttpServletRequest request,@RequestParam String editorAction ,@ModelAttribute("bookText") BookText aBookText, Model theModel) {
		bookDAO.updateModify(aBookText.getId(),0);
		if(editorAction.compareTo("Write")==0) {
			String path = servletContext.getRealPath("/books");
			String contentPath = bookDAO.readBook(aBookText.getId()).getContentPath();
			path+="/"+contentPath+".txt";
			try {
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path));
				bos.write(aBookText.getText().getBytes());
				bos.flush();
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return "redirect:/book?user="+request.getParameter("user")+"&id="+aBookText.getId();
		}
		else 
			return "redirect:/book?user="+request.getParameter("user")+"&id="+aBookText.getId();
	}
	
	@PostMapping("/comment")
	public String postComment(@ModelAttribute("comment") Comment theComment, Model theModel) {
		theComment.setPostDate(new Date());
		theComment.setLikes(0);
		theComment.setDislikes(0);
		theComment.setUsername((String)theModel.getAttribute("user"));
		commentDAO.createComment(theComment);
		return "redirect:/book?id="+theComment.getPageId();
	}
	
	@GetMapping("/profile")
	public String getProfilePage(HttpServletRequest request, Model theModel) {
		theModel.addAttribute("username",request.getParameter("user"));
		theModel.addAttribute("uploadForm", new UploadBookModel());
		theModel.addAttribute("uploadErrorMsg",new String());
		
		int userId = userDAO.readUserId(request.getParameter("user"));
		List<Integer> ids = bookDAO.readFavoriteBookIds(userId);
		List<Book> favoriteBooks = new ArrayList<Book>();
		for(Integer i : ids) {
			Book theBook = bookDAO.readBook(i);
			favoriteBooks.add(theBook);
		}
		
		List<Book> publishedBooks = bookDAO.readPublishedBooks(userId);
		
		theModel.addAttribute("favoriteBooks",favoriteBooks);
		theModel.addAttribute("publishedBooks", publishedBooks);
		return "profile";
	}
	
	@PostMapping("/uploadFile")
	public String uploadFile(HttpServletRequest request,Model theModel,@Valid @ModelAttribute("uploadForm") UploadBookModel bookModel, BindingResult bResult ) {
		theModel.addAttribute("username",request.getParameter("user"));
		if(bResult.hasErrors()) {
			theModel.addAttribute("uploadErrorMsg",new String("There were errors uploading the file!"));
			return "profile";
		}
		if(bookModel.getBookFile().getOriginalFilename()=="") {
			theModel.addAttribute("uploadErrorMsg",new String("No file was selected!"));
			return "profile";
		}
		String path = servletContext.getRealPath("/books");
		Book theBook = new Book();
		String contentPath = bookModel.getBookFile().getOriginalFilename();
		theBook.setBookName(bookModel.getBookName());
		theBook.setContentPath(contentPath.substring(0,contentPath.length()-4));
		theBook.setCategory(bookModel.getCategory());
		if(bookModel.getPermission().contains("write"))
			theBook.setPermission(1);
		else theBook.setPermission(0);
		System.out.println("\n\nBOOK NAME="+bookModel.getBookFile().getOriginalFilename()+"\n\n\n");
		theBook.setPublisherId(userDAO.readUserId(request.getParameter("user")));
		theBook.setPublishDate(new Date());
		
		path+="/"+bookModel.getBookFile().getOriginalFilename();
		byte[] fileBytes = bookModel.getBookFile().getBytes();
		try {
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path));
			bos.write(fileBytes);
			bos.flush();
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:/profile";
	}
	
	@GetMapping("/uploadFile")
	public String uploadFileRedirect(HttpServletRequest request) {
		return "redirect:/profile?user="+request.getParameter("user");
	}
}
