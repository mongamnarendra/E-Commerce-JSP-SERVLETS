<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.ecommerce.model.Product,com.example.dao.ProductDao"%>
<%
Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getAttribute("cart");
double grandTotal = (double) request.getAttribute("grandTotal");
ProductDao dao = new ProductDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary</title>
<style>
body {
	font-family: 'Poppins';
	background: #121212;
	color: #eaeaea;
	padding: 20px;
}

h2 {
	color: #00ffe7;
	text-align: center;
}

.order-summary {
	max-width: 800px;
	margin: auto;
	background: #222;
	padding: 20px;
	border-radius: 10px;
}

.order-item {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}

.payment-options {
	margin-top: 20px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	border-radius: 5px;
	border: none;
	resize: vertical;
	font-family: 'Poppins';
}

button {
	padding: 10px 20px;
	margin: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-cod {
	background: #00ccbb;
	color: #000;
}

.btn-pay {
	background: #00ffe7;
	color: #000;
}
</style>
</head>
<body>

	<h2>Order Summary</h2>
	<div class="order-summary">
		<%
		if (cart != null && !cart.isEmpty()) {
			for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
				int pid = entry.getKey();
				int qty = entry.getValue();
				Product p = dao.getById(pid);
				if (p != null) {
		%>
		<div class="order-item">
			<span><%=p.getProductName()%> x <%=qty%></span> 
			<span>₹<%=String.format("%.2f", (double) p.getProductPrice() * qty)%></span>
		</div>

		<%
				}
			}
		}
		%>
		<hr>
		<div class="order-item">
			<strong>Total:</strong> 
			<strong>₹<%=String.format("%.2f", grandTotal)%></strong>
		</div>

		<div class="payment-options">
			<h3>Delivery Address:</h3>
			<form action="PaymentServlet" method="post">
				<input type="hidden" name="grandTotal" value="<%=grandTotal%>">
				<textarea name="address" rows="3" required placeholder="Enter your delivery address here..."></textarea>

				<h3>Select Payment Option:</h3>
				<button type="submit" name="payment" value="COD" class="btn-cod">Cash on Delivery</button>
				<button type="submit" name="payment" value="Online" class="btn-pay">Online Payment</button>
			</form>
		</div>
	</div>

</body>
</html>
