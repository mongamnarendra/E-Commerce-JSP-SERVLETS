package com.ecommerce.model;

public class Product {
	
	private int id;
	private String productName;
	private int productPrice;
	private String productDesc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public Product(int id, String productName, int productPrice, String productDesc) {
		super();
		this.id = id;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDesc = productDesc;
	}
	
	public Product() {
		
	}
	

}
