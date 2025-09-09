<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Orders</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

    <style>
        .content-wrapper { 
            padding:20px; 
            background:#f4f6f9; 
            min-height:100vh; 
        }
        .table-container { 
            background:#fff; 
            border-radius:8px; 
            box-shadow:0 0 10px rgba(0,0,0,0.1); 
            padding:20px; 
        }
        /* Sidebar open state */
        .page-wrapper {
            margin-left: 240px;   /* sidebar width */
            width: calc(100% - 240px);
            transition: all 0.3s ease;
        }
        /* Sidebar collapsed state */
        .sidebar-collapsed .page-wrapper {
            margin-left: 0;
            width: 100%;
        }
        
        th { 
            background:#007bff; 
            color:#fff; 
        }
        .status-common { 
            color:#007bff; 
            font-weight:bold; 
        }
        .filter-section { 
            display:flex; 
            gap:15px; 
            align-items:center; 
            margin-bottom:20px; 
        }
        .filter-section input { 
            padding:5px 10px; 
        }
        .filter-section button { 
            background:#007bff; 
            color:white; 
            padding:6px 12px; 
            border:none; 
            border-radius:4px; 
        }
        .filter-section button:hover { 
            background:#0056b3; 
        }
    </style>
</head>
<body>
    <%@ include file="modules/sidebar.jsp" %>
    <%@ include file="modules/header.jsp" %>

    <!-- Main Content -->
    <div class="page-wrapper">
        <h3 class="mb-4 text-warning">Pending Orders</h3>

        <!-- Action buttons -->
        <div class="filter-section">
            <button id="downloadBtn" class="btn btn-success">📄 Download PDF</button>
        </div>

        <div class="table-container" id="ordersTable">
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
                        <td><span class="status-pending">${order.status}</span></td>
                        <td>${order.orderDate}</td>
                        <td>${order.dueDate}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orders}">
                    <tr><td colspan="6" class="text-center text-muted">No pending orders found</td></tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

    <script>
        // Sidebar toggle button click event
        document.addEventListener("DOMContentLoaded", function () {
            const toggleBtn = document.querySelector(".toggle-btn");
            if (toggleBtn) {
                toggleBtn.addEventListener("click", function () {
                    document.body.classList.toggle("sidebar-collapsed");
                });
            }
        });
    </script>

    <!-- html2pdf.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script>
        document.getElementById("downloadBtn").addEventListener("click", function () {
            const element = document.getElementById("ordersTable"); // target only table container
            const opt = {
                margin:       0.5,
                filename:     'pending_orders.pdf',
                image:        { type: 'jpeg', quality: 0.98 },
                html2canvas:  { scale: 2 },
                jsPDF:        { unit: 'in', format: 'a4', orientation: 'portrait' }
            };
            html2pdf().from(element).set(opt).save();
        });
    </script>
</body>
</html>
