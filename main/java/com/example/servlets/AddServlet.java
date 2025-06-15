package com.example.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;

@WebServlet("/AddServlet")
@MultipartConfig   // Important: to handle file uploads
public class AddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            // Get form fields
            String productName = req.getParameter("productName");
            int productPrice = Integer.parseInt(req.getParameter("productPrice"));
            String productDesc = req.getParameter("productDesc");

            // Get the uploaded file part
            Part filePart = req.getPart("productImage");
            String fileName = filePart.getSubmittedFileName();

            // Set the upload path
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // create uploads folder if not exists
            }

            // Save the file on server
            String filePath = uploadPath + File.separator + fileName;
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, new File(filePath).toPath());
            }

            // Prepare Product object
            Product ps = new Product();
            ps.setProductName(productName);
            ps.setProductPrice(productPrice);
            ps.setProductDesc(productDesc);
            ps.setProductImage("uploads/" + fileName); // relative path to access later in JSP

            // Save Product to DB
            ProductDao pd = new ProductDao();
            pd.addProduct(ps);

            // Redirect to home page
            res.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
