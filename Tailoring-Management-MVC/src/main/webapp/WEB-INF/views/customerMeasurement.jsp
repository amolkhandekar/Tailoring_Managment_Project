<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd" var="today" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Measurement</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    <style>
        .form-card {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            position: relative;
        }
        .list-group-item { cursor: pointer; }
        #nameSuggestions {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            z-index: 9999;
        }
    </style>
</head>
<body>

<%@ include file="modules/sidebar.jsp" %>
<%@ include file="modules/header.jsp" %>

<div class="page-wrapper">
    <div class="page-content">
        <div class="form-card">
            <h4 class="mb-4 text-center">Customer Measurement</h4>

            <form action="${pageContext.request.contextPath}/saveMeasurement" method="post" autocomplete="off">
                
                <!-- Customer Name Input -->
                <div class="mb-3 position-relative">
                    <label class="form-label">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" class="form-control" required autocomplete="off">
                    <input type="hidden" id="customerId" name="customerId">
                    <ul id="nameSuggestions" class="list-group position-absolute w-100"></ul>
                </div>

                <!-- Registration Date (readonly) -->
                <div class="mb-3">
                    <label class="form-label">Registration Date</label>
                    <input type="text" name="registrationDate" class="form-control"
       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly />

                </div>

                <!-- Measurement Type Dropdown -->
                <div class="mb-3">
                    <label class="form-label">Measurement Type</label>
                    <select name="type" id="type" class="form-select" onchange="showFields()" required>
                        <option value="">-- Select --</option>
                        <option value="shirt">Shirt</option>
                        <option value="pant">Pant</option>
                        <option value="kurta">Kurta</option>
                    </select>
                </div>

                <!-- Shirt Fields -->
                <div id="shirt-fields" class="measurement-group" style="display:none;">
                    <h5>Shirt</h5>
                    <div class="input-group mb-2"><input type="text" name="chest" class="form-control" placeholder="Chest"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="waist" class="form-control" placeholder="Waist"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="shoulder" class="form-control" placeholder="Shoulder"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="sleeve" class="form-control" placeholder="Sleeve"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="length" class="form-control" placeholder="Length"><span class="input-group-text">cm</span></div>
                </div>

                <!-- Pant Fields -->
                <div id="pant-fields" class="measurement-group" style="display:none;">
                    <h5>Pant</h5>
                    <div class="input-group mb-2"><input type="text" name="waistPant" class="form-control" placeholder="Waist"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="inseam" class="form-control" placeholder="Inseam"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="lengthPant" class="form-control" placeholder="Length"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="hip" class="form-control" placeholder="Hip"><span class="input-group-text">cm</span></div>
                </div>

                <!-- Kurta Fields -->
                <div id="kurta-fields" class="measurement-group" style="display:none;">
                    <h5>Kurta</h5>
                    <div class="input-group mb-2"><input type="text" name="chestKurta" class="form-control" placeholder="Chest"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="waistKurta" class="form-control" placeholder="Waist"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="lengthKurta" class="form-control" placeholder="Length"><span class="input-group-text">cm</span></div>
                    <div class="input-group mb-2"><input type="text" name="shoulderKurta" class="form-control" placeholder="Shoulder"><span class="input-group-text">cm</span></div>
                </div>

                <!-- Buttons -->
                <div class="text-end mt-4">
                    <button type="submit" class="btn btn-success me-2">Save</button>
                    <a href="${pageContext.request.contextPath}/viewCustomers" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

<script>
function showFields() {
    const selectedType = document.getElementById("type").value;
    document.querySelectorAll(".measurement-group").forEach(group => group.style.display = "none");
    if (selectedType === "shirt") {
        document.getElementById("shirt-fields").style.display = "block";
    } else if (selectedType === "pant") {
        document.getElementById("pant-fields").style.display = "block";
    } else if (selectedType === "kurta") {
        document.getElementById("kurta-fields").style.display = "block";
    }
}

$(document).ready(function () {
    $('#customerName').on('keyup', function () {
        const query = $(this).val();
        if (query.length < 2) {
            $('#nameSuggestions').empty();
            return;
        }

        $.ajax({
            url: 'http://localhost:8181/api/names',
            method: 'GET',
            data: { name: query },
            success: function (data) {
                const suggestionBox = $('#nameSuggestions');
                suggestionBox.empty();
                if (data.length === 0) {
                    suggestionBox.append('<li class="list-group-item disabled">No matches</li>');
                    return;
                }
                data.forEach(function (name) {
                    suggestionBox.append('<li class="list-group-item suggestion-item">' + name + '</li>');
                });
                $('.suggestion-item').on('click', function () {
                    $('#customerName').val($(this).text());
                    $('#nameSuggestions').empty();
                });
            },
            error: function () {
                $('#nameSuggestions').empty().append('<li class="list-group-item disabled">Error fetching names</li>');
            }
        });
    });
});
</script>

</body>
</html>
