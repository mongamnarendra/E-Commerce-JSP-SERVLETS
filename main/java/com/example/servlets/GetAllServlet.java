package com.example.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;


@WebServlet("/GetAllServlet")
public class GetAllServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            List<Product> ls = ProductDao.getAllProducts();
            
            req.setAttribute("data", ls);
            RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
            rd.forward(req, res);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
