package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.ProductDao;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		boolean isDeleted = false;
		try {
			isDeleted = ProductDao.deleteProduct(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isDeleted) {
			res.sendRedirect("index.jsp");
		}
		else {
			System.out.println("error");
		}
		
	}
}
