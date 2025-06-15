<%@page import="com.ecommerce.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Product</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #1e1e2f, #252537);
        font-family: 'Poppins', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: #eaeaea;
    }

    .form-container {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(8px);
        padding: 2rem 3rem;
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
        border: 1px solid rgba(255, 255, 255, 0.18);
        width: 90%;
        max-width: 500px;
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 1.5rem;
        color: #00ffe7;
        text-shadow: 0 0 10px #00ffe7aa;
    }

    .form-group {
        margin-bottom: 1.2rem;
    }

    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 0.8rem 1rem;
        border: none;
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.1);
        color: #fff;
        font-size: 1rem;
        outline: none;
    }

    .form-group input[type="file"] {
        padding: 0.4rem 0.6rem;
    }

    .preview-img {
        width: 100%;
        max-width: 200px;
        height: auto;
        display: block;
        margin: 1rem auto;
        border-radius: 10px;
        box-shadow: 0 0 15px #00ffe7aa;
    }

    .btn-submit {
        width: 100%;
        padding: 0.8rem;
        background: transparent;
        color: #00ffe7;
        border: 2px solid #00ffe7;
        border-radius: 30px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s ease;
        box-shadow: 0 0 10px #00ffe7aa;
    }

    .btn-submit:hover {
        background: #00ffe7;
        color: #1e1e2f;
        box-shadow: 0 0 20px #00ffe7;
    }
</style>
</head>
<body>

<%
    Product p = (Product)request.getAttribute("product");
    if(p == null) {
%>
    <p style="color: #ff6b6b; font-size: 1.2rem;">No product found to update.</p>
<%
    } else {
%>

<div class="form-container">
    <h2>Update Product</h2>
    <form action="UpdateServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="<%= p.getId() %>">

        <div class="form-group">
            <label>Product Name:</label>
            <input type="text" name="productName" value="<%= p.getProductName() %>" required>
        </div>

        <div class="form-group">
            <label>Product Price:</label>
            <input type="text" name="productPrice" value="<%= p.getProductPrice() %>" required>
        </div>

        <div class="form-group">
            <label>Product Description:</label>
            <textarea name="productDesc" rows="4" required><%= p.getProductDesc() %></textarea>
        </div>

        <div class="form-group">
            <label>Current Product Image:</label>
            <img src="<%= p.getProductImage() %>" alt="Current Image" class="preview-img">
        </div>

        <div class="form-group">
            <label>Upload New Image:</label>
            <input type="file" name="productImage" accept="image/*" onchange="previewImage(event)">
        </div>

        <img id="newPreview" class="preview-img" style="display:none;">

        <button type="submit" class="btn-submit">Update Product</button>
    </form>
</div>

<script>
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function(){
            const output = document.getElementById('newPreview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<%
    }
%>

</body>
</html>
