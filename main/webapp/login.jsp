<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

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

    .login-container {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(8px);
        padding: 2rem 3rem;
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
        border: 1px solid rgba(255, 255, 255, 0.18);
        width: 90%;
        max-width: 400px;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 2rem;
        color: #00ffe7;
        text-shadow: 0 0 10px #00ffe7aa;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
    }

    .form-group input {
        width: 100%;
        padding: 0.8rem 1rem;
        border: none;
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.1);
        color: #fff;
        font-size: 1rem;
        outline: none;
        box-shadow: inset 0 0 5px rgba(0,255,231,0.2);
        transition: 0.3s ease;
    }

    .form-group input:focus {
        box-shadow: 0 0 8px #00ffe7;
        background: rgba(255, 255, 255, 0.15);
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

    .signup-link {
        text-align: center;
        margin-top: 1rem;
        color: #eaeaea;
        font-size: 0.9rem;
    }

    .signup-link a {
        color: #00ffe7;
        text-decoration: none;
        font-weight: 600;
        margin-left: 5px;
    }

    .signup-link a:hover {
        text-decoration: underline;
    }

    @media (max-width: 480px) {
        .login-container {
            padding: 1.5rem 2rem;
        }
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form action="loginservlet" method="post">
        <div class="form-group">
            <label>Enter User Email:</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Enter User Password:</label>
            <input type="password" name="password" required>
        </div>
        <button type="submit" class="btn-submit">Login</button>
    </form>
    <div class="signup-link">
        Don't have an account?
        <a href="signup.jsp">Sign Up</a>
    </div>
</div>

</body>
</html>
