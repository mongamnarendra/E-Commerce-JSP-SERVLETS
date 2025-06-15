package com.ecommerce.model;

public class Order {
	
	private int orderId;
	private int productId;
	private int quantity;
	private String payment;
	private int userId;
	private String address;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Order(int orderId, int productId, int quantity, String payment, int userId, String address) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		this.payment = payment;
		this.userId = userId;
		this.address = address;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
		
	

}
