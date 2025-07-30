<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Measurements</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<%@ include file="modules/sidebar.jsp" %>
<%@ include file="modules/header.jsp" %>

<div class="page-wrapper">
    <div class="page-content">
        <div class="container-fluid mt-4">
            <h2 class="text-center mb-4">All Measurements</h2>

            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                   <table class="table table-bordered text-center">
 <thead>
  <tr>
<th rowspan="2" style="background-color: #2980b9; color: white;">ID</th>
        <th rowspan="2" style="background-color: #2980b9; color: white;">Customer Name</th>
        <th rowspan="2" style="background-color: #2980b9; color: white;">Registration Date</th>


    <th colspan="5" style="background-color: #2980b9; color: white;">Shirt</th>
    <th colspan="4" style="background-color: #3498db; color: white;">Pant</th>
    <th colspan="4" style="background-color: #5dade2; color: white;">Kurta</th>

    <th rowspan="2" style="background-color: #2c3e50; color: white;">Action</th>
  </tr>
  <tr>
    <!-- Shirt Fields -->
    <th style="background-color: white; color: #2c3e50;">Chest</th>
    <th style="background-color: white; color: #2c3e50;">Waist</th>
    <th style="background-color: white; color: #2c3e50;">Shoulder</th>
    <th style="background-color: white; color: #2c3e50;">Sleeve</th>
    <th style="background-color: white; color: #2c3e50;">Length</th>

    <!-- Pant Fields -->
    <th style="background-color: white; color: #2c3e50;">Waist Pant</th>
    <th style="background-color: white; color: #2c3e50;">Inseam</th>
    <th style="background-color: white; color: #2c3e50;">Length Pant</th>
    <th style="background-color: white; color: #2c3e50;">Hip</th>

    <!-- Kurta Fields -->
    <th style="background-color: white; color: #2c3e50;">Chest Kurta</th>
    <th style="background-color: white; color: #2c3e50;">Waist Kurta</th>
    <th style="background-color: white; color: #2c3e50;">Length Kurta</th>
    <th style="background-color: white; color: #2c3e50;">Shoulder Kurta</th>
  </tr>
</thead>



<tbody>
    <c:forEach var="m" items="${measurements}">
        <tr class="text-center">
            <td>${m.id}</td>
            <td>${m.customerName}</td>
            
            <td>
                <fmt:formatDate value="${m.registrationDate}" pattern="yyyy-MM-dd" />
            </td>

            <!-- Shirt -->
            <td>${m.chest}</td>
            <td>${m.waist}</td>
            <td>${m.shoulder}</td>
            <td>${m.sleeve}</td>
            <td>${m.length}</td>

            <!-- Pant -->
            <td>${m.waistPant}</td>
            <td>${m.inseam}</td>
            <td>${m.lengthPant}</td>
            <td>${m.hip}</td>

            <!-- Kurta -->
            <td>${m.chestKurta}</td>
            <td>${m.waistKurta}</td>
            <td>${m.lengthKurta}</td>
            <td>${m.shoulderKurta}</td>

            <!-- ✅ Update Button -->
            <td>
      <a href="updateMeasurementForm?id=${m.id}" class="btn btn-sm btn-primary">Update</a>

</td>

        </tr>
    </c:forEach>
</tbody>

                </table>

                <c:if test="${empty measurements}">
                    <div class="text-center text-danger mt-4">
                        <strong>No measurement data available.</strong>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
