<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Customers</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">

    <!-- Sidebar & Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
</head>
<body>

    <%@ include file="modules/sidebar.jsp" %>
    <%@ include file="modules/header.jsp" %>

    <div class="page-wrapper">
        <div class="page-content">
            <div class="container-fluid mt-4">
                <h3 class="mb-4">All Customers</h3>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Registration Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.name}</td>
                                <td>${customer.mobile}</td>
                                <td>${customer.email}</td>
                                <td>${customer.address}</td>
                                <td>${customer.registrationDate}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/updateCustomer?id=${customer.id}" class="btn btn-sm btn-primary">Update</a>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

    <%@ include file="modules/footer.jsp" %>
<!-- Already loaded more than once -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

<!-- Same again (duplicate) – should be removed -->
<script src="resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="resources/assets/js/jquery.min.js"></script>

</body>
</html>
