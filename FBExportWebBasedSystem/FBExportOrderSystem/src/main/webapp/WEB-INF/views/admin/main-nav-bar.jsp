<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="header">
    <nav class="navbar bg-white" style = "color: black;">
      
        <div class="container-fluid pl-3 pr-3">
	        <div class="navbar-holder d-flex align-items-center justify-content-between">
	            <div class="navbar-header">
	
	            <!-- Navbar Brand -->
	            <a href="<c:url value = '/admin/dashboard' />" class="navbar-brand">
	                <div class="brand-text brand-big">
	                <span> <img alt="Company Logo" width="30" height="30" src="<c:url value = '/resources/admin/company-logo.png' /> ">  Fong Bros International Corporation </span>
	                </div>
	                <div class="brand-text brand-small">
	                <strong>FB</strong>
	                </div>
	            </a>
	
	                <a id="toggle-btn" href="#" class="menu-btn active small">
	                <span></span><span></span><span></span></a>
	            </div>
	            <!-- Navbar Menu -->
	            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center" style = "color: #0395F7;">
	
	            <li class="nav-item d-flex align-items-center mr-3" id = "main-nav-date-time" style = "color: black;">
	              loading..
	            </li>
	
	
	            <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red">12</span></a>
	                <ul aria-labelledby="notifications" class="dropdown-menu">
	                <li><a rel="nofollow" href="#" class="dropdown-item">
	                    <div class="notification">
	                        <div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
	                        <div class="notification-time"><small>4 minutes ago</small></div>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item">
	                    <div class="notification">
	                        <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
	                        <div class="notification-time"><small>4 minutes ago</small></div>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item">
	                    <div class="notification">
	                        <div class="notification-content"><i class="fa fa-upload bg-orange"></i>Server Rebooted</div>
	                        <div class="notification-time"><small>4 minutes ago</small></div>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item">
	                    <div class="notification">
	                        <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
	                        <div class="notification-time"><small>10 minutes ago</small></div>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a></li>
	                </ul>
	            </li>

	            <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange">10</span></a>
	                <ul aria-labelledby="notifications" class="dropdown-menu">
	                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
	                    <div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
	                    <div class="msg-body">
	                        <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
	                    <div class="msg-profile"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
	                    <div class="msg-body">
	                        <h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
	                    <div class="msg-profile"> <img src="img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
	                    <div class="msg-body">
	                        <h3 class="h5">Ashley Wood</h3><span>Sent You Message</span>
	                    </div></a></li>
	                <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages    </strong></a></li>
	                </ul>
	            </li>
	            <!-- Logout    -->
	            <li class="nav-item">
	                <a href="<c:url value = '/admin/sign-out' />" class="nav-link logout" style = "color:black;">
	                Logout
	                <i class="fa fa-sign-out"></i>
	                </a>
	            </li>
	            </ul>
	        </div>
        </div>
    </nav>
</header>