<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap')
	;

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
	width: 90%;
	max-width: 500px;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 2rem;
	color: #00ffe7;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-group label {
	display: block;
	margin-bottom: 0.5rem;
	font-weight: 600;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 0.8rem 1rem;
	border: none;
	border-radius: 10px;
	background: rgba(255, 255, 255, 0.1);
	color: #fff;
	font-size: 1rem;
	box-shadow: inset 0 0 5px rgba(0, 255, 231, 0.2);
	transition: 0.3s ease;
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
}

.btn-submit:hover {
	background: #00ffe7;
	color: #1e1e2f;
}
</style>

</head>
<body>

	<div class="form-container">
		<h2>Add Product</h2>
		<!-- Note: enctype added to handle file upload -->
		<form action="AddServlet" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Enter Product Name:</label> <input type="text"
					name="productName" required>
			</div>
			<div class="form-group">
				<label>Enter Product Price:</label> <input type="text"
					name="productPrice" required>
			</div>
			<div class="form-group">
				<label>Enter Product Description:</label>
				<textarea name="productDesc" rows="4" required></textarea>
			</div>
			<div class="form-group">
				<label>Upload Product Image:</label>
				<!-- Actual file input for image -->
				<input type="file" name="productImage" accept="image/*" required>
			</div>
			<button type="submit" class="btn-submit">Add Product</button>
		</form>
	</div>

</body>
</html>
