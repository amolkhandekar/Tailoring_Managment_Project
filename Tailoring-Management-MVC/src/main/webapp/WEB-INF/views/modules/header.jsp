<%@ page session="true" %>
<%@ page import="com.rt.dto.UserReqDTO" %>
<%
    String name = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("userRole");
    if (name == null) { name = "Guest"; }
    if (role == null) { role = "User"; }
%>

<!--start header -->
<header>
    <div class="topbar d-flex align-items-center">
        <nav class="navbar navbar-expand gap-3">


            <div class="search-bar d-lg-block d-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
                <a href="javascript:;" class="btn d-flex align-items-center">
                    <i class='bx bx-search'></i>Search
                </a>
            </div>

            <div class="top-menu ms-auto">
                <ul class="navbar-nav align-items-center gap-1">
                    <li class="nav-item mobile-search-icon d-flex d-lg-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
                        <a class="nav-link" href="javascript:;"><i class='bx bx-search'></i></a>
                    </li>
                </ul>
            </div>
  
  
                     <div class="user-box dropdown px-3">
						<a class="d-flex align-items-center nav-link dropdown-toggle gap-3 dropdown-toggle-nocaret" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							 <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" 
                        class="user-img" alt="user avatar">
							 <div class="user-info">
                        <p class="user-name mb-0"><%= name %></p>
                        <p class="designattion mb-0"><%= role %></p>
                    </div>
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							
								<div class="dropdown-divider mb-0"></div>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-log-out-circle"></i><span>Logout</span></a>
							</li>
						</ul>
					</div>
            <!-- User Profile -->
            
            <!-- End User Profile -->

        </nav>
    </div>
</header>
<!--end header -->

<!-- Sidebar Toggle Script -->
<script>
    function toggleSidebar() {
        const sidebar = document.querySelector(".sidebar-wrapper"); // sidebar.jsp मधली main div
        sidebar.classList.toggle("d-none"); // Bootstrap class लावली की hide/show होईल
    }
</script>
    <!-- existing footer content -->

    <!-- Sidebar Toggle Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const sidebar = document.getElementById("sidebar");
            const toggleBtn = document.getElementById("sidebarToggle");

            if (toggleBtn && sidebar) {
                toggleBtn.addEventListener("click", function () {
                    sidebar.classList.toggle("d-none");
                });
            }
        });
    </script>
</body>
</html>

