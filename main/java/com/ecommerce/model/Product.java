package com.ecommerce.model;

public class Product {
    
    private int id;
    private String productName;
    private int productPrice;
    private String productDesc;
    private String productImage; // New field: image URL or path

    // Getters and Setters for image
    public String getProductImage() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    // Existing Getters and Setters...
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

    // Constructor with Image
    public Product(int id, String productName, int productPrice, String productDesc, String productImage) {
        super();
        this.id = id;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDesc = productDesc;
        this.productImage = productImage;
    }

    // Default Constructor
    public Product() { }
}
