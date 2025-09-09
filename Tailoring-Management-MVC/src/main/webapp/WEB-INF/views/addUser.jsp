<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <style>
        .form-card {
            max-width: 720px;
            margin: 60px auto;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .form-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        .form-body {
            padding: 30px;
            background-color: #f9f9f9;
        }
    </style>
</head>

<body>

<%@ include file="modules/header.jsp" %>
<%@ include file="modules/sidebar.jsp" %>

<div class="container">
    <div class="form-card">
        <div class="form-header text-center">
            <h4 class="mb-0">Add Customer</h4>
        </div>

        <div class="form-body">
            <form method="post" action="${pageContext.request.contextPath}/addUser">
                <!-- Name -->
                <div class="mb-3">
                    <label class="form-label">Name *</label>
                    <input type="text" name="name" class="form-control" pattern="[A-Za-z\s]+" title="Only letters and spaces allowed" required />
                </div>

                <!-- Mobile -->
                <div class="mb-3">
                    <label class="form-label">Mobile *</label>
                    <input type="text" name="mobile" class="form-control" pattern="[0-9]{10}" maxlength="10" title="Enter 10-digit mobile number" required />
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email (optional)</label>
                    <input type="email" name="email" class="form-control" />
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea name="address" class="form-control"></textarea>
                </div>

                <!-- Registration Date -->
                <div class="mb-4">
                    <label class="form-label">Registration Date *</label>
                    <input type="date" name="registrationDate" class="form-control" required />
                </div>

                <!-- Buttons Centered -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary me-3 px-5">Add</button>
                    <a href="${pageContext.request.contextPath}/viewAllCustomer" class="btn btn-success px-5">View All</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Auto-fill today’s date
    window.addEventListener('DOMContentLoaded', () => {
        const dateInput = document.querySelector('input[name="registrationDate"]');
        const today = new Date().toISOString().split('T')[0];
        dateInput.value = today;
    });
</script>

</body>
</html>
