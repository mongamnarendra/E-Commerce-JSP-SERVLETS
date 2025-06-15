package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.User;
import com.example.dbconnection.ProductDb;

public class AuthenticationDao {
	
	public static boolean login(String email,String password) throws SQLException {
		boolean isLoggedIn=false;
		
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("select * from users where userEmail=? AND userPassword=?");
		psmt.setString(1, email);
		psmt.setString(2, password);
		ResultSet rs = psmt.executeQuery();
		if(rs.next()) {
			isLoggedIn=true;
		}
		return isLoggedIn;
	}
	
	public static boolean signUp(User user) throws SQLException {
		boolean isSignUp=false;
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("insert into users(userName,userEmail,userPassword) values(?,?,?)");
		psmt.setString(1, user.getUserName());
		psmt.setString(2, user.getUserEmail());
		psmt.setString(3, user.getPassword());
		
		isSignUp = psmt.executeUpdate() >0;
		
		return isSignUp;
	}
}
