<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon-32x32.png" type="image/png"/>

    <!-- Plugins -->
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>

    <!-- Loader -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/pace.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pace.min.js"></script>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-extended.css" rel="stylesheet">

    <!-- Fonts + App Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet">

    <!-- Theme Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dark-theme.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/semi-dark.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/header-colors.css"/>

   <title>Tailoring_Management</title>

<style>
    /* Sidebar Hide/Show */
    body.sidebar-collapsed .sidebar-wrapper {
        width: 0;
        overflow: hidden;
        transition: all 0.3s ease;
    }
    .sidebar-wrapper {
        width: 260px;
        transition: all 0.3s ease;
    }
</style>
</head>

<body>
<!-- Wrapper -->
<div class="wrapper">

    <!-- Sidebar Wrapper -->
    <div class="sidebar-wrapper" id="sidebar" data-simplebar="true">
        <!-- Sidebar Header -->
        <div class="sidebar-header d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center gap-2">
                <img src="${pageContext.request.contextPath}/resources/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
                <h4 class="logo-text mb-0">Tailoring</h4>
            </div>
            <!-- Close/Collapse Button -->
            <button class="btn btn-sm btn-outline-light" onclick="toggleSidebar()">
                <i class='bx bx-x'></i>
            </button>
        </div>

        <!-- Navigation -->
        <ul class="metismenu" id="menu">
            <!-- Dashboard -->
            <li>
                <a href="${pageContext.request.contextPath}/index">
                    <div class="parent-icon"><i class='bx bx-home-alt'></i></div>
                    <div class="menu-title">Dashboard</div>
                </a>
            </li>

            <!-- Customer -->
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-user text-info'></i></div>
                    <div class="menu-title">Customer</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/addUser"><i class='bx bx-plus-circle text-success'></i>Add Customer</a></li>
                    <li><a href="${pageContext.request.contextPath}/viewAllCustomer"><i class='bx bx-show text-primary'></i>View All Customers</a></li>
                </ul>
            </li>

            <!-- Measurement -->
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-ruler text-success'></i></div>
                    <div class="menu-title">Measurement</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/customerMeasurement"><i class='bx bx-plus-circle text-success'></i>Add Measurement</a></li>
                    <li><a href="${pageContext.request.contextPath}/viewAllMeasurement"><i class='bx bx-show text-primary'></i>View Measurement</a></li>
                </ul>
            </li>

            <!-- Orders -->
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-cart text-warning'></i></div>
                    <div class="menu-title">Orders</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/addorder"><i class='bx bx-plus-circle text-success'></i>Add Order</a></li>
                    <li><a href="${pageContext.request.contextPath}/viewAllOrders"><i class='bx bx-list-ul text-primary'></i>View All Orders</a></li>
                </ul>
            </li>

            <!-- Reports -->
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-bar-chart text-danger'></i></div>
                    <div class="menu-title">Report</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/dailyreport"><i class='bx bx-calendar-day text-success'></i>Daily Report</a></li>
                    <li><a href="${pageContext.request.contextPath}/monthlyreport"><i class='bx bx-calendar text-primary'></i>Monthly Report</a></li>
                    <li><a href="${pageContext.request.contextPath}/OrderStatusReport/Pending"><i class='bx bx-time text-warning'></i>Pending Orders</a></li>
                    <li><a href="${pageContext.request.contextPath}/OrderStatusReport/Delivered"><i class='bx bx-check text-success'></i>Delivered Orders</a></li>
                </ul>
            </li>
        </ul>
        <!-- End Navigation -->
    </div>
    <!-- End Sidebar Wrapper -->

</div>
<!-- End Wrapper -->

<!-- Sidebar Toggle Script -->
<script>
function toggleSidebar() {
    document.body.classList.toggle("sidebar-collapsed");
}
</script>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script>
    $(document).ready(function () {
        $('#menu').metisMenu(); // Initialize MetisMenu
    });
</script>
</body>
</html>
