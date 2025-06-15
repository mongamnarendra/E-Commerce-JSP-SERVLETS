package com.example.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.User;
import com.example.dao.AuthenticationDao;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		User user = new User();
		user.setUserName(req.getParameter("name"));
		user.setUserEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		boolean signInStatus=false;
		try {
			signInStatus = AuthenticationDao.signUp(user);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		if(signInStatus) {
			res.sendRedirect("login.jsp");
		}
		else {
			System.out.println("error");
		}
		
	}
	
}
