<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Order</title>
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f2f4f7;
        }

        .main-wrapper {
            display: flex;
        }

        .content-area {
            flex-grow: 1;
            padding: 30px;
            background-color: #f2f4f7;
        }

        .form-card {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .checkbox-group label {
            display: inline-block;
            margin-right: 15px;
        }

        .text-center {
            text-align: center;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        #suggestions {
            background: #fff;
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            position: absolute;
            width: 100%;
            z-index: 10;
            border-radius: 6px;
        }

        .suggestion-item {
            padding: 10px;
            cursor: pointer;
            border-bottom: 1px solid #eee;
        }

        .suggestion-item:hover {
            background-color: #f0f0f0;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            display: none;
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="modules/sidebar.jsp" %>

<div class="main-panel">
    <%@ include file="modules/header.jsp" %>

    <div class="content-area">
        <div class="form-card">
            <div class="form-title">Create New Order</div>

            <div id="successMessage" class="alert-success">
                ✅ Order submitted successfully!
            </div>

            <!-- Search Customer -->
            <div class="form-group" style="position: relative;">
                <label for="searchCustomer">Search Customer *</label>
                <input type="text" id="searchCustomer" placeholder="Enter customer name...">
                <input type="hidden" id="selectedCustomerName" name="customerName">
                <div id="suggestions"></div>
            </div>

            <!-- Order Form -->
            <form id="orderForm" action="${pageContext.request.contextPath}/saveOrder" method="post">

                <!-- Clothing Types -->
                <div class="form-group checkbox-group">
                    <label>Clothing Type *</label>
                    <label><input type="checkbox" name="clothingTypes" value="Shirt"> Shirt</label>
                    <label><input type="checkbox" name="clothingTypes" value="Pant"> Pant</label>
                    <label><input type="checkbox" name="clothingTypes" value="Kurta"> Kurta</label>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Quantities (e.g. 2,1,1) *</label>
                        <input type="text" id="quantities" name="quantities" pattern="^\d+(,\d+)*$"
                               title="उदा: 2,1,1 या स्वरूपात संख्या द्या" required/>
                    </div>
                    <div class="form-group">
                        <label>Total Amount (₹)</label>
                        <input type="text" name="amount" id="totalAmount" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label>Special Instructions</label>
                    <textarea name="instructions" rows="3" placeholder="Any notes or instructions..."></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Order Date *</label>
                        <input type="date" name="orderDate" required>
                    </div>
                    <div class="form-group">
                        <label>Due Date *</label>
                        <input type="date" name="dueDate" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Status *</label>
                    <select name="status" required>
                        <option value="">Select Status</option>
                        <option value="Pending">Pending</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Ready">Ready</option>
                        <option value="Delivered">Delivered</option>
                    </select>
                </div>

                <div class="form-group text-center">
                    <button type="submit" class="btn-primary">Submit Order</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- JS Script (same as before, no change) -->
<script>
    const prices = {
        "Shirt": 300,
        "Pant": 400,
        "Kurta": 350
    };

    function calculateTotal() {
        const quantities = $('#quantities').val().split(',').map(q => parseInt(q.trim()));
        const selectedItems = $('input[name="clothingTypes"]:checked').map(function () {
            return $(this).val();
        }).get();

        let total = 0;

        for (let i = 0; i < selectedItems.length; i++) {
            const item = selectedItems[i];
            const qty = quantities[i] || 0;
            total += (prices[item] || 0) * qty;
        }

        $('#totalAmount').val(total);
    }

    $(document).ready(function () {
        $('#searchCustomer').on('input', function () {
            const query = $(this).val().trim();
            if (query.length >= 2) {
                $.ajax({
                    url: 'http://localhost:8181/api/measurements/customer-names',
                    method: 'GET',
                    data: {query: query},
                    success: function (data) {
                        let suggestionHTML = '';
                        data.forEach(function (name) {
                            suggestionHTML += '<div class="suggestion-item">' + name + '</div>';
                        });
                        $('#suggestions').html(suggestionHTML).show();
                    },
                    error: function () {
                        $('#suggestions').empty().hide();
                    }
                });
            } else {
                $('#suggestions').empty().hide();
            }
        });

        $(document).on('click', '.suggestion-item', function () {
            const selectedName = $(this).text();
            $('#searchCustomer').val(selectedName);
            $('#selectedCustomerName').val(selectedName);
            $('#suggestions').empty().hide();
            $('#orderForm').slideDown();
        });

        $('#quantities').on('input', calculateTotal);
        $('input[name="clothingTypes"]').on('change', calculateTotal);

        $('#orderForm').submit(function (e) {
            e.preventDefault();

            const selectedClothing = $('input[name="clothingTypes"]:checked').map(function () {
                return $(this).val();
            }).get();
            const quantities = $('#quantities').val().split(',');

            const clothingQuantities = {};
            selectedClothing.forEach((item, i) => {
                clothingQuantities[item] = parseInt(quantities[i] || 0);
            });

            const orderData = {
                customerName: $('#selectedCustomerName').val(),
                clothingQuantities: clothingQuantities,
                orderDate: $('input[name="orderDate"]').val(),
                dueDate: $('input[name="dueDate"]').val(),
                status: $('select[name="status"]').val(),
                specialInstructions: $('textarea[name="instructions"]').val(),
                totalAmount: $('#totalAmount').val()
            };

            $.ajax({
                url: 'http://localhost:8181/api/orders/saveOrder',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(orderData),
                success: function () {
                    $('#orderForm')[0].reset();
                    $('#orderForm').hide();
                    $('#successMessage').fadeIn().delay(3000).fadeOut();
                },
                error: function (xhr) {
                    console.error(xhr.responseText);
                    alert("Something went wrong while submitting the order.");
                }
            });
        });

        $(document).click(function (e) {
            if (!$(e.target).closest('#searchCustomer, #suggestions').length) {
                $('#suggestions').empty().hide();
            }
        });
    });
</script>
</body>
</html>
