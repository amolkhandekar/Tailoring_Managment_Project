<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #7e22ce;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container-box {
            display: flex;
            width: 800px;
            height: 520px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }

        /* Left side - Login Form */
        .form-section {
            width: 45%;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section h2 {
            margin-bottom: 30px;
            font-size: 1.8rem;
            color: #4b0082;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 0.95rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            outline: none;
        }

        .btn-login {
            background-color: #7e22ce;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #5e17a3;
        }

        .forgot, .signup {
            text-align: center;
            margin-top: 15px;
        }

        .forgot a,
        .signup a {
            color: #7e22ce;
            text-decoration: none;
            font-weight: 500;
        }

        /* Right side - Image & Text */
        .info-section {
            width: 55%;
            background: url('https://images.unsplash.com/photo-1496181133206-80ce9b88a853') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .info-section h1 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .info-section p {
            font-size: 0.9rem;
        }

        /* Error Message Styling */
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="container-box">
    <!-- Left: Login Form -->
    <div class="form-section">
        <h2>Login</h2>

        <!-- Display error if login fails -->
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/loginUser" method="post">
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder="Enter your email" required />
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
            </div>

            <div class="forgot">
                <a href="${pageContext.request.contextPath}/forgot-password">Forgot password?</a>
            </div>

            <button type="submit" class="btn-login">Login</button>

            <div class="signup">
                Don’t have an account? 
                <a href="${pageContext.request.contextPath}/signup">Signup now</a>
            </div>
        </form>
    </div>

    <!-- Right: Image & Text -->
    <div class="info-section">
        <div>
            <h1>Every new friend is a new adventure.</h1>
            <p>Let’s get connected</p>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
