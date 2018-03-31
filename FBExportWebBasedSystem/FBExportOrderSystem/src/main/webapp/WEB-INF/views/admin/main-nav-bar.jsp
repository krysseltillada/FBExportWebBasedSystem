<%@ include file = "../../lib/tags/tag-libraries.jsp" %>


<sql:query var="notificationsListQuery" 
	       dataSource = "${dataSource}">
	       SELECT sn.notification_id, sn.date, sn.description, sn.header, sn.is_seen, sn.system_notification_status FROM system_notification sn 
	       INNER JOIN employee_system_notification_list esnl ON sn.notification_id = esnl.system_notification_list_notification_id WHERE esnl.employee_id = ${sessionScope.employeeId} AND sn.is_seen = false
		   ORDER BY sn.date DESC
</sql:query>


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
	
	            <li class="nav-item d-flex align-items-center" id = "main-nav-date-time" style = "color: black;">
	              loading..
	            </li>
	
	
	            <li class="nav-item dropdown"> 
	            	<a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link pr-0">
		            	<i class="fa fa-bell-o"></i>
		            	<c:if test = "${fn:length(notificationsListQuery.rows) > 0}">
		            		<span class="badge bg-red">${fn:length(notificationsListQuery.rows)}</span>
		            	</c:if>
	            	</a>
	            	
	            	
	                <ul aria-labelledby="notifications" class="dropdown-menu pb-0">
	                
	                	<div style = "max-height: 280px; overflow-y: auto;">
	                	</div>
		      
		                <li>
		                	<a data-toggle="modal" data-target="#notificationModal" rel="nofollow" href="javascript:void(0)" class="dropdown-item all-notifications text-center"> 
		                		<strong>view all notifications</strong>
		                	</a>
		               </li>
	                </ul>
	            </li>
	            
	            
				<!--  
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
	            </li> -->
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

<div id="notificationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" class="modal fade text-left" style="display: none;" aria-hidden="true">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 id="exampleModalLabel" class="modal-title">Notifications <i class="fa fa-bell ml-1"></i> </h4>
				<button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
			
								
				<div class="list-group" style = "max-height: 375px; overflow-y: auto;">
				
				<!--  
						<span class="list-group-item list-group-item-action flex-column align-items-start">
							<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">${notificationItem.header} <i class="fa fa-envelope circle bg-green circle ml-1"></i> </h5>
							<small>${notificationItem.date}</small>
							</div>
							<p class="mb-1">${notificationItem.description}.</p>
						</span>
						
						-->
					
					
				</div>
			</div>
		</div>
	</div>
</div>