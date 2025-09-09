<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/modules/header.jsp" %>
<%@ include file="/WEB-INF/views/modules/sidebar.jsp" %>

<div class="main-panel">
    <div class="content d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="card shadow-sm rounded" style="width: 500px;">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0 text-center">Update Customer</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/updateCustomer" method="post">
                    <input type="hidden" name="id" value="${customer.id}" />
                    <input type="hidden" name="registrationDate" value="${customer.registrationDate}" />

                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" id="name" value="${customer.name}" required />
                    </div>

                    <div class="mb-3">
                        <label for="mobile" class="form-label">Mobile Number</label>
                        <input type="text" name="mobile" class="form-control" id="mobile" value="${customer.mobile}" required />
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" id="email" value="${customer.email}" />
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea name="address" class="form-control" id="address" rows="3">${customer.address}</textarea>
                    </div>

                    <div class="d-flex justify-content-center gap-3">
                   <button type="submit" class="btn btn-success px-4">Update</button>
                   <a href="${pageContext.request.contextPath}/viewAllCustomer" class="btn btn-secondary px-4">Cancel</a>
                 </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/modules/footer.jsp" %>
