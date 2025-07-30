<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <style>
        /* Ensure main content isn't hidden under fixed header */
        .content {
            padding-top: 100px; /* Adjust based on header height */
        }
    </style>
</head>

<body>

<%@ include file="modules/header.jsp" %>
<%@ include file="modules/sidebar.jsp" %>

<div class="wrapper">
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row justify-content-center mt-5">
    <div class="col-md-5 p-3">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="card-title mb-0">Add Customer</h4>
            </div>
            <div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/addUser">
                    <div class="form-group mb-3">
    <label>Name *</label>
    <input type="text" name="name" class="form-control" pattern="[A-Za-z\s]+" title="Only letters and spaces allowed" required />
</div>

                    <div class="form-group mb-3">
    <label>Mobile *</label>
    <input type="text" name="mobile" class="form-control"
           pattern="[0-9]{10}" maxlength="10"
           title="Enter 10-digit mobile number" required />
</div>

                    <div class="form-group mb-3">
                        <label>Email (optional)</label>
                        <input type="email" name="email" class="form-control" />
                    </div>
                    <div class="form-group mb-3">
                        <label>Address</label>
                        <textarea name="address" class="form-control"></textarea>
                    </div>
                    <div class="form-group mb-4">
                        <label>Registration Date *</label>
                        <input type="date" name="registrationDate" class="form-control" required />
                    </div>

                    <div class="d-flex justify-content-center mt-4">
    <button type="submit" class="btn btn-primary btn-lg me-5 px-5">Add</button>
    <a href="${pageContext.request.contextPath}/viewAllCustomer" class="btn btn-success btn-lg px-5">View All</a>
</div>

                </form>
            </div>
        </div>
    </div>
</div>

            </div> <!-- container-fluid -->
        </div> <!-- content -->
    </div> <!-- main-panel -->
</div> <!-- wrapper -->
<script>
    window.addEventListener('DOMContentLoaded', () => {
        const dateInput = document.querySelector('input[name="registrationDate"]');
        const today = new Date().toISOString().split('T')[0]; // yyyy-mm-dd
        dateInput.value = today;
    });
</script>

</body>
</html>
