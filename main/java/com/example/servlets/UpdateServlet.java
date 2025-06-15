package com.example.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.example.dao.ProductDao;

@WebServlet("/UpdateServlet")
@MultipartConfig // this allows file upload handling
public class UpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Product product = ProductDao.getById(id);
            req.setAttribute("product", product);
            RequestDispatcher rd = req.getRequestDispatcher("updateProduct.jsp");
            rd.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("productId"));
            String name = req.getParameter("productName");
            int price = Integer.parseInt(req.getParameter("productPrice"));
            String desc = req.getParameter("productDesc");

            // File upload handling
            Part filePart = req.getPart("productImage"); // from form name
            String fileName = filePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") + "product_images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String imagePath = "product_images/" + fileName;

            // Save file if a new file is uploaded
            if(fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadPath + File.separator + fileName);
            } else {
                // If no new file, retain old image
                Product existingProduct = ProductDao.getById(id);
                imagePath = existingProduct.getProductImage();
            }

            // Populate product
            Product product = new Product();
            product.setId(id);
            product.setProductName(name);
            product.setProductPrice(price);
            product.setProductDesc(desc);
            product.setProductImage(imagePath); // important

            ProductDao.updateProduct(product);

            res.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
