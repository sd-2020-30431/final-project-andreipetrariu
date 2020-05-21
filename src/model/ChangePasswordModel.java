package model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ChangePasswordModel {
	
	@NotNull
	@Size(min=1,max=30,message="-required field")
	private String oldPassword;
	
	@NotNull
	@Size(min=1,max=30,message="-required field")
	private String newPassword;
	
	public ChangePasswordModel() {
	}
	
	public ChangePasswordModel(String oldPassword, String newPassword) {
		super();
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
}
