<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<main>

    <div class = "container mt-4">
        <h4>
            Notifications
            <i class="fa fa-bell ml-2" aria-hidden="true"></i>
            <c:if test = "${fn:length(notificationList) > 0}">
            	<a id = "btnClearNotifications" class = "float-right d-none" href = "javascript:void(0)" style = "font-size: 16px;"> Clear all </a>
        	</c:if>
        </h4>
        <hr />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="<c:url value = '/view-profile' />" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="<c:url value = '/notifications' />" class="list-group-item active">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="<c:url value = '/order-list' />" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="<c:url value = '/shipping' />" class="list-group-item">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="<c:url value = '/your-address' />" class="list-group-item">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addresses
                        </a>
                        <a href="<c:url value = '/account-settings' />" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>
                        <a href="<c:url value = '/sign-out' />" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>
                </div>



            </div>

            <div class="col-lg-9">
            
            	<c:choose>
            	
            		<c:when test = "${fn:length(notificationList) > 0}">

		                <div class="row">
		                    <div class="col-md-12">
		
		                        <div class = "notifications d-none">
		                            <div class="list-group">    
											  	
										<c:forEach var = "notificationItem" items = "${notificationList}">
													  	
											<span class="list-group-item list-group-item-action flex-column align-items-start notification-link pl-4 pr-4">
												<div class="d-flex w-100 justify-content-between">
													<h6 class="mb-1"> ${notificationItem.header} </h6>
													<button type="button" class="close delete-notification" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>													
													<input type = "hidden" id = "notificationId" value = "${notificationItem.notificationId}" />
												</div>
												<p class="mb-1">${notificationItem.description} </p>
												<small>${notificationItem.date}</small>
											</span>
													  		
										</c:forEach>
										
										<div class = "no-notification mx-auto mt-5" style = "display: none;">
			                            	<h4> No notifications yet </h4>
			                            </div>
											
		                            </div>
		
		                        </div>
		                        
		                        <div class = "notificationsLoadingDisplay text-center mt-2">
			                        	<img src = "<c:url value = '/resources/customer/img/loader.gif' />"
			                        		 width = "50" height = "50" />
		                        </div>
		
		                    </div>
		                </div>
		
		                <div class = "row mt-3">
		                    <a id = "btnSeeMoreNotifications" class = "blue-text mx-auto btnSeeMore d-none" href = "javascript:void(0)"> See more </a>
		                	<img class = "see-more-loader mx-auto" style = "display:none;" src = "<c:url value = '/resources/customer/img/loader.gif' />" height ="50" width = "50" />
		                </div>
	                
	                </c:when>
	                
	                <c:otherwise>
	    				
	    				<div class = "row mt-5">
	    					<div class = "col-md-12">
		                    	<h4 class = "text-center"> No notifications yet </h4>
		                	</div>
		                </div>
	    					    				            
	                </c:otherwise>
                
                </c:choose>


            </div>

        </div>

        <hr />
    </div>

</main> 