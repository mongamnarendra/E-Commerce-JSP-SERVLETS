package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.model.Order;
import com.example.dbconnection.ProductDb;

public class OrderDao {

   

    // Method to insert an order into the database
    public static boolean addOrder(Order order) {
    	Connection conn = ProductDb.getConnection();
        boolean success = false;
        String sql = "INSERT INTO orders (productId, quantity, payment, userId, address) VALUES (?, ?, ?, ?, ?)";
        System.out.println(order.getAddress());
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, order.getProductId());
            ps.setInt(2, order.getQuantity());
            ps.setString(3, order.getPayment());
            ps.setInt(4, order.getUserId());
            ps.setString(5, order.getAddress());
            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public static List<Order> getOrdersByUser(int userId) {
    	Connection conn = ProductDb.getConnection();
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userId = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("orderId"));
                order.setProductId(rs.getInt("productId"));
                order.setQuantity(rs.getInt("quantity"));
                order.setPayment(rs.getString("payment"));
                order.setUserId(rs.getInt("userId"));
                order.setAddress(rs.getString("address"));
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderList;
    }

    // Optional: Delete an order (if needed)
    public boolean deleteOrder(int orderId) {
    	Connection conn = ProductDb.getConnection();
        boolean success = false;
        String sql = "DELETE FROM orders WHERE order_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

}
