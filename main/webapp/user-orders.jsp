<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.ecommerce.model.Order, com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Orders</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #121212;
        color: #eaeaea;
        padding: 20px;
    }

    h2 {
        color: #00ffe7;
        text-align: center;
        margin-bottom: 30px;
    }

    .order-container {
        max-width: 600px;
        margin: 0 auto;
    }

    .order-item {
        display: flex;
        background: #1e1e2f;
        border: 1px solid #00ffe7;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .order-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 15px rgba(0, 255, 231, 0.4);
    }

    .order-item img {
        width: 140px;
        height: 140px;
        object-fit: contain;
        border-radius: 8px;
        background: #fff;
        padding: 10px;
        border: 1px solid #00ffe7;
        margin-right: 30px; /* clear space between image and details */
        flex-shrink: 0;
    }

    .order-details {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .order-details p {
        margin: 8px 0;
        font-size: 1rem;
        line-height: 1.4;
    }

    .order-details p strong {
        color: #00ffe7;
    }

    .back-btn {
        display: block;
        width: 200px;
        margin: 30px auto;
        padding: 10px 20px;
        background: #00ffe7;
        color: #000;
        border: none;
        border-radius: 6px;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        transition: background 0.3s;
    }

    .back-btn:hover {
        background: #00ccbb;
        color: #fff;
    }

    @media (max-width: 600px) {
        .order-item {
            flex-direction: column;
            text-align: center;
        }
        .order-item img {
            margin: 0 auto 15px;
        }
        .order-details {
            align-items: center;
        }
    }
</style>
</head>
<body>

<h2>Your Orders</h2>

<div class="order-container">
    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        List<Product> products = (List<Product>) request.getAttribute("products");

        if (orders != null && products != null && !orders.isEmpty()) {
            for (int i = 0; i < orders.size(); i++) {
                Order order = orders.get(i);
                Product product = products.get(i);
    %>
    <div class="order-item">
        <img src="<%= product.getProductImage() %>" alt="Product Image">
        <div class="order-details">
            <p><strong>Product:</strong> <%= product.getProductName() %></p>
            <p><strong>Quantity:</strong> <%= order.getQuantity() %></p>
            <p><strong>Price:</strong> ₹<%= product.getProductPrice() %></p>
            <p><strong>Address:</strong> <%= order.getAddress() %></p>
            <p><strong>Payment Type:</strong> <%= order.getPayment() %></p>
        </div>
    </div>
    <% 
            }
        } else { 
    %>
    <p style="text-align:center; color:#00ffe7;">You have no orders yet.</p>
    <% } %>
</div>

<a href="homeservlet" class="back-btn">Back to Home</a>

</body>
</html>
