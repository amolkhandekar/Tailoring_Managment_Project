<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Slip - ${order.id}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .order-slip {
            width: 60%;
            max-width: 800px;
            background: #fff;
            padding: 30px;
            margin-top: 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h2 { 
            text-align: center; 
            margin-bottom: 20px; 
            color: #007bff;
        }
        .section {
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 18px; 
            font-weight: bold; 
            margin-bottom: 10px;
            color: #333;
        }
        .field-label {
            font-weight: bold;
            display: inline-block;
            width: 200px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #007bff;
            color: #fff;
        }
        .total-amount {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
        .print-btn {
            margin-top: 30px;
            text-align: center;
        }
        .print-btn button {
            background: #007bff;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .print-btn button:hover { background: #0056b3; }
    </style>
</head>
<body>

<div class="order-slip">
    <h2>Order Slip</h2>

    <!-- Order Details -->
    <div class="section">
        <div class="section-title">Order Details</div>
        <p><span class="field-label">CustomerName:</span> ${order.customerName}</p>
        
        <p><span class="field-label">Order ID:</span> ${order.id}</p>
        <p><span class="field-label">Order Date:</span> ${order.orderDate}</p>
        <p><span class="field-label">Due Date:</span> ${order.dueDate}</p>
        <p><span class="field-label">Status:</span> ${order.status}</p>
        <p><span class="field-label">Special Instructions:</span> ${order.specialInstructions}</p>
    </div>

   

    <!-- Clothing Quantities -->
    <div class="section">
        <div class="section-title">Clothing Quantities</div>
        <table>
            <thead>
                <tr>
                    <th>Clothing Type</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${order.clothingQuantities}">
                    <tr>
                        <td>${entry.key}</td>
                        <td>${entry.value}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <p class="total-amount">Total Amount: ₹${order.totalAmount}</p>

    <div class="print-btn">
        <button onclick="window.print()">Print Slip</button>
    </div>
</div>

</body>
</html>
