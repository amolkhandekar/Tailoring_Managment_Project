<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <style>
        .content-wrapper { padding: 20px; margin-left: 260px; margin-top: 70px; background: #f4f6f9; min-height: 100vh; }
        .form-container { background: #fff; border-radius: 8px; padding: 30px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 700px; margin: 0 auto; }
        .form-title { font-size: 22px; font-weight: bold; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 6px; }
        input[type="text"], input[type="date"], input[type="number"], textarea, select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; }
        .btn-submit { background: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
        .btn-submit:hover { background: #0056b3; }
    </style>
</head>
<body>
    <%@ include file="modules/sidebar.jsp" %>
    <%@ include file="modules/header.jsp" %>

    <div class="content-wrapper">
        <div class="form-container">
            <div class="form-title">Update Order</div>
            <form action="${pageContext.request.contextPath}/update" method="post">
                <input type="hidden" name="id" value="${order.id}" />

                <div class="form-group">
                    <label>Customer Name</label>
                    <input type="text" name="customerName" value="${order.customerName}" required />
                </div>

                <!-- Map Binding with IDs for JS -->
                <div class="form-group">
                    <label>Shirt Quantity</label>
                    <input type="number" id="shirtQty" name="clothingQuantities['Shirt']" value="${order.clothingQuantities['Shirt']}" />
                </div>
                <div class="form-group">
                    <label>Pant Quantity</label>
                    <input type="number" id="pantQty" name="clothingQuantities['Pant']" value="${order.clothingQuantities['Pant']}" />
                </div>
                <div class="form-group">
                    <label>Kurta Quantity</label>
                    <input type="number" id="kurtaQty" name="clothingQuantities['Kurta']" value="${order.clothingQuantities['Kurta']}" />
                </div>

                <div class="form-group">
                    <label>Order Date</label>
                    <input type="date" name="orderDate" value="${order.orderDate}" required />
                </div>

                <div class="form-group">
                    <label>Due Date</label>
                    <input type="date" name="dueDate" value="${order.dueDate}" required />
                </div>

                <div class="form-group">
                    <label>Status</label>
                    <select name="status" required>
                       <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                       <option value="In Progress" ${order.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                       <option value="Ready" ${order.status == 'Ready' ? 'selected' : ''}>Ready</option>
                       <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Special Instructions</label>
                    <textarea name="specialInstructions" rows="3">${order.specialInstructions}</textarea>
                </div>

                <div class="form-group">
                    <label>Total Amount (₹)</label>
                    <input type="text" name="totalAmount" value="${order.totalAmount}" />

                </div>

                <button type="submit" class="btn-submit">Update Order</button>
            </form>
        </div>
    </div>
</body>
<script>
    function updateTotal() {
        let shirt = parseInt(document.getElementById('shirtQty').value) || 0;
        let pant = parseInt(document.getElementById('pantQty').value) || 0;
        let kurta = parseInt(document.getElementById('kurtaQty').value) || 0;

        let total = (shirt * 500) + (pant * 700) + (kurta * 800); // Price logic
        document.getElementById('totalAmount').value = total;
    }

    document.getElementById('shirtQty').addEventListener('input', updateTotal);
    document.getElementById('pantQty').addEventListener('input', updateTotal);
    document.getElementById('kurtaQty').addEventListener('input', updateTotal);

    // Initial calculation on page load
    updateTotal();
</script>
</html>
