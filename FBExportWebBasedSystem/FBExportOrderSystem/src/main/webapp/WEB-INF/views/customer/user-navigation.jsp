 <%@ include file = "../../lib/tags/tag-libraries.jsp" %>
 
 <!--user Navigation sign out nav-->
 
 <security:authorize access = "!hasAuthority('CUSTOMER')">
 
	<header>
	
	    <nav class="navbar navbar-expand-lg navbar-dark black">
	
	        <div class = "container">
	
	            <ul class="navbar-nav mr-auto">
	                <li class="nav-item">
	                    <a class="nav-link white-text sub-nav-date" href="#"></a>
	                </li>
	                
	            </ul>
	            <ul class="navbar-nav nav-flex-icons">
	                <li class="nav-item">
	                    <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/login' />">
	                        <i class="fa fa-user" aria-hidden="true"></i>
	                        <span> LOGIN </span>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/sign-up' />">
	                        <i class="fa fa-user-plus" aria-hidden="true"></i>
	                        <span> SIGN UP </span>
	                    </a>
	                </li>
	            </ul>
	
	        </div>
	
	    </nav>
	
	</header>

</security:authorize>

<!--user Navigation-->


<security:authorize access = "hasAuthority('CUSTOMER')">
	<header>
	
		<input type = "hidden" value = '${sessionScope.customerId}' id = "customer-id"/>
	
	    <nav class="navbar navbar-expand-lg navbar-dark black">
	
	        <div class = "container">
	
	                <ul class="navbar-nav mr-auto">
	                <li class="nav-item">
	                        <a class="nav-link white-text sub-nav-date" href="#"></a>
	                    </li>
	                </ul>
	                <ul class="navbar-nav nav-flex-icons">
	                    <li class="nav-item">
	
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/view-profile' />">
	                            <span class = "font-weight-bold"> Welcome ${sessionScope.customerName}!</span>
	                            <img class = "ml-1" src = "<c:url value = '${sessionScope.customerProfileImageLink}' />" height = "20" width = "20" alt = "profile image" id="profileImage"/>
	                        </a>
	
	                    </li>
	                    <li class="nav-item">
	
	                        
	                        <div class="dropdown">
	                            <a class = "nav-link waves-effect waves-light pl-0 white-text" id="dropDownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            <span class = "font-weight-bold"> 1 </span>
	                                <i class="fa fa-bell" aria-hidden="true"></i>
	                            </a>
	                            <div class="dropdown-menu" aria-labelledby="dropDownNotification" style = "left: -275px; width: 500px;">
	                            <h6 class="dropdown-header">
	                                <span> Notifications </span>
	                                <span class = "float-right"> Clear all </span>
	                            </h6>
	
	                            <div style = "max-height: 380px; overflow-y: auto;">
	                                <div class="list-group">
	                                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start notification-link pl-4 pr-4">
	                                        <div class="d-flex w-100 justify-content-between">
	                                        <h6 class="mb-1">Order approved</h6>
	                                        <button type="button" class="close" aria-label="Close">
	                                                <span aria-hidden="true">&times;</span>
	                                        </button>
	                                        </div>
	                                        <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
	                                        <small> 1 day ago </small>
	                                    </a>
	
	
	                                </div>
	
	                            </div>
	
	                            <span class="dropdown-header text-center pb-0">
	                                <a class = "p-0" href = "#"> see more </a>
	                            </span>
	
	                            </div>
	                        </div>
	
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/view-profile' />">
	                            <i class="fa fa-user" aria-hidden="true"></i>
	                            <span> PROFILE </span>
	                        </a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/sign-out' />">
	                            <i class="fa fa-sign-out" aria-hidden="true"></i>
	                            <span> SIGN OUT </span>
	                        </a>
	                    </li>
	                </ul>
	
	        </div>
	
	    </nav>
	
	</header>
</security:authorize>



