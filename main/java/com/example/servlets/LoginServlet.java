package com.example.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Product;
import com.example.dao.AuthenticationDao;
import com.example.dao.ProductDao;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		boolean loginStatus = false;
		try {
			loginStatus = AuthenticationDao.login(email, password);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		if(loginStatus) {
			HttpSession session = req.getSession();
			int userId=0;
			try {
				userId = ProductDao.getByEmail(email);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error");
			}
			
			session.setAttribute("userId", userId);
			 res.sendRedirect("homeservlet");
		}
		else {
			System.out.println(loginStatus);
			res.sendRedirect("login.jsp");
		}
		
	}
}
