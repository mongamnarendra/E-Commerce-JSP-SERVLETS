<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Panel - Ecommerce</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #1e1e2f, #252537);
    color: #eaeaea;
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 220px;
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(6px);
    box-shadow: 4px 0 12px rgba(0,0,0,0.4);
    padding: 2rem 1rem;
    position: fixed;
    height: 100%;
    display: flex;
    flex-direction: column;
    gap: 2rem;
}

.sidebar h2 {
    color: #00ffe7;
    text-align: center;
    font-size: 1.8rem;
    text-shadow: 0 0 10px #00ffe7aa;
}

.sidebar a {
    color: #eaeaea;
    text-decoration: none;
    padding: 0.7rem 1rem;
    border-radius: 10px;
    transition: background 0.3s ease;
    font-weight: 500;
}

.sidebar a:hover {
    background: rgba(0, 255, 231, 0.1);
}

/* Main content */
.main-content {
    margin-left: 240px;
    padding: 2rem;
    width: calc(100% - 240px);
}

header {
    text-align: center;
    padding: 1rem 0;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(8px);
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
    margin-bottom: 2rem;
}

header h1 {
    color: #00ffe7;
    font-size: 2rem;
}

/* Add Product Button */
.btn-add {
    display: inline-block;
    margin-bottom: 1rem;
    padding: 0.6rem 1.4rem;
    background: transparent;
    color: #00ffe7;
    border: 2px solid #00ffe7;
    border-radius: 30px;
    text-decoration: none;
    transition: 0.3s;
    box-shadow: 0 0 8px #00ffe7aa;
}

.btn-add:hover {
    background: #00ffe7;
    color: #1e1e2f;
}

/* Table */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
}

thead {
    background: #00ffe7;
    color: #1e1e2f;
    text-transform: uppercase;
}

thead th {
    padding: 1rem;
    text-align: center;
    border-radius: 8px 8px 0 0;
}

tbody tr {
    background: rgba(255, 255, 255, 0.03);
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    border-radius: 8px;
    transition: transform 0.2s ease;
}

tbody tr:hover {
    transform: scale(1.01);
}

tbody td {
    padding: 1rem;
    text-align: center;
}

tbody td img {
    border-radius: 8px;
    max-width: 80px;
    height: auto;
}

tbody td a {
    display: inline-block;
    padding: 0.4rem 1rem;
    margin: 0 0.3rem;
    color: #00ffe7;
    border: 1px solid #00ffe7;
    border-radius: 20px;
    text-decoration: none;
    transition: 0.3s;
}

tbody td a:hover {
    background: #00ffe7;
    color: #1e1e2f;
}

.no-data {
    padding: 2rem;
    text-align: center;
    color: #bbb;
}

/* Responsive */
@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: auto;
        flex-direction: row;
        justify-content: space-around;
        position: fixed;
        bottom: 0;
        left: 0;
        padding: 1rem 0;
        border-top: 1px solid rgba(255,255,255,0.1);
    }

    .sidebar h2 {
        display: none;
    }

    .main-content {
        margin-left: 0;
        width: 100%;
        padding: 1rem;
        padding-bottom: 6rem;
    }

    header h1 {
        font-size: 1.5rem;
    }

    table, thead, tbody, th, td, tr {
        display: block;
    }

    thead {
        display: none;
    }

    tbody tr {
        margin-bottom: 1rem;
        box-shadow: none;
        background: transparent;
    }

    tbody td {
        text-align: right;
        position: relative;
        padding-left: 50%;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    tbody td:before {
        content: attr(data-label);
        position: absolute;
        left: 0;
        width: 45%;
        padding-left: 1rem;
        font-weight: bold;
        color: #00ffe7;
        text-align: left;
    }
}
</style>
</head>
<body>

<div class="sidebar">
    <h2>Admin</h2>
    <a href="index.jsp">Dashboard</a>
    <a href="orders.jsp">Orders</a>
    <a href="customers.jsp">Customers</a>
    <a href="#">Logout</a>
</div>

<div class="main-content">
    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <a href="addProduct.jsp" class="btn-add">+ Add Product</a>

    <table>
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Product Description</th>
                <th>Product Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> products = (List<Product>) request.getAttribute("data");
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
            %>
            <tr>
                <td data-label="Product Id"><%=p.getId()%></td>
                <td data-label="Product Name"><%=p.getProductName()%></td>
                <td data-label="Product Price"><%=p.getProductPrice()%></td>
                <td data-label="Description"><%=p.getProductDesc()%></td>
                <td data-label="Image">
                    <img src="<%=p.getProductImage()%>" alt="Product Image">
                </td>
                <td data-label="Actions">
                    <a href="UpdateServlet?id=<%=p.getId()%>">Update</a>
                    <a href="DeleteServlet?id=<%=p.getId()%>">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6" class="no-data">No products available.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
