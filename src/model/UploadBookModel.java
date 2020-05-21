package model;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadBookModel {
	
	@NotNull
	@Size(min=1,max=30, message="-required field")
	private String bookName;
	@NotNull()
	@Size(min=1,max=30,message="-required field")
	private String category;
	private String permission;
	private CommonsMultipartFile bookFile;
	
	public UploadBookModel() {
	}
	
	public UploadBookModel(String bookName, String permission, CommonsMultipartFile bookFile) {
		super();
		this.bookName = bookName;
		this.permission = permission;
		this.bookFile = bookFile;
	}

	public String getBookName() {
		return bookName;
	}

	public String getPermission() {
		return permission;
	}

	public CommonsMultipartFile getBookFile() {
		return bookFile;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public void setBookFile(CommonsMultipartFile bookFile) {
		this.bookFile = bookFile;
	}

	public String getCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
}
