<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.ecommerce.model.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ecommerce | Home</title>
<style>
    nav { background: #f8f8f8; padding: 10px; }
    section { display: flex; flex-wrap: wrap; gap: 20px; padding: 20px; }
    .product-card { border: 1px solid #ddd; padding: 10px; width: 200px; border-radius: 5px; }
</style>
</head>
<body>
<nav>
    <h1>EKart</h1>
    <input type="text" name="search" placeholder="search item">
    <button>User</button>
</nav>

<section>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if(products != null && !products.isEmpty()) {
            for(Product p : products) {
    %>
                <div class="product-card">
                    <h3><%= p.getProductName() %></h3>
                    <p>Price: ₹<%= p.getProductPrice() %></p>
                    <p><%= p.getProductDesc() %></p>
                </div>
    <%
            }
        } else {
    %>
            <p>No products found.</p>
    <%
        }
    %>
</section>

</body>
</html>
