<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.ecommerce.model.Product"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>EKart | Home</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

body {
	margin: 0;
	padding: 0;
	background: linear-gradient(135deg, #1e1e2f, #252537);
	font-family: 'Poppins', sans-serif;
	min-height: 100vh;
	color: #eaeaea;
	display: flex;
	flex-direction: column;
}

nav {
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(8px);
	padding: 1rem 2rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 30px rgba(0, 255, 231, 0.3);
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

nav h1 {
	color: #00ffe7;
	text-shadow: 0 0 8px #00ffe7;
	font-size: 1.8rem;
}

nav .nav-buttons {
	display: flex;
	align-items: center;
	gap: 15px;
}

nav a, nav form button {
	padding: 0.5rem 1.2rem;
	background: transparent;
	color: #00ffe7;
	border: 2px solid #00ffe7;
	border-radius: 20px;
	cursor: pointer;
	font-weight: 600;
	box-shadow: 0 0 10px #00ffe7aa;
	text-decoration: none;
	transition: 0.3s ease;
	display: inline-block;
}

nav a:hover, nav form button:hover {
	background: #00ffe7;
	color: #1e1e2f;
	box-shadow: 0 0 20px #00ffe7;
}

section {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	padding: 2rem;
	justify-content: center;
	flex: 1;
}

.product-card {
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(8px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	border-radius: 20px;
	padding: 1rem;
	width: 250px;
	height: 350px;
	box-shadow: 0 4px 30px rgba(0, 255, 231, 0.2);
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	transition: 0.4s ease;
}

.product-card:hover {
	transform: scale(1.05);
	box-shadow: 0 0 20px #00ffe7;
}

.product-card img {
	width: 100%;
	height: 160px;
	object-fit: contain;
	border-radius: 10px;
	margin: 0 auto 10px auto;
}

.product-card h3 {
	color: #00ffe7;
	text-shadow: 0 0 5px #00ffe7aa;
	margin: 5px 0;
	min-height: 40px;
	overflow: hidden;
}

.product-card p {
	margin: 2px 0;
	color: #e0e0e0;
	font-size: 0.9rem;
	min-height: 20px;
	overflow: auto;
}

.product-card p::-webkit-scrollbar {
	display: none;
}

.btn-group {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.btn-group button {
	flex: 1;
	margin: 0 5px;
	padding: 0.5rem 0;
	background: transparent;
	color: #00ffe7;
	border: 2px solid #00ffe7;
	border-radius: 20px;
	cursor: pointer;
	font-weight: 600;
	box-shadow: 0 0 8px #00ffe7aa;
	transition: 0.3s ease;
}

.btn-group button:hover {
	background: #00ffe7;
	color: #1e1e2f;
	box-shadow: 0 0 15px #00ffe7;
}

footer {
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(8px);
	color: #eaeaea;
	padding: 2rem 3rem;
	text-align: center;
	font-size: 0.9rem;
	border-top: 1px solid rgba(255, 255, 255, 0.2);
	box-shadow: 0 -4px 30px rgba(0, 255, 231, 0.3);
}

footer h3 {
	color: #00ffe7;
	margin-bottom: 1rem;
}

footer p {
	margin: 0.3rem 0;
}

footer .links a {
	color: #00ffe7;
	text-decoration: none;
	margin: 0 10px;
	transition: 0.3s ease;
}

footer .links a:hover {
	text-decoration: underline;
	color: #00ffe7;
}

@media (max-width: 480px) {
	nav {
		flex-direction: column;
		gap: 10px;
	}
	section {
		padding: 1rem;
	}
	.product-card {
		width: 90%;
		height: auto;
	}
}
</style>
</head>
<body>

<nav>
	<h1>EKart</h1>
	<div class="nav-buttons">
		<a href="cart.jsp">Cart 🛒 (<%= session.getAttribute("cart-count") != null ? session.getAttribute("cart-count") : 0 %>)</a>
		<a href="userorders">Orders 📦</a>
		<form action="logoutservlet" method="post" style="margin:0;">
			<button type="submit">Logout ⏻</button>
		</form>
	</div>
</nav>

<section>
	<%
	List<Product> products = (List<Product>) request.getAttribute("products");
	if (products != null && !products.isEmpty()) {
		for (Product p : products) {
	%>
	<div class="product-card">
		<img src="<%=p.getProductImage()%>" alt="Product Image">
		<h3><%=p.getProductName()%></h3>
		<p>₹ <%=p.getProductPrice()%></p>
		<p><%=p.getProductDesc()%></p>

		<form action="cart" method="post">
			<input type="hidden" name="id" value="<%= p.getId() %>">
			<div class="btn-group">
				<button type="submit" name="action" value="buy">Buy Now</button>
				<button type="submit" name="action" value="add">Add to Cart</button>
			</div>
		</form>
	</div>
	<%
		}
	} else {
	%>
	<p style="color: #00ffe7; text-align: center; width: 100%;">No products found.</p>
	<%
	}
	%>
</section>

<footer>
	<h3>About EKart</h3>
	<p>Your one-stop destination for all your shopping needs. Quality products, great prices, and fast delivery.</p>
	<div class="links">
		<a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a> | <a href="#">Contact Us</a>
	</div>
	<p>Follow us: <a href="#">Facebook</a> | <a href="#">Twitter</a> | <a href="#">Instagram</a></p>
	<p>&copy; 2025 EKart. All Rights Reserved.</p>
</footer>

</body>
</html>
