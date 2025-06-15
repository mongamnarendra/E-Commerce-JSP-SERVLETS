package com.example.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecommerce.model.Order;
import com.ecommerce.model.Product;
import com.example.dao.OrderDao;
import com.example.dao.ProductDao;
import com.example.dbconnection.ProductDb;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMode = request.getParameter("payment");
        String address = request.getParameter("address");
        double grandTotal = Double.parseDouble(request.getParameter("grandTotal"));

        // Get cart from session
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        

        Connection conn = ProductDb.getConnection();
        OrderDao orderDao = new OrderDao(conn);
        int userId=(int)session.getAttribute("userId");
        // Insert each cart item into 'orders' table
        if (cart != null && !cart.isEmpty()) {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();

                Order order = new Order();
                order.setProductId(productId);
                order.setQuantity(quantity);
                order.setPayment(paymentMode);
                order.setUserId(userId);
                order.setAddress(address);
                orderDao.addOrder(order);
            }
        }

        // After successful order, clear cart
        session.removeAttribute("cart");
        session.removeAttribute("cart-count");

        if ("COD".equals(paymentMode)) {
            request.setAttribute("message", "Order Placed Successfully! Pay ₹" + grandTotal + " on Delivery.");
            RequestDispatcher rd = request.getRequestDispatcher("payment-success.jsp");
            rd.forward(request, response);
        } else {
            // For simplicity, redirecting to Razorpay or Payment Gateway
            // In real scenario: after Razorpay callback, this DB code should run
            response.sendRedirect("https://razorpay.com"); // Replace with actual payment gateway link
        }
    }
}
