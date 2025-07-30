<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Slip - ${order.id}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full height */
        }

        .order-slip {
            border: 1px solid #333;
            padding: 20px;
            width: 60%;
            max-width: 800px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h2 { text-align: center; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .print-btn {
            margin-top: 20px;
            text-align: center;
        }

        .print-btn button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="order-slip">
    <h2>Order Slip</h2>
    <p><strong>Order ID:</strong> ${order.id}</p>
    <p><strong>Customer Name:</strong> ${order.customerName}</p>
    <p><strong>Order Date:</strong> ${order.orderDate}</p>
    <p><strong>Due Date:</strong> ${order.dueDate}</p>
    <p><strong>Status:</strong> ${order.status}</p>
    <p><strong>Special Instructions:</strong> ${order.specialInstructions}</p>

    <h3>Clothing Quantities</h3>
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

    <h3>Total Amount: ₹${order.totalAmount}</h3>

    <div class="print-btn">
        <button onclick="window.print()">Print Slip</button>
    </div>
</div>

</body>
</html>
