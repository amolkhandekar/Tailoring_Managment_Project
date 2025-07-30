<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Orders</title>
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <style>
        .content-wrapper { padding:20px; margin-left:260px; margin-top:70px; background:#f4f6f9; min-height:100vh;}
        .table-container { background:#fff; border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1); padding:20px; }
        table { width:100%; border-collapse:collapse; font-size:14px; }
        th, td { padding:12px; text-align:left; border-bottom:1px solid #eee; }
        th { background:#007bff; color:#fff; }
        tr:hover { background:#f9f9f9; }
        .page-title { font-size:22px; font-weight:bold; margin-bottom:20px; }
        .status-pending { color:orange; font-weight:bold; }
        .status-completed { color:green; font-weight:bold; }
        .status-cancelled { color:red; font-weight:bold; }
        .btn-update, .btn-print { background:#28a745; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; }
        .btn-print { background:#007bff; margin-left:5px; }
        .btn-update:hover { background:#218838; }
        .btn-print:hover { background:#0056b3; }
        .filter-section { display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; }
        .filter-form input { padding:5px 10px; }
        .filter-form button { background:#007bff; color:white; padding:6px 12px; border:none; border-radius:4px; cursor:pointer; }
        .filter-form button:hover { background:#0056b3; }
        .status-filter select { padding:5px 10px; }
        .pagination {
    margin-top: 20px;
    text-align: center;
}
.pagination a, .pagination .current-page {
    padding: 6px 12px;
    margin: 2px;
    text-decoration: none;
    border: 1px solid #007bff;
    border-radius: 4px;
}
.pagination a {
    color: #007bff;
}
.pagination .current-page {
    background-color: #007bff;
    color: white;
}
    </style>
</head>
<body>
    <%@ include file="modules/sidebar.jsp" %>
    <%@ include file="modules/header.jsp" %>

    <div class="content-wrapper">
        <div class="page-title">All Orders</div>

        <!-- Filters Section -->
        <div class="filter-section">
            <!-- Status Dropdown (Auto Filter) -->
            <div class="status-filter">
                <label for="statusDropdown"><b>Status:</b></label>
                <select id="statusDropdown">
                    <option value="">All</option>
                    <option value="Pending" ${status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="In Progress" ${status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                    <option value="Ready" ${status == 'Ready' ? 'selected' : ''}>Ready</option>
                    <option value="Delivered" ${status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                </select>
            </div>

            <!-- Name Search Form -->
            <form action="${pageContext.request.contextPath}/viewAllOrders" method="get" class="filter-form">
                <input type="text" name="customerName" value="${customerName}" placeholder="Search by name" />
                <button type="submit">Search</button>
            </form>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Clothing Quantities</th>
                        <th>Order Date</th>
                        <th>Due Date</th>
                        <th>Status</th>
                        <th>Special Instructions</th>
                        <th>Total Amount (₹)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.customerName}</td>
                            <td>
                               <c:forEach var="entry" items="${order.clothingQuantities}">
    ${entry.key}: ${entry.value}
</c:forEach>

                            </td>
                            <td>${order.orderDate}</td>
                            <td>${order.dueDate}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/updateStatus" method="post">
                                    <input type="hidden" name="id" value="${order.id}" />
                                    <select name="status">
                                        <option ${order.status=='Pending' ? 'selected' : ''}>Pending</option>
                                        <option ${order.status=='In Progress' ? 'selected' : ''}>In Progress</option>
                                        <option ${order.status=='Ready' ? 'selected' : ''}>Ready</option>
                                        <option ${order.status=='Delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                    <button type="submit" class="btn-update">Update</button>
                                </form>
                            </td>
                            <td>${order.specialInstructions}</td>
                            <td>${order.totalAmount}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/updateOrder?id=${order.id}" class="btn-update">Edit</a>
                                <a href="${pageContext.request.contextPath}/printOrder?id=${order.id}" class="btn-print" target="_blank">Print</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination">
    <c:if test="${totalPages > 1}">
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <span class="current-page">${i + 1}</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/viewAllOrders?status=${status}&customerName=${customerName}&page=${i}&size=10">
                        ${i + 1}
                    </a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
</div>
            
        </div>
    </div>

    <!-- Auto Filter Script -->
    <script>
        document.getElementById('statusDropdown').addEventListener('change', function () {
            let status = this.value;
            let url = '${pageContext.request.contextPath}/viewAllOrders';
            if (status) {
                url += '?status=' + encodeURIComponent(status);
            }
            window.location.href = url;
        });
    </script>
</body>
</html>
