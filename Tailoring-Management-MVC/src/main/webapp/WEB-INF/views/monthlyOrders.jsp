<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Monthly Orders</title>

    <!-- Bootstrap + Custom CSS -->
    <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/assets/css/sidebar.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">

    <style>
        .content-wrapper { padding:20px; background:#f4f6f9; min-height:100vh; }
        .table-container { background:#fff; border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1); padding:20px; }
        th { background:#007bff; color:#fff; }
        .status-common { color:#007bff; font-weight:bold; }
        .filter-section { display:flex; gap:15px; align-items:center; margin-bottom:20px; }
        .filter-section input { padding:5px 10px; }
        .filter-section button { background:#007bff; color:white; padding:6px 12px; border:none; border-radius:4px; }
        .filter-section button:hover { background:#0056b3; }
    </style>
</head>
<body>

    <%@ include file="modules/sidebar.jsp" %>
    <%@ include file="modules/header.jsp" %>

    <div class="page-wrapper">
        <div class="page-content">
            <div class="content-wrapper">
                <h3 class="mb-4">Monthly Orders (${selectedMonth})</h3>

                <!-- Filter Section -->
                <div class="filter-section">
                    <form method="get" action="${pageContext.request.contextPath}/monthlyreport" class="d-flex flex-wrap gap-3">
                        <input type="month" name="month" value="${selectedMonth}">
                        <button type="submit">Show</button>
                    </form>
                </div>

                <!-- Table -->
                <div class="table-container">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Clothing Quantities</th>
                                <th>Status</th>
                                <th>Order Date</th>
                                <th>Due Date</th>
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
                                    <td><span class="status-common">${order.status}</span></td>
                                    <td>${order.orderDate}</td>
                                    <td>${order.dueDate}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty orders}">
                                <tr><td colspan="6" class="text-center text-muted">No orders found for ${selectedMonth}</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
