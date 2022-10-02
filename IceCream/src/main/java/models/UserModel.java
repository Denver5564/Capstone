package models;

import java.util.Date;

public class UserModel {
	private int id, Usertype, FirstLogin, JoinedDate;
	private String Username, Password, email, OldPassword;
	private Date SqlDate;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUsertype() {
		return Usertype;
	}
	
	public void setUsertype(int usertype) {
		Usertype = usertype;
	}
	
	public int getFirstLogin() {
		return FirstLogin;
	}
	
	public void setFirstLogin(int firstLogin) {
		FirstLogin = firstLogin;
	}
	
	public String getUsername() {
		return Username;
	}
	
	public void setUsername(String username) {
		Username = username;
	}
	
	public String getPassword() {
		return Password;
	}
	
	public void setPassword(String password) {
		Password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getOldPassword() {
		return OldPassword;
	}
	
	public void setOldPassword(String oldPassword) {
		OldPassword = oldPassword;
	}
	
	public Date getSqlDate() {
		return SqlDate;
	}
	
	public void setSqlDate(Date sqlDate) {
		SqlDate = sqlDate;
	}

	public int getJoinedDate() {
		return JoinedDate;
	}

	public void setJoinedDate(int joinedDate) {
		JoinedDate = joinedDate;
	}
}
