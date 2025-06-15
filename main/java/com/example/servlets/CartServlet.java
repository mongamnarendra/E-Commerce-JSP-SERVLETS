package com.example.servlets;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        switch(action) {
            case "add":
                cart.put(productId, cart.getOrDefault(productId, 0) + 1);
                break;

            case "increase":
                cart.put(productId, cart.getOrDefault(productId, 0) + 1);
                break;

            case "decrease":
                int quantity = cart.getOrDefault(productId, 0) - 1;
                if(quantity > 0) {
                    cart.put(productId, quantity);
                } else {
                    cart.remove(productId); // remove if zero
                }
                break;

            case "remove":
                cart.remove(productId);
                break;

            case "buy":
                // You can handle "buy now" logic here if required
                break;
        }

        // Update cart count for navbar
        int cartCount = cart.values().stream().mapToInt(Integer::intValue).sum();
        session.setAttribute("cart", cart);
        session.setAttribute("cart-count", cartCount);

        // Decide where to redirect
        String redirectPage = request.getHeader("Referer"); // go back to previous page
        response.sendRedirect(redirectPage != null ? redirectPage : "home.jsp");
    }
}
