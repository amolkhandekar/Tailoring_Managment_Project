<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delivered Orders</title>

    <!-- Bootstrap + Icons + MetisMenu -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/sidebar.css">

    <style>
        body { display: flex; min-height: 100vh; background:#f4f6f9; }
        .sidebar {
            width: 250px; background: #343a40; color: #fff;
            min-height: 100vh; padding-top: 20px;
        }
        .sidebar a { color:#fff; text-decoration:none; display:block; padding:10px 20px; }
        .sidebar a:hover { background:#495057; }
        .page-wrapper { flex: 1; padding:20px; }
        .table-container { background:#fff; border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1); padding:20px; }
        th { background:#28a745; color:#fff; }
        .status-delivered { color:#28a745; font-weight:bold; }
    </style>
</head>
<body>

    <!-- Sidebar -->
    

    <!-- Main Content -->
    <div class="page-wrapper">
        <h3 class="mb-4 text-success">Delivered Orders</h3>

        <div class="table-container">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Clothing Quantities</th>
                    <th>Status</th>
                    <th>Order Date</th>
                    <th>Delivered Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.customerName}</td>
                        <td>
                            <c:forEach var="entry" items="${order.clothingQuantities}">
                                ${entry.key}: ${entry.value}<br/>
                            </c:forEach>
                        </td>
                        <td><span class="status-delivered">${order.status}</span></td>
                        <td>${order.orderDate}</td>
                        <td>${order.dueDate}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orders}">
                    <tr><td colspan="6" class="text-center text-muted">No delivered orders found</td></tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/metismenu.min.js"></script>
    <script>
        $(function() {
            $('#menu').metisMenu();
        });
    </script>
</body>
</html>
