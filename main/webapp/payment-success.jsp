<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Success | EKart</title>
<style>
body {
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #1e1e2f, #252537);
    font-family: 'Poppins', sans-serif;
    color: #eaeaea;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.success-container {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(8px);
    padding: 40px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 0 30px rgba(0, 255, 231, 0.3);
}

.success-container h1 {
    color: #00ffe7;
    font-size: 2rem;
    margin-bottom: 20px;
    text-shadow: 0 0 10px #00ffe7aa;
}

.success-container p {
    font-size: 1rem;
    margin-bottom: 30px;
    color: #e0e0e0;
}

button {
    padding: 12px 25px;
    background: transparent;
    color: #00ffe7;
    border: 2px solid #00ffe7;
    border-radius: 25px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 600;
    box-shadow: 0 0 15px #00ffe7aa;
    transition: 0.3s ease;
}

button:hover {
    background: #00ffe7;
    color: #1e1e2f;
    box-shadow: 0 0 25px #00ffe7;
}

</style>
</head>
<body>

    <div class="success-container">
        <h1>🎉 Payment Successful!</h1>
        <p>Thank you for your purchase. Your order has been placed successfully.</p>
        <form action="homeservlet" method="get">
            <button type="submit">Go to Homepage</button>
        </form>
    </div>

</body>
</html>
