package com.ecommerce.model;

public class User {
	
	private int id;
	private String userName;
	private String userEmail;
	private String Password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public User(int id, String userName, String userEmail, String password) {
		super();
		this.id = id;
		this.userName = userName;
		this.userEmail = userEmail;
		Password = password;
	}
	
	public User() {
		
	}

}
