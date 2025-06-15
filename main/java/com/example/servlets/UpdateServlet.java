package com.example.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			Product product = ProductDao.getById(id);
			req.setAttribute("product", product);
			RequestDispatcher rd= req.getRequestDispatcher("updateProduct.jsp");
			rd.forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {
		try {
            int id = Integer.parseInt(req.getParameter("productId")); // Hidden field in form
            String name = req.getParameter("productName");
            int price = Integer.parseInt(req.getParameter("productPrice"));
            String desc = req.getParameter("productDesc");

           

            Product product = new Product();
            product.setId(id);
            product.setProductName(name);
            product.setProductPrice(price);
            product.setProductDesc(desc);

            
            ProductDao.updateProduct(product);
           
            res.sendRedirect("index.jsp"); 

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}

