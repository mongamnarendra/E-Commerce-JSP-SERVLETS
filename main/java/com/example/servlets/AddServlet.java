package com.example.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;


@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) {
		Product ps = new Product();
		ps.setProductName(req.getParameter("productName"));
		ps.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
		ps.setProductDesc(req.getParameter("productDesc"));
		
		if(ps!=null) {
			ProductDao pd= new ProductDao();
			try {
				pd.addProduct(ps);
				res.sendRedirect("index.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
