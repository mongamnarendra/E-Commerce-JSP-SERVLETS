<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Ecommerce Admin Panel</title>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(145deg, #1e1e2f, #252537);
    color: #eaeaea;
    min-height: 100vh;
    display: flex;
  }

  /* Sidebar */
  .sidebar {
    width: 220px;
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(6px);
    border-right: 1px solid rgba(255,255,255,0.1);
    box-shadow: 4px 0 12px rgba(0, 0, 0, 0.3);
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
    font-size: 1.5rem;
    text-shadow: 0 0 10px #00ffe7aa;
  }

  .sidebar a {
    text-decoration: none;
    color: #eaeaea;
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
    flex: 1;
    padding: 2rem;
  }

  header {
    width: 100%;
    padding: 1rem 0;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(8px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    border-radius: 12px;
    text-align: center;
    margin-bottom: 2rem;
  }

  header h1 {
    font-size: 2rem;
    color: #00ffe7;
    letter-spacing: 1px;
  }

  .btn-add {
    display: inline-block;
    margin-bottom: 1rem;
    padding: 0.7rem 1.5rem;
    background: transparent;
    color: #00ffe7;
    border: 2px solid #00ffe7;
    border-radius: 30px;
    text-decoration: none;
    transition: 0.3s ease;
    box-shadow: 0 0 10px #00ffe7aa;
  }

  .btn-add:hover {
    background: #00ffe7;
    color: #1e1e2f;
    box-shadow: 0 0 20px #00ffe7;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.05);
    box-shadow: 0 0 15px rgba(0,0,0,0.5);
    border-radius: 10px;
    overflow: hidden;
  }

  thead {
    background: #00ffe7;
    color: #1e1e2f;
  }

  thead th {
    padding: 1rem;
    text-transform: uppercase;
  }

  tbody tr {
    transition: background 0.3s ease;
  }

  tbody tr:hover {
    background: rgba(0, 255, 231, 0.05);
  }

  tbody td {
    padding: 1rem;
    text-align: center;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  }

  tbody td a {
    padding: 0.4rem 1rem;
    color: #00ffe7;
    border: 1px solid #00ffe7;
    border-radius: 20px;
    text-decoration: none;
    transition: 0.3s ease;
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
      padding: 1rem 0;
      position: fixed;
      bottom: 0;
      left: 0;
      border-right: none;
      border-top: 1px solid rgba(255,255,255,0.1);
    }

    .sidebar h2 { display: none; }

    .main-content {
      margin-left: 0;
      padding: 1rem;
      padding-bottom: 5rem; /* space for mobile navbar */
    }

    header h1 {
      font-size: 1.5rem;
    }
     tbody td a {
      margin-bottom: 15rem;
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
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <%
        List<Product> products = (List<Product>) request.getAttribute("data");
        if(products != null && !products.isEmpty()) {
          for(Product p : products) {
      %>
        <tr>
          <td><%= p.getId() %></td>
          <td><%= p.getProductName() %></td>
          <td><%= p.getProductPrice() %></td>
          <td><%= p.getProductDesc() %></td>
          <td>
            <a href="UpdateServlet?id=<%=p.getId()%>">Update</a>
            <a href="DeleteServlet?id=<%=p.getId()%>">Delete</a>
          </td>
        </tr>
      <%
          }
        } else {
      %>
        <tr>
          <td colspan="5" class="no-data">No products available.</td>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>

</div>

</body>
</html>
