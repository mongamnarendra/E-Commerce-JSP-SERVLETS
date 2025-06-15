package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.model.Product;
import com.example.dbconnection.ProductDb;

public class ProductDao {
	
	public void addProduct(Product product) throws Exception{
		Connection con=ProductDb.getConnection();
		PreparedStatement psmt=con.prepareStatement("Insert into product(productName, productPrice, productDesc) values(?,?,?)");
		psmt.setString(1, product.getProductName());
		psmt.setInt(2, product.getProductPrice());
		psmt.setString(3, product.getProductDesc());
		psmt.executeUpdate();
		
	}
	
	public static List<Product> getAllProducts() throws Exception{
		List<Product> ls= new ArrayList<>();
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("select * from product");
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()) {
			Product ps = new Product();
			ps.setId(rs.getInt("id"));
			ps.setProductName(rs.getString("productName"));
			ps.setProductPrice(rs.getInt("productPrice"));
			ps.setProductDesc(rs.getString("productDesc"));
			
			ls.add(ps);
		}
		return ls;
	}
	
	public static Product getById(int id) throws Exception{
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("select * from product where id = ?");
		psmt.setInt(1, id);
		ResultSet rs = psmt.executeQuery();
		Product ps = new Product();
		if(rs.next()) {
			ps.setId(rs.getInt("id"));
			ps.setProductName(rs.getString("productName"));
			ps.setProductPrice(rs.getInt("productPrice"));
			ps.setProductDesc(rs.getString("productDesc"));
		}
		return ps;
	}
	
	public static boolean deleteProduct(int id) throws Exception{
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("delete from product where id = ?");
		psmt.setInt(1, id);
		int effectedRows = psmt.executeUpdate();
		
		if(effectedRows!=0) {
			return true;
		}
		return false;
	}
	
	public static boolean updateProduct(Product product) throws Exception {
		Connection con = ProductDb.getConnection();
		PreparedStatement psmt = con.prepareStatement("UPDATE product SET productName=?, productPrice=?, productDesc=? WHERE id=?");
		psmt.setString(1, product.getProductName());
		psmt.setInt(2, product.getProductPrice());
		psmt.setString(3, product.getProductDesc());
		psmt.setInt(4, product.getId());
		boolean isUpdated = psmt.executeUpdate() >0;
		return isUpdated;
	}

}
