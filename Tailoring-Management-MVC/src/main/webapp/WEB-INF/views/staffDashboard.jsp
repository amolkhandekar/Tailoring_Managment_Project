<%@ page session="true" %>
<%@ page import="com.rt.dto.UserReqDTO" %>

<%
    // ✅ Get user from session
    UserReqDTO user = (UserReqDTO) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- ✅ Include header and sidebar -->
<jsp:include page="modules/header.jsp" />
<jsp:include page="modules/sidebar.jsp" />

<!-- ✅ Main Dashboard Content -->
<div class="container">
    <h2>Welcome, <%= user.getEmail() %>!</h2>

    <!-- ✅ Role-based section -->
    <%
        String role = user.getRole();
        if ("ADMIN".equalsIgnoreCase(role)) {
    %>
        <h4>Admin Dashboard</h4>
    <% } else if ("USER".equalsIgnoreCase(role)) { %>
        <h4>User Dashboard</h4>
    <% } else if ("STAFF".equalsIgnoreCase(role)) { %>
        <h4>Staff Dashboard</h4>
    <% } else { %>
        <h4>Unknown Role</h4>
    <% } %>

    <!-- ✅ Cards Row (example) -->
    <div class="row mt-4">
        <!-- Card 1 -->
        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Capacity</h5>
                    <p class="card-text">150GB</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Update Now</small>
                </div>
            </div>
        </div>
        <!-- Add more cards as needed -->
    </div>

    <!-- ✅ Logout link -->
    <a href="logout">Logout</a>
</div>

<!-- ✅ Include footer if any -->
<jsp:include page="modules/footer.jsp" />
