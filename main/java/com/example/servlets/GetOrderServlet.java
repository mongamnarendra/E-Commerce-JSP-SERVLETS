package com.example.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.example.dao.OrderDao;
import com.example.dao.ProductDao;
import com.ecommerce.model.Order;
import com.ecommerce.model.Product;

@WebServlet("/userorders")
public class GetOrderServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get user ID from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // assuming 'userId' stored in session

        if (userId != null) {
            try {
                // Get user's orders
                List<Order> orders = OrderDao.getOrdersByUser(userId);

                // Fetch product details for each order (to get image, name, price)
                List<Product> products = new ArrayList<>();
                ProductDao pdao = new ProductDao();
                for (Order o : orders) {
                    Product p = pdao.getById(o.getProductId());
                    if (p != null) {
                        products.add(p);
                    } else {
                        // If product not found, add a dummy product or handle gracefully
                        products.add(new Product()); // you may create a Product constructor with empty fields
                    }
                }

                // Debug logs
                if (!orders.isEmpty()) {
                    System.out.println("First Order: " + orders.get(0));
                }
                
                // Set orders and their corresponding products to request
                request.setAttribute("orders", orders);
                request.setAttribute("products", products);

                // Forward to JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("user-orders.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Unable to fetch orders. Please try again later.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // User not logged in
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
