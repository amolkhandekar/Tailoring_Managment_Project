<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Measurement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
</head>
<body>

<%@ include file="/WEB-INF/views/modules/sidebar.jsp" %>
<%@ include file="/WEB-INF/views/modules/header.jsp" %>

<div class="page-wrapper">
    <div class="page-content">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Update Measurement</h2>

            <form action="${pageContext.request.contextPath}/updateMeasurement" method="post">
                <input type="hidden" name="id" value="${measurement.id}"/>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label>Customer Name</label>
                        <input type="text" name="customerName" class="form-control" value="${measurement.customerName}" required/>
                    </div>
                    <div class="col-md-6">
                        <label>Registration Date</label>
                        <fmt:formatDate value="${measurement.registrationDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
<input type="date" name="registrationDate" class="form-control" value="${formattedDate}" required/>

                    </div>
                </div>

                

                <h5 class="mt-4">Shirt Measurements</h5>
                <div class="row mb-3">
                    <div class="col-md-3"><input type="number" step="0.01" name="chest" placeholder="Chest" class="form-control" value="${measurement.chest}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="waist" placeholder="Waist" class="form-control" value="${measurement.waist}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="shoulder" placeholder="Shoulder" class="form-control" value="${measurement.shoulder}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="sleeve" placeholder="Sleeve" class="form-control" value="${measurement.sleeve}"/></div>
                    <div class="col-md-3 mt-2"><input type="number" step="0.01" name="length" placeholder="Length" class="form-control" value="${measurement.length}"/></div>
                </div>

                <h5 class="mt-4">Pant Measurements</h5>
                <div class="row mb-3">
                    <div class="col-md-3"><input type="number" step="0.01" name="waistPant" placeholder="Waist Pant" class="form-control" value="${measurement.waistPant}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="inseam" placeholder="Inseam" class="form-control" value="${measurement.inseam}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="lengthPant" placeholder="Length Pant" class="form-control" value="${measurement.lengthPant}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="hip" placeholder="Hip" class="form-control" value="${measurement.hip}"/></div>
                </div>

                <h5 class="mt-4">Kurta Measurements</h5>
                <div class="row mb-4">
                    <div class="col-md-3"><input type="number" step="0.01" name="chestKurta" placeholder="Chest Kurta" class="form-control" value="${measurement.chestKurta}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="waistKurta" placeholder="Waist Kurta" class="form-control" value="${measurement.waistKurta}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="lengthKurta" placeholder="Length Kurta" class="form-control" value="${measurement.lengthKurta}"/></div>
                    <div class="col-md-3"><input type="number" step="0.01" name="shoulderKurta" placeholder="Shoulder Kurta" class="form-control" value="${measurement.shoulderKurta}"/></div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update</button>


                    <a href="${pageContext.request.contextPath}/measurements" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
