package com.example.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;

@WebServlet("/homeservlet")
public class HomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Product> productList;
		try {
			productList = ProductDao.getAllProducts();
			req.setAttribute("products", productList);
			req.getRequestDispatcher("home.jsp").forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

