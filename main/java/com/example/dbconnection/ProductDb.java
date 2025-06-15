package com.example.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProductDb {
	private static Connection con;
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ecommerce(jsp)","root","root");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
}
