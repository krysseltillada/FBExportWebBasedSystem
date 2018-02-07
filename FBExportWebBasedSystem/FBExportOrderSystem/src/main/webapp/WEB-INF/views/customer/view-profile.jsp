<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<main>

    <div class = "container mt-4">
        <h4>
            View Profile
            <i class="fa fa-user ml-2" aria-hidden="true"></i>
        </h4>
        <hr />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="#" class="list-group-item active">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addreses
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>
                </div>

            </div>

            <div class="col-lg-9">

                <div class="row">
                    <div class="col-md-12">

                        <div class = "view-profile">
                            <div class="profile-div">

                                    <div class = "row">
                                        <div class = "col-md-3">
                                            <img src = "${customer.profileImageLink}" height = "150" width = "150" />
                                        </div>
                                        <div class = "col-md-9">
                                            <h4> 
                                            	${customer.firstname += " " += customer.middlename += " " += customer.lastname} 
                                            	(${customer.contact.emailAddress}) <a style = "font-size: 14px;" href = "#"> (edit profile) </a> </h4>
                                            <p>

                                                ${customer.address.zipCode} ${customer.address.city}, ${customer.address.country} <br />
                                                ${customer.address.address}  <br />
                                                (+${customer.contact.countryCode}) ${customer.contact.phoneNumber}

                                            </p>

                                        </div>

                                    </div>
                            </div>

                            <hr />

                            <div class="activity-div">

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <h4>
                                            <i class="fa fa-th-list mr-2" aria-hidden="true"></i>
                                            <span> Activity </span>
                                            <a class = "float-right mr-3 mt-1 blue-text" href = "#" style = "font-size: 16px;"> Clear all </a>
                                        </h4>

                                        <hr />

                                        <div class="list-group">
                                        	
                                        	<c:choose>
                                        		<c:when test = "${not empty activityList}">
                                        		
                                        			<c:forEach var = "activity" items = "${activityList}">
                                        				
                                        				<span href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			                                                <div class="d-flex w-100 justify-content-between">
			                                                    <h5 class="mb-1">${activity.header}</h5>
			                                                    <button type="button" class="close" aria-label="Close">
			                                                            <span aria-hidden="true">&times;</span>
			                                                    </button>
			                                                </div>
			
			                                                <p class="mb-1">${activity.description}</p>
			                                                <small> ${activity.date} </small>
			                                            </span>
                                        				
                                        			</c:forEach>
                                        			 
			                                            
                                        		</c:when>
                                        		<c:otherwise>
                                        			<h1> tng ina mo </h1>
                                        		</c:otherwise>
                                        	</c:choose>
	                                        
                                           
                                            

                                        </div>


                                    </div>

                                </div>

                                <div class = "row">
                                            <a class = "mx-auto mt-2" href = "#"> See more </a>
                                </div>


                            </div>

                        </div>


                    </div>
                </div>



            </div>

        </div>

        <hr />
    </div>

</main>  