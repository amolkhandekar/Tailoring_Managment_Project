<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Signup</title>
  <script>
  function validateSignupForm() {
    const form = document.forms[0];
    const name = form["name"].value.trim();
    const mobile = form["mobile"].value.trim();
    const email = form["email"].value.trim();
    const address = form["address"].value.trim();
    const password = form["password"].value.trim();

    const nameRegex = /^[a-zA-Z\s]+$/;
    const mobileRegex = /^[0-9]{10}$/;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!nameRegex.test(name)) {
      alert("Name must contain only letters and spaces.");
      return false;
    }

    if (!mobileRegex.test(mobile)) {
      alert("Mobile number must be exactly 10 digits.");
      return false;
    }

    if (email && !emailRegex.test(email)) {
      alert("Please enter a valid email address.");
      return false;
    }

    if (address.length < 3) {
      alert("Please enter your address.");
      return false;
    }

    if (password.length < 6) {
      alert("Password must be at least 6 characters long.");
      return false;
    }

    return true;
  }

  // Attach to form submit
  document.addEventListener("DOMContentLoaded", () => {
    document.forms[0].addEventListener("submit", function (e) {
      if (!validateSignupForm()) {
        e.preventDefault(); // prevent form from submitting if invalid
      }
    });
  });
</script>
  
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

    .container {
      display: flex;
      width: 800px;
      height: 580px;
      background-color: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
      border: 1px solid #ddd;
    }

    .form-section {
      width: 50%;
      padding: 35px 25px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .form-section h2 {
      margin-bottom: 25px;
      font-size: 1.6rem;
      color: #4b0082;
      text-align: center;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 12px;
      font-size: 0.95rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      outline: none;
      resize: vertical;
    }

    .btn-signup {
      background-color: #7e22ce;
      color: white;
      border: none;
      width: 100%;
      padding: 12px;
      font-size: 1rem;
      cursor: pointer;
      border-radius: 5px;
    }

    .login {
      margin-top: 20px;
      font-size: 0.9rem;
      text-align: center;
    }

    .login a {
      color: #7e22ce;
      text-decoration: none;
    }

    .info-section {
      width: 50%;
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
      font-size: 1.4rem;
      margin-bottom: 10px;
    }

    .info-section p {
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

<div class="container">
  <!-- Left: Signup Form -->
  <div class="form-section">
    <h2>Create Account</h2>
    <form method="post" action="${pageContext.request.contextPath}/registerUser">

      <div class="form-group">
        <input type="text" name="name" placeholder="Name" required />
      </div>

      <div class="form-group">
        <input type="text" name="mobile" placeholder="Mobile Number" required />
      </div>

      <div class="form-group">
        <input type="email" name="email" placeholder="Email Address" />
      </div>

      <div class="form-group">
        <textarea name="address" placeholder="Address" required></textarea>
      </div>

      <div class="form-group">
        <input type="password" name="password" placeholder="Password" required />
      </div>

      <button type="submit" class="btn-signup">Signup</button>

      <div class="login">
        Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>

      </div>
    </form>
  </div>

  <!-- Right: Image + Text -->
  <div class="info-section">
    <div>
      <h1>Join the adventure</h1>
      <p>Create your account and get started today!</p>
    </div>
  </div>
</div>

</body>
</html>
