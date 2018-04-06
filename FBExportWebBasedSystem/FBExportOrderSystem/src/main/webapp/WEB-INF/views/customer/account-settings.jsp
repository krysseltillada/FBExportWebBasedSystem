<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<main>

    <div class = "container mt-4">

        <h4 class = "pt-3">
            Account Settings
            <i class="fa fa-gear ml-2" aria-hidden="true"></i>
        </h4>

        <hr />
    </div>

    <div class="container mt-4">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="<c:url value = '/view-profile' />" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="<c:url value = '/notifications' />" class="list-group-item">
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
                        <a href="<c:url value = '/account-settings' />" class="list-group-item active">
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

                <div class="row">
                    <div class="col-md-12">

                        <div class = "row">
                            <div class = "col">
                                <h3> Edit Account </h3>
                                <hr />
                            </div>
                        </div>
                        
                        <c:if test="${not empty errorMessages}">
        	
				        	<c:forEach var = "errorMessage" items = "${errorMessages}">
				        		<span class = "red-text"> *<c:out value="${errorMessage}" /> </span> <br />
				        	</c:forEach>
							
							<hr />
								        
				        </c:if>
				        
				        <c:if test="${not empty successMessages}">
				        
				        	<c:forEach var = "successMessage" items = "${successMessages}">
				        		<span class = "green-text"> *<c:out value="${successMessage}" /> </span> <br />
				        	</c:forEach>
							<hr />
								        
				        </c:if>

                        <div class = "row">

                            <div class = "col">
                                <form action = "<c:url value = '/edit-account' />" method = "POST" enctype = "multipart/form-data">

                                        <div class = "row">
                                            <div class = "col-md-12">

                                                <fieldset>
                                                    <legend> Login details </legend>

                                                    <div class = "row mt-3 justify-content-md-center">

                                                        <div class="col-md-3 text-center">

                                                        <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' 
                                                        	 src = "<c:url value='${sessionScope.customerProfileImageLink}' />" width = "150" height = "150" />

                                                        <p class="file">
                                                            <input type="file" name="profile-image" id="edit-profile-image" accept="image/x-png,image/jpeg" />
                                                            <label for="edit-profile-image" class = "pr-4 pl-4">Change image</label>
                                                        </p>
                                                        </div>

                                                        <div class = "col-md-6">
                                                            <div class="md-form form-sm">
                                                                <input name = "username" type="text" id="username" class="form-control" length = "20" value = "${customer.username}" required/>
                                                                <label for="username" class="">Username</label>
                                                            </div>
                                                            <div class="md-form form-sm">
                                                                <input name = "oldpassword" type="password" id="old-password" class="form-control" length = "20" />
                                                                <label for="password" class="">Old password</label>
                                                            </div>
                                                            <div class="md-form form-sm">
                                                                <input name = "newpassword" type="password" id="new-password" class="form-control" length = "20" />
                                                                <label for="password" class="">New password</label>
                                                                
                                                            </div>
                                                            
                                                            <input type="checkbox" id="showPassword" />
		                        							<label for="showPassword"> Show Password </label>
                                                        </div>



                                                    </div>

                                                </fieldset>

                                            </div>
                                        </div>

                                        <div class = "row">
                                            <div class = "col-md-12">
                                                <fieldset>
                                                    <legend> Basic information </legend>

                                                    <div class = "row mt-3">
                                                            <div class = "col-md-4">
                                                                <div class="md-form form-sm">
                                                                    <input name = "firstname" type="text" id="firstname" class="form-control" value = "${customer.firstname}" required />
                                                                    <label for="firstname" class="">First Name</label>
                                                                </div>
                                                            </div>
                                                            <div class = "col-md-4">
                                                                <div class="md-form form-sm">
                                                                    <input name = "middlename" type="text" id="middlename" class="form-control" value = "${customer.middlename}" required />
                                                                    <label for="middlename" class="">Middle Name</label>
                                                                </div>
                                                            </div>
                                                            <div class = "col-md-4">
                                                                <div class="md-form form-sm">
                                                                    <input name = "lastname" type="text" id="lastname" class="form-control" value = "${customer.lastname}" required />
                                                                    <label for="lastname" class="">Last Name</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    <div class = "row">

                                                        <div class = "col-md-1">
                                                            <label> Gender: </label>
                                                        </div>

                                                        <div class = "col-md-11 form-inline mb-2">

                                                            <div class="form-group form-sm">
                                                                <input class="mr-2" 
                                                                	   type="radio" 
                                                                	   name="edit-profile-gender" 
                                                                	   value="Male" 
                                                                	   id="male" 
                                                                	   required ${ (customer.gender == 'MALE') ? 'checked' : '' } />
                                                                	   
                                                                <label for="male"> Male </label>
                                                            </div>

                                                            <div class="form-group form-sm">
                                                                <input class="mr-2" 
                                                                	   type="radio" 
                                                                	   name="edit-profile-gender" 
                                                                	   id="female" 
                                                                		value="Female" ${ (customer.gender == 'FEMALE') ? 'checked' : '' }/>
                                                                <label for="female"> Female </label>
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <div class = "row mt-3">
                                                        <div class = "col-md-1">
                                                            <label class = "mt-2" for = "age"> Age: </label>
                                                        </div>

                                                        <div class = "col-md-11 form-inline mb-2">

                                                            <div class="form-group form-sm">
                                                                <input  name="age" type="number" min = "1" class="with-gap" value = "${customer.age}" placeholder="your age" id = "age" required />
                                                            </div>

                                                        </div>

                                                    </div>

                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class = "row mt-4">
                                            <div class = "col-md">
                                                <fieldset>
                                                    <legend> Address information </legend>


                                                    <div class = "row mt-3" style = "height: 50px;">
                                                        <div class = "col-md-7">

                                                            <div class = "form-inline">
                                                                    <label for = "country" class = "mr-3"> Country: </label>
                                                                    <select name = "country" class="browser-default country" required>
                                                                      
                                                                    </select>
                                                            </div>

                                                        </div>
                                                        <div class = "col-md-5">

                                                            <div class="md-form form-sm" style = "position: relative; top: -20px;">
                                                                <input name = "city" type="text" value = "${customer.address.city}" id="city" class="form-control" required/>
                                                                <label for="city" class=""> city </label>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class = "row">
                                                        <div class = "col-md-7">
                                                            <div class="md-form form-sm mt-3">

                                                                <textarea name = "address" type="text" id="address" class="md-textarea" required>${customer.address.address}</textarea>
                                                                <label for="address">Address</label>

                                                            </div>

                                                        </div>
                                                        <div class = "col-md-5">
                                                            <div class="md-form form-sm" style = "margin-top: 75px;">
                                                                <input name = "zipcode" maxlength = "7" type="text" id="zipcode" class="form-control" value = "${customer.address.zipCode}" required />
                                                                <label for="zipcode">Zip Code</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class = "row">
                                            <div class = "col-md-12">
                                                <fieldset>
                                                    <legend> Contact Information </legend>

                                                    <div class = "row">

                                                            <div class = "col-md-2 mt-4">

                                                                <select name = "country-code" class="browser-default countryCode" required>
                                                                </select>

                                                            </div>
                                                            <div class = "col-md-5 mt-1">

                                                                <div class="md-form form-sm">
                                                                        <input name = "phone-number" maxlength = "15" type="text" id="phonenumber" value = "${customer.contact.phoneNumber}" class="form-control" required />
                                                                        <label for="phonenumber" class="">Phone Number</label>
                                                                </div>
                                                            </div>

                                                                <div class = "col-md-5 mt-1">
                                                                <div class="md-form form-sm">
                                                                        <input name = "email-address" type="text" id="email" value = "${customer.contact.emailAddress}" class="form-control" required />
                                                                        <label for="email" class="">Email Address</label>
                                                                </div>
                                                            </div>

                                                    </div>

                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class = "row">
                                            <div class = "col-12 text-right">

                                                <input type="submit" class="btn btn-primary" value = "edit" />

                                                <hr />

                                            </div>
                                        </div>
                                        
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        

                                </form>
                            </div>

                        </div>

                </div>


            </div>

        </div>

        <hr />
    </div>



</main> 