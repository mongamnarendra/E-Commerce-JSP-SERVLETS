package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.model.Product;
import com.example.dbconnection.ProductDb;

public class ProductDao {
    
    public void addProduct(Product product) throws Exception {
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement(
            "INSERT INTO product(productName, productPrice, productDesc, productImage) VALUES (?, ?, ?, ?)"
        );
        psmt.setString(1, product.getProductName());
        psmt.setInt(2, product.getProductPrice());
        psmt.setString(3, product.getProductDesc());
        psmt.setString(4, product.getProductImage());

        psmt.executeUpdate();
    }
    
    public static List<Product> getAllProducts() throws Exception {
        List<Product> ls = new ArrayList<>();
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT * FROM product");
        ResultSet rs = psmt.executeQuery();
        
        while(rs.next()) {
            Product ps = new Product();
            ps.setId(rs.getInt("id"));
            ps.setProductName(rs.getString("productName"));
            ps.setProductPrice(rs.getInt("productPrice"));
            ps.setProductDesc(rs.getString("productDesc"));
            ps.setProductImage(rs.getString("productImage"));
            ls.add(ps);
        }
        return ls;
    }
    
    public static Product getById(int id) throws Exception {
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT * FROM product WHERE id = ?");
        psmt.setInt(1, id);
        ResultSet rs = psmt.executeQuery();
        Product ps = new Product();
        if(rs.next()) {
            ps.setId(rs.getInt("id"));
            ps.setProductName(rs.getString("productName"));
            ps.setProductPrice(rs.getInt("productPrice"));
            ps.setProductDesc(rs.getString("productDesc"));
            ps.setProductImage(rs.getString("productImage"));
        }
        return ps;
    }
    
    public static boolean deleteProduct(int id) throws Exception {
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement("DELETE FROM product WHERE id = ?");
        psmt.setInt(1, id);
        int effectedRows = psmt.executeUpdate();
        return effectedRows != 0;
    }
    
    public static boolean updateProduct(Product product) throws Exception {
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement(
            "UPDATE product SET productName=?, productPrice=?, productDesc=?, productImage=? WHERE id=?"
        );
        psmt.setString(1, product.getProductName());
        psmt.setInt(2, product.getProductPrice());
        psmt.setString(3, product.getProductDesc());
        psmt.setString(4, product.getProductImage());
        psmt.setInt(5, product.getId());
        return psmt.executeUpdate() > 0;
    }
    
    public static int getByEmail(String email) throws SQLException {
        Connection con = ProductDb.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT id FROM users WHERE userEmail = ?");
        psmt.setString(1, email);
        
        ResultSet rs = psmt.executeQuery();
        int userId = -1; // default if no user found

        if (rs.next()) {
            userId = rs.getInt("id"); // fetching the id column
        }
        
        return userId;
    }

}
