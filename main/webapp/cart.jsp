<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,com.ecommerce.model.Product,com.example.dao.ProductDao"%>
<%
Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
ProductDao dao = new ProductDao();
double grandTotal = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #1e1e2f, #252537);
	color: #eaeaea;
	padding: 20px;
	margin: 0;
}

h2 {
	text-align: center;
	color: #00ffe7;
	margin-bottom: 20px;
}

.cart-container {
	max-width: 900px;
	margin: auto;
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(8px);
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 4px 30px rgba(0, 255, 231, 0.3);
}

.cart-item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	padding: 15px 0;
	gap: 15px;
}

.cart-item img {
	width: 100px;
	height: 100px;
	object-fit: contain;
	border-radius: 10px;
}

.cart-item-details {
	flex: 1;
}

.cart-item-details h3 {
	margin: 0;
	color: #00ffe7;
}

.cart-item-details p {
	margin: 5px 0;
}

.cart-item-price {
	font-weight: bold;
	font-size: 16px;
}

.qty-controls {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-top: 5px;
}

.qty-controls form button {
	background: transparent;
	border: 1px solid #00ffe7;
	color: #00ffe7;
	padding: 4px 8px;
	border-radius: 5px;
	cursor: pointer;
}

.qty-controls form button:hover {
	background: #00ffe7;
	color: #1e1e2f;
}

.total {
	text-align: right;
	font-size: 20px;
	margin-top: 20px;
	font-weight: bold;
	color: #00ffe7;
}

.empty-cart {
	text-align: center;
	font-size: 18px;
	color: #999;
}

.add-products {
	display: block;
	margin: 20px auto 0;
	padding: 10px 20px;
	background: #00ffe7;
	color: #1e1e2f;
	border: none;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
}

.add-products:hover {
	background: #00ccbb;
}

.buy-now {
	display: block;
	margin: 20px auto 0;
	padding: 10px 20px;
	background: #00ff99;
	color: #1e1e2f;
	border: none;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
}

.buy-now:hover {
	background: #00cc77;
}

@media ( max-width : 600px) {
	.cart-item {
		flex-direction: column;
		text-align: center;
	}
	.cart-item img {
		margin: 0 auto;
	}
}
</style>
</head>
<body>

	<h2>Your Shopping Cart</h2>
	<div class="cart-container">
		<%
		if (cart != null && !cart.isEmpty()) {
			for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
				int productId = entry.getKey();
				int quantity = entry.getValue();
				Product p = dao.getById(productId);
				if (p != null) {
			double totalPrice = p.getProductPrice() * quantity;
			grandTotal += totalPrice;
		%>
		<div class="cart-item">
			<img src="<%=p.getProductImage()%>" alt="Product Image">
			<div class="cart-item-details">
				<h3><%=p.getProductName()%></h3>
				<p>
					Price: ₹<%=String.format("%.2f", (double) p.getProductPrice())%></p>
				<div class="qty-controls">
					<form action="cart" method="post">
						<input type="hidden" name="id" value="<%=productId%>">
						<button type="submit" name="action" value="decrease">-</button>
					</form>
					<span><%=quantity%></span>
					<form action="cart" method="post">
						<input type="hidden" name="id" value="<%=productId%>">
						<button type="submit" name="action" value="increase">+</button>
					</form>
					<form action="cart" method="post" style="margin-left: 10px;">
						<input type="hidden" name="id" value="<%=productId%>">
						<button type="submit" name="action" value="remove">Remove</button>
					</form>
				</div>
			</div>
			<div class="cart-item-price">
				₹<%=String.format("%.2f", totalPrice)%></div>
		</div>
		<%
		}
		}
		%>
		<div class="total">
			Grand Total: ₹<%=String.format("%.2f", grandTotal)%>
		</div>
		<a href="homeservlet" class="add-products">Add More Products</a>

		<form action="OrderServlet" method="post"
			style="text-align: right; margin-top: 10px;">
			<input type="hidden" name="grandTotal" value="<%=grandTotal%>">
			<button type="submit" class="add-products" style="background: #00ccbb; padding: 10px 20px;">Buy Now</button>
		</form>

		<%
		} else {
		%>
		<div class="empty-cart">Your cart is empty.</div>
		<a href="homeservlet" class="add-products">Shop Now</a>
		<%
		}
		%>
	</div>

</body>
</html>
