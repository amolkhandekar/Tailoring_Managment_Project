
<!doctype html>
<html lang="en">


<!-- Mirrored from codervent.com/rocker/demo/vertical/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Mar 2025 11:56:00 GMT -->
<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="resources/assets/images/favicon-32x32.png" type="image/png"/>
	<!--plugins-->
	<link href="resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
	<link href="resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>
	<!-- loader-->
	<link href="resources/assets/css/pace.min.css" rel="stylesheet"/>
	<script src="resources/assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/assets/css/bootstrap-extended.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
	<link href="resources/assets/css/app.css" rel="stylesheet">
	<link href="resources/assets/css/icons.css" rel="stylesheet">
	<!-- Theme Style CSS -->
	<link rel="stylesheet" href="resources/assets/css/dark-theme.css"/>
	<link rel="stylesheet" href="resources/assets/css/semi-dark.css"/>
	<link rel="stylesheet" href="resources/assets/css/header-colors.css"/>
	<title>Rocker - Bootstrap 5 Admin Dashboard Template</title>
</head>

<body>
	<!--wrapper-->
	<div class="wrapper">
		<!--sidebar wrapper -->
		<div class="sidebar-wrapper" data-simplebar="true">
			<div class="sidebar-header">
				<div>
					<img src="resources/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
				</div>
				<div>
					<h4 class="logo-text">Tailoring</h4>
				</div>
				<div class="toggle-icon ms-auto"><i class='bx bx-arrow-back'></i>
				</div>
			 </div>
			<!--navigation-->
			<ul class="metismenu" id="menu">
    <!-- Dashboard -->
    <li>
        <a href="/index">
            <div class="parent-icon"><i class='bx bx-home-alt'></i></div>
            <div class="menu-title">Dashboard</div>
        </a>
    </li>

    <!-- Customers -->
   <!-- Customer -->
<li>
    <a href="javascript:;" class="has-arrow">
        <div class="parent-icon"><i class='bx bx-user text-info'></i></div>
        <div class="menu-title">Customer</div>
    </a>
    <ul class="mm-collapse">
        <li>
            <a href="/addUser">
                <i class='bx bx-plus-circle text-success'></i>Add Customer
            </a>
        </li>
        
        <li>
            <a href="/viewAllCustomer">
                <i class='bx bx-show text-primary'></i>View All Customers
            </a>
        </li>
    </ul>
</li>


    <!-- Measurement -->
    <!-- Measurement -->
<li>
    <a href="javascript:;" class="has-arrow">
        <div class="parent-icon"><i class='bx bx-ruler text-success'></i></div>
        <div class="menu-title">Measurement</div>
    </a>
    <ul class="mm-collapse">
        <li>
            <a href="/customerMeasurement">
                <i class='bx bx-plus-circle text-success'></i>Add Measurement
            </a>
        </li>
        
        <li>
            <a href="/viewAllMeasurement">
                <i class='bx bx-show text-primary'></i>View Measurement
            </a>
        </li>
    </ul>
</li>
<!-- Orders -->
<li>
    <a href="javascript:;" class="has-arrow">
        <div class="parent-icon"><i class='bx bx-cart text-warning'></i></div>
        <div class="menu-title">Orders</div>
    </a>
    <ul class="mm-collapse">
        <li>
            <a href="/addorder">
                <i class='bx bx-plus-circle text-success'></i>Add Order
            </a>
        </li>
        
        <li>
            <a href="/viewAllOrders">
                <i class='bx bx-list-ul text-primary'></i>View All Orders
            </a>
        </li>
    </ul>
</li>


</ul>

			<!--end navigation-->
		</div>
		<script src="resources/assets/js/jquery.min.js"></script>
<script src="resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script>
  $(function() {
    $('#menu').metisMenu(); // This initializes the dropdown behavior
  });
</script>
		