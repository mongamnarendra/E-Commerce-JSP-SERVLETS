package com.example.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logoutservlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // fetch existing session if exists
        if (session != null) {
            session.invalidate(); 
        }
        response.sendRedirect("login.jsp"); // redirect to login page
    }
}
