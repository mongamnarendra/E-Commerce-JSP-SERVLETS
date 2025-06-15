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
			session.setAttribute("userEmail", email);
			List<Product> productList;
			try {
				productList = ProductDao.getAllProducts();
				req.setAttribute("products", productList);
				req.getRequestDispatcher("home.jsp").forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else {
			System.out.println(loginStatus);
			res.sendRedirect("login.jsp");
		}
		
	}
}
