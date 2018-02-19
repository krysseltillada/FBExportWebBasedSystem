<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2" >Manage Accounts</span>
            <span class = "small float-right" > <a style="margin: 5px;" data-toggle="collapse" href="#collapseAdmins" aria-expanded="false" aria-controls="collapseExample"> Filter Admins <i class="fa fa-filter ml-1" aria-hidden="true"> </i> </a></span>
            <span class = "small float-right"  > <a style="margin: 5px;"data-toggle="collapse" href="#collapseEmployees" aria-expanded="false" aria-controls="collapseExample"> Filter Employees <i class="fa fa-filter ml-1" aria-hidden="true"> </i> </a></span>
            <span class = "small float-right" > <a style="margin: 5px;" data-toggle="collapse" href="#collapseClients" aria-expanded="false" aria-controls="collapseExample"> Filter Customers <i class="fa fa-filter ml-1" aria-hidden="true"> </i> </a></span>
        </div>
        </div>

    </div>
    </header>

    <ul class="nav nav-tabs nav-justified " role="tablist" style="background-color: #ecf0f1;">
        <li class="nav-item">
            <a style="color: #596275;" class="nav-link active" data-toggle="tab" href="#panel5" role="tab"><i class="fa fa-user"></i> Customers</a>
        </li>
        <li class="nav-item">
            <a style="color: #596275;" class="nav-link" data-toggle="tab" href="#panel6" role="tab"><i class="fa fa-user"></i> Employees</a>
        </li>
        <li class="nav-item">
            <a style="color: #596275;" class="nav-link" data-toggle="tab" href="#panel7" role="tab"><i class="fa fa-user"></i> Admins</a>
        </li>
    </ul>

    <div class="tab-content" >

        <!--Panel 1-->
        <div class="tab-pane fade in show active" id="panel5" role="tabpanel">

            <section class = "no-padding-top p-0">
            <div class = "container-fluid p-0">

                <div class="collapse " id="collapseClients">

                    <!--Filter-->

                    <div clsss = "row">

                    <div class = "col-lg-12 p-0 m-0">
                        <div class = "card m-0">
                        <div class = "card-body pt-2">

                            <table border="0" cellspacing="5" cellpadding="5" style="margin-top: 25px;">
                            <tbody>
                                <tr>
                                <td>Minimum age:</td>
                                <td><input type="text" id="minAgeClient" name="minAgeClient"></td>
                                <td>Country:</td>
                                <td>
                                    <select class="browser-default" id = "countryClient" style="width: 75%;">
                                        <option value="All" selected>All</option>
                                    </select>
                                </td>
                                </tr>
                                <tr>
                                    <td>Maximum age:</td>
                                    <td><input type="text" id="maxAgeClient" name="maxAgeClient"></td>
                                    <td>Account Status:</td>
                                    <td>
                                    <select class="browser-default" id="filterCustomerStatus" style="width: 75%;">
                                        <option value="All" selected>All</option>
                                        <option value="true" >Active</option>
                                        <option value="false">Inactive</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                <td>Gender:</td>
                                <td>
                                    <select class="browser-default" id="filterCustomerGender" style="width: 75%;">
                                        <option value="All" selected>All</option>
                                        <option value="Male" >Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </td>
                                </tr>
                            </tbody>
                            </table>

                        </div>
                        </div>
                    </div>
                    </div>

                    <!--Filter-->
                </div>

                <!--Edit Account Modal-->
                <!-- Modal -->
                    <div class="modal fade" id="editClientAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Client</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action=" <c:url value='/admin/edit-client' /> " id="formClientEdit" method="POST" enctype="multipart/form-data">
                                <div class="modal-body">
                                	<hr />
		                            <div id="errorClientEdit">
			                            
		                            </div>
		                            <hr />
                                    <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
	                                        <label class="form-control-label" for="usernameClientEdit">Username</label>
	                                        <input type="text" placeholder="Your username" id="usernameClientEdit" name="usernameClientEdit" class="form-control" required>
                                        	<a data-toggle="collapse" href="#changeUsernameClient" role="button" aria-expanded="false" aria-controls="collapseExample">
		    								Change Username?
		  									</a>
		  									<div class="collapse" id="changeUsernameClient">
		  										<div class="form-group">
				                                    <div class="form-inline">
					                                    <label class="mr-3 form-control-label" for="newUsernameClientEdit">New username</label>
					                                    <input type="text" placeholder="Your new username" class="form-control" id="newUsernameClientEdit" name="newUsernameClientEdit">
				                                    </div>
				                                </div>
		  									</div>
                                        </div>
                                        <div class="form-group">
	                                        <label class="form-control-label" for="firstnameClientEdit">Firstname</label>
	                                        <input type="text" placeholder="Your firstname" id="firstnameClientEdit" name="firstnameClientEdit" class="form-control" required>
                                        </div>
                                        <div class="form-group">
	                                        <label class="form-control-label" for="middlenameClientEdit">Middlename</label>
	                                        <input type="text" placeholder="Your middlename" class="form-control" id="middlenameClientEdit" name="middlenameClientEdit" required>
                                        </div>
                                        <div class="form-group">
	                                        <label class="form-control-label" for="lastnameClientEdit">Lastname</label>
	                                        <input type="text" placeholder="Your lastname" class="form-control" id="lastnameClientEdit" name="lastnameClientEdit" required>
                                        </div>
                                        <div class="form-group">
	                                        <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
	                                        <input id="maleClientEdit" type="radio" value="Male" name="genderClientEdit" class="radio-template" checked required>
	                                        <label for="maleClientEdit" style="margin-right: 10px;">Male</label>
	                                        <input id="femaleClientEdit" type="radio" value="Female" name="genderClientEdit" class="radio-template">
	                                        <label for="femaleClientEdit" style="margin-right: 10px;">Female</label>
                                        </div>
                                        <div class="form-group">
	                                        <div class="form-inline">
	                                            <label class="mr-3 form-control-label" for="ageClientEdit">Age</label>
	                                            <input type="number" style="width: 50%;"placeholder="Your age" name="ageClientEdit" min="18" max="100" value="18" required class="form-control" id="ageClientEdit">
	                                        </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
	                                        <label class="form-control-label" for="emailClientEdit">Email</label>
	                                        <input type="email" placeholder="Your email address" name="emailClientEdit" id="emailClientEdit" class="form-control" required>
                                        	<a data-toggle="collapse" href="#changeEmailClient" role="button" aria-expanded="false" aria-controls="collapseExample">
		    								Change Email?
		  									</a>
		  									<div class="collapse" id="changeEmailClient">
		  										<div class="form-group">
				                                    <div class="form-inline">
					                                    <label class="mr-3 form-control-label" for="newEmailClientEdit">New email</label>
					                                    <input type="email" placeholder="Your new username" class="form-control" id="newEmailClientEdit" name="newEmailClientEdit">
				                                    </div>
				                                </div>
		  									</div>
                                        </div>
                                        <div class="form-group">
	                                        <div class = "form-inline">
	                                                <label for = "countryClientEdit" class = "mr-3 form-control-label"> Country: </label>
	                                                <select class="browser-default" name="countryClientEdit" id = "countryClientEdit" style="width: 75%;" required>
	                                                    <option value="" disabled selected>Choose your country</option>
	                                                </select>
	                                        </div>
	                                        <div class="form-inline" >
	                                            <label for="cityClientEdit" class=" mr-3 form-control-label">City : </label>
	                                            <input type="text" name="cityClientEdit" id="cityClientEdit" style="width: 80%;" class="form-control" required disabled/>
	                                        </div>
                                        </div>
                                        <div class="form-group">
	                                        <label class="form-control-label" for="addressClientEdit">Address</label><br>
	                                        <textarea id="addressClientEdit" name="addressClientEdit" rows="3" cols="40" style="resize: none;"></textarea>
                                        </div>
                                        <div class="form-group">
	                                        <div class="form-inline">
	                                            <label class="form-control-label mr-3" for="zipcodeClientEdit">Zip Code : </label>
	                                            <input type="text" placeholder="Your zip code" id="zipcodeClientEdit" name="zipcodeClientEdit" class="form-control">
	                                        </div>
                                        </div>
                                        <div class="form-group">
                                            <select class="browser-default" id = "countryCodeClientEdit" name="countryCodeClientEdit" required>
                                                <option value="" disabled selected>Country Code</option>
                                            </select>
                                            <input type="text" id="phonenumberClientEdit" placeholder="Your phone number" class="form-control" name="phonenumberClientEdit" required />
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="submit" value="Save Changes" class="btn btn-primary"/>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>

                            </div>
                        </div>
                    </div>
                <!-- Edit Account Modal -->


                <div class = "row" >
                    <div class = "col-lg">
                    <div class = "card mb-0">
                        <div class="container" style="padding-top: 10px;">
                        <button type="button" width="100" id="btnUpdateClient" class="btn bg-blue float-right mr-1" title="Update Selected Item" data-toggle="modal" data-target="#editClientAccount"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
                        </div>
                        <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">

                        <table id="client-table" class="table table-striped table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th> </th>
                                    <th>Image</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>First Name</th>
                                    <th>Middle Name</th>
                                    <th>Last Name</th>
                                    <th>Gender</th>
                                    <th>Age</th>
                                    <th>Email Address</th>
                                    <th>Country</th>
                                    <th>City</th>
                                    <th>Address</th>
                                    <th>Zip Code</th>
                                    <th>Country Code</th>
                                    <th>Phone Number</th>

                                    <th>Active</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                <th></th>
                                <th>Image</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>First Name</th>
                                <th>Middle Name</th>
                                <th>Last Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Email Address</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Zip Code</th>
                                <th>Country Code</th>
                                <th>Phone Number</th>

                                <th>Active</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            	<c:if test="${not empty customerList}">
        	
						        	<c:forEach var = "customer" items = "${customerList}">
						        		<tr>
			                                <td><i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;" id="showActivity"></i></td>
			                                <td><img src="<c:out value = '${customer.profileImageLink}' />" height="100" width="100"/></td>
			                                <td class="usernameCustomerRow"><c:out value = "${customer.username} " /></td>
			                                <td><c:out value = "${customer.password}" /></td>
			                                <td><c:out value = "${customer.firstname}" /></td>
			                                <td><c:out value = "${customer.middlename}" /></td>
			                                <td><c:out value = "${customer.lastname}" /> </td>
			                                <td><c:out value = "${customer.gender}" /></td>
			                                <td><c:out value = "${customer.age }" /></td>
			                                <td><c:out value = "${customer.contact.emailAddress }"/></td>
			                                <td><c:out value = "${customer.address.country }"/></td>
			                                <td><c:out value = "${customer.address.city }"/></td>
			                                <td><c:out value = "${customer.address.address }"/></td>
			                                <td><c:out value = "${customer.address.zipCode }"/></td>
			                                <td><c:out value = "${customer.contact.countryCode }"/></td>
			                                <td><c:out value = "${customer.contact.phoneNumber }"/></td>
			
			                                <td>
			                                	<c:choose>
			                                		<c:when test="${not customer.enabled}">
			                                			<label class="switch">
			                                        		<input type="checkbox" name="isActive" id="isActive">
			                                        		<span class="slider round"></span>
			                                    		</label>
			                                		</c:when>
			                                		<c:otherwise>
			                                			<label class="switch">
					                                        <input type="checkbox" checked name="isActive" id="isActive">
					                                        <span class="slider round"></span>
					                                    </label>
			                                		</c:otherwise>
			                                	</c:choose>
			                                    
			                                </td>
			                            </tr>
						        	</c:forEach>
						        
						        </c:if>

                            </tbody>
                        </table>



                        </div>
                    </div>
                    </div>

                </div>

            </div>
            </section>
        </div>
        <!--/.Panel 1-->
        <!--Panel 2-->
        <div class="tab-pane fade" id="panel6" role="tabpanel">
            <section class = "no-padding-top p-0">

            <div class = "container-fluid p-0">

                <div class="collapse" id="collapseEmployees">

                <!--Filter-->

                <div clsss = "row">

                <div class = "col-lg-12 p-0 m-0">
                    <div class = "card m-0">
                    <div class = "card-body pt-2">
                        <table border="0" cellspacing="5" cellpadding="5" style="margin-top: 25px;">
                        <tbody>
                            <tr>
                            <td>Minimum age:</td>
                            <td><input type="text" id="minAgeEmployee" name="minAgeEmployee"></td>
                            <td>Country:</td>
                            <td>
                                <select class="browser-default" id = "countryEmployee" style="width: 75%;">
                                    <option value="All" selected>All</option>
                                </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Maximum age:</td>
                                <td><input type="text" id="maxAgeEmployee" name="maxAgeEmployee"></td>
                                <td>Account Status:</td>
                                <td>
                                <select class="browser-default" id="filterEmployeeStatus" style="width: 75%;">
                                    <option value="All" selected>All</option>
                                    <option value="true" >Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                            <td>Gender:</td>
                            <td>
                                <select class="browser-default" id="filterEmployeeGender" style="width: 75%;">
                                    <option value="All"selected>All</option>
                                    <option value="Male" >Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    </div>
                </div>
                </div>

                <!--Filter-->
            </div>


            <!-- Edit Employee -->
            <div class="modal fade" id="editEmployeeAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Employee</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form  action=" <c:url value='/admin/edit-employee' /> " id="formEmployeeEdit" method="POST" enctype="multipart/form-data">
                            <div class="modal-body">
                            <hr />
                            <div id="errorEmployeeEdit">
	                            
                            </div>
                            <hr />
                            
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadEmployeeEdit' src = "/../FBExportSystem/resources/admin/img/profile-male.jpg" />

                                    <p class="fileEmployeeAdd">
                                    <input type="file" name="fileEmployeeEdit" id="fileEmployeeEdit" accept="image/x-png,image/jpeg" />
                                    <label for="fileEmployeeEdit">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameEmployeeEdit">Username</label>
                                    <input type="text" placeholder="Your username" id="usernameEmployeeEdit" name="usernameEmployeeEdit" class="form-control" required>
                                	<a data-toggle="collapse" href="#changeUsernameEmployee" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Username?
  									</a>
  									<div class="collapse" id="changeUsernameEmployee">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newUsernameEmployeeEdit">New username</label>
			                                    <input type="text" placeholder="Your new username" class="form-control" id="newUsernameEmployeeEdit" name="newUsernameEmployeeEdit">
		                                    </div>
		                                </div>
  									</div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameEmployeeEdit">Firstname</label>
                                    <input type="text" placeholder="Your firstname" id="firstnameEmployeeEdit" name="firstnameEmployeeEdit" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameEmployeeEdit">Middlename</label>
                                    <input type="text" placeholder="Your middlename" class="form-control" id="middlenameEmployeeEdit" name="middlenameEmployeeEdit" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameEmployeeEdit">Lastname</label>
                                    <input type="text" placeholder="Your lastname" class="form-control" id="lastnameEmployeeEdit" name="lastnameEmployeeEdit" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="passwordEmployeeEdit">Password</label>
                                    <input type="password" placeholder="Your password" name="passwordEmployeeEdit" length="20" class="form-control" id="passwordEmployeeEdit" required>
                                	<a data-toggle="collapse" href="#changePasswordEmployee" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Password?
  									</a>
  									<div class="collapse" id="changePasswordEmployee">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newPasswordEmployeeEdit">New password</label>
			                                    <input type="password" placeholder="Your new password" class="form-control" id="newPasswordEmployeeEdit" name="newPasswordEmployeeEdit">
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newRetypePasswordEmployeeEdit">Retype Password</label>
			                                    <input type="password" placeholder="Retype password" class="form-control" id="newRetypePasswordEmployeeEdit" name="newRetypePasswordEmployeeEdit">
		                                    </div>
		                                </div>
  									</div>
                                	
                                	<p class="form-text text-muted small">
									  password must be 5-20 characters , contains at least one uppercase and lowercase letter and number, and must not contain spaces and special characters.
									</p> 
                                </div>
                                

                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionEmployeeEdit">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" id="positionEmployeeEdit" name="positionEmployeeEdit"  required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleEmployeeEdit" type="radio" value="Male" name="genderEmployeeEdit" class="radio-template" checked required>
                                    <label for="maleEmployeeEdit" style="margin-right: 10px;">Male</label>
                                    <input id="femaleEmployeeEdit" type="radio" value="Female" name="genderEmployeeEdit" class="radio-template">
                                    <label for="femaleEmployeeEdit" style="margin-right: 10px;">Female</label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageEmployeeEdit">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" min="18" max="100" value="18" required class="form-control" id="ageEmployeeEdit" name="ageEmployeeEdit">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-control-label" for="emailEmployeeEdit">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailEmployeeEdit" name="emailEmployeeEdit" class="form-control" required>
                                	<a data-toggle="collapse" href="#changeEmailEmployee" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Email?
  									</a>
  									<div class="collapse" id="changeEmailEmployee">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newEmailEmployeeEdit">New email</label>
			                                    <input type="email" placeholder="Your new email" class="form-control" id="newEmailEmployeeEdit" name="newEmailEmployeeEdit">
		                                    </div>
		                                </div>
  									</div>
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryEmployeeEdit" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" id = "countryEmployeeEdit" name = "countryEmployeeEdit" style="width: 75%;" required>
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityEmployeeEdit" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityEmployeeEdit" name="cityEmployeeEdit" style="width: 80%;" class="form-control" required disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressEmployeeEdit">Address</label><br>
                                    <textarea id="addressEmployeeEdit" name="addressEmployeeEdit" rows="3" cols="40" style="resize: none;"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeEmployeeEdit">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeEmployeeEdit" name="zipcodeEmployeeEdit" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeEmployeeEdit" name = "countryCodeEmployeeEdit" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberEmployeeEdit" name="phonenumberEmployeeEdit" placeholder="Your phone number" class="form-control" required />
                                </div>

                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" value="Save Changes" class="btn btn-primary" />
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>

                    </div>
                </div>
            </div>
            <!-- Edit Employee -->

            <!-- Add Employee -->
            <div class="modal fade" id="addEmployeeAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add New Employee</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action=" <c:url value='/admin/add-new-employee' /> " id="formEmployeeAdd" method="POST" enctype="multipart/form-data">
                            <div class="modal-body">
                            <hr />
                            <div id="errorEmployeeAdd">
	                            
                            </div>
                            <hr />
                            
        					
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadEmployeeAdd' src = "/../FBExportSystem/resources/admin/img/profile-male.jpg" />

                                    <p class="fileEmployeeAdd">
                                    <input type="file" name="fileEmployeeAdd" id="fileEmployeeAdd" accept="image/x-png,image/jpeg" />
                                    <label for="fileEmployeeAdd">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameEmployeeAdd">Username</label>
                                    <input type="text" placeholder="Your username" name="usernameEmployeeAdd" id="usernameEmployeeAdd" class="form-control" length="20" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameEmployeeAdd">Firstname</label>
                                    <input type="text" placeholder="Your firstname" name="firstnameEmployeeAdd" id="firstnameEmployeeAdd" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameEmployeeAdd">Middlename</label>
                                    <input type="text" placeholder="Your middlename" name="middlenameEmployeeAdd" class="form-control" id="middlenameEmployeeAdd" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameEmployeeAdd">Lastname</label>
                                    <input type="text" placeholder="Your lastname" name="lastnameEmployeeAdd" class="form-control" id="lastnameEmployeeAdd" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="passwordEmployeeAdd">Password</label>
                                    <input type="password" placeholder="Your password" name="passwordEmployeeAdd" length="20" class="form-control" id="passwordEmployeeAdd" required>
                                     
                                </div>
								<div class="form-group">
									<label class="form-control-label" for="retypePasswordEmployeeAdd">Retype Password</label>
	                                <input type="password" placeholder="Your password" name="retypePasswordEmployeeAdd" length="20" class="form-control" id="retypePasswordEmployeeAdd" required>
	                                <p class="form-text text-muted small">
									  password must be 5-20 characters , contains at least one uppercase and lowercase letter and number, and must not contain spaces and special characters.
									</p>
								</div>
								
                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionEmployeeAdd">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" name="positionEmployeeAdd" id="positionEmployeeAdd" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleEmployeeAdd" type="radio" value="Male" name="genderEmployeeAdd" class="radio-template" checked required>
                                    <label for="maleEmployeeAdd" style="margin-right: 10px;">Male</label>
                                    <input id="femaleEmployeeAdd" type="radio" value="Female" name="genderEmployeeAdd" class="radio-template">
                                    <label for="femaleEmployeeAdd" style="margin-right: 10px;">Female</label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageEmployeeAdd">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" min="18" max="100" value="18" name="ageEmployeeAdd" min="1" class="form-control" id="ageEmployeeAdd" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="emailEmployeeAdd">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailEmployeeAdd" name="emailEmployeeAdd" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryEmployeeAdd" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" name="countryEmployeeAdd" id = "countryEmployeeAdd" style="width: 75%;" required>
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityEmployeeAdd" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityEmployeeAdd" name="cityEmployeeAdd" style="width: 80%;" class="form-control" disabled required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressEmployeeAdd">Address</label><br>
                                    <textarea id="addressEmployeeAdd" name="addressEmployeeAdd" rows="3" cols="40" style="resize: none;" required ></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeEmployeeAdd">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeEmployeeAdd" name="zipcodeEmployeeAdd" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeEmployeeAdd" name="countryCodeEmployeeAdd" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberEmployeeAdd" name="phonenumberEmployeeAdd" placeholder="Your phone number" class="form-control" required />
                                </div>


                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="btnSaveNewEmployee" value="Add Employee">
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>

                    </div>
                </div>
            </div>
            <!-- Add Employee -->

                <div class = "row">
                    <div class = "col-lg">
                    <div class = "card mb-0">
                        <div class="container" style="padding-top: 10px;">
                        <button type="button" width="100" id="btnUpdateEmployee" class="btn bg-blue float-right mr-1" title="Update Selected Item" data-toggle="modal" data-target="#editEmployeeAccount"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
                        <button type="button" width="100" id="btnAddEmployee" class="btn bg-green float-right mr-1" title="Add New Item" data-toggle="modal" data-target="#addEmployeeAccount"><i class="fa fa-user-plus" aria-hidden="true"></i> </button>
                        </div>
                        <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">
                        <table id="employee-table" class="table table-striped table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>First Name</th>
                                    <th>Middle Name</th>
                                    <th>Last Name</th>
                                    <th>Position</th>
                                    <th>Gender</th>
                                    <th>Age</th>
                                    <th>Email Address</th>
                                    <th>Country</th>
                                    <th>City</th>
                                    <th>Address</th>
                                    <th>Zip Code</th>
                                    <th>Country Code</th>
                                    <th>Phone Number</th>
                                    <th>Active</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                <th>Image</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>First Name</th>
                                <th>Middle Name</th>
                                <th>Last Name</th>
                                <th>Position</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Email Address</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Zip Code</th>
                                <th>Country Code</th>
                                <th>Phone Number</th>
                                <th>Active</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            <c:if test="${not empty employeeList}">
        	
					        	<c:forEach var = "employee" items = "${employeeList}">
					        		<tr>
		                                <td><img src="<c:out value = '${employee.profileImageLink}' />" height="100" width="100"/></td>
		                                <td class="usernameEmployeeRow"><c:out value = "${employee.username} " /></td>
		                                <td><c:out value = "${employee.password}" /></td>
		                                <td><c:out value = "${employee.firstname}" /></td>
		                                <td><c:out value = "${employee.middlename}" /></td>
		                                <td><c:out value = "${employee.lastname}" /> </td>
		                                <td><c:out value = "${employee.position}" /></td>
		                                <td><c:out value = "${employee.gender}" /></td>
		                                <td><c:out value = "${employee.age }" /></td>
		                                <td><c:out value = "${employee.contact.emailAddress }"/></td>
		                                <td><c:out value = "${employee.address.country }"/></td>
		                                <td><c:out value = "${employee.address.city }"/></td>
		                                <td><c:out value = "${employee.address.address }"/></td>
		                                <td><c:out value = "${employee.address.zipCode }"/></td>
		                                <td><c:out value = "${employee.contact.countryCode }"/></td>
		                                <td><c:out value = "${employee.contact.phoneNumber }"/></td>
		
		                                <td>
		                                	<c:choose>
		                                		<c:when test="${not employee.enabled}">
		                                			<label class="switch">
		                                        		<input type="checkbox" name="isActive" id="isActive">
		                                        		<span class="slider round"></span>
		                                    		</label>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<label class="switch">
				                                        <input type="checkbox" checked name="isActive" id="isActive">
				                                        <span class="slider round"></span>
				                                    </label>
		                                		</c:otherwise>
		                                	</c:choose>
		                                    
		                                </td>
		                            </tr>
					        	</c:forEach>
					        
					        </c:if>
                            

                            </tbody>
                        </table>
                        </div>
                    </div>
                    </div>

                </div>

            </div>
            </section>
        </div>
        <!--/.Panel 2-->
		
		<!--Panel 3-->
        <div class="tab-pane fade" id="panel7" role="tabpanel">
            <section class = "no-padding-top p-0">

            <div class = "container-fluid p-0">

                <div class="collapse" id="collapseAdmins">

                <!--Filter-->

                <div clsss = "row">

                <div class = "col-lg-12 p-0 m-0">
                    <div class = "card m-0">
                    <div class = "card-body pt-2">
                        <table border="0" cellspacing="5" cellpadding="5" style="margin-top: 25px;">
                        <tbody>
                            <tr>
                            <td>Minimum age:</td>
                            <td><input type="text" id="minAgeAdmin" name="minAgeAdmin"></td>
                            <td>Country:</td>
                            <td>
                                <select class="browser-default" id = "countryAdmin" style="width: 75%;">
                                    <option value="All" selected>All</option>
                                </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Maximum age:</td>
                                <td><input type="text" id="maxAgeAdmin" name="maxAgeAdmin"></td>
                                <td>Account Status:</td>
                                <td>
                                <select class="browser-default" id="filterAdminStatus" style="width: 75%;">
                                    <option value="All" selected>All</option>
                                    <option value="true" >Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                            <td>Gender:</td>
                            <td>
                                <select class="browser-default" id="filterAdminGender" style="width: 75%;">
                                    <option value="All" selected>All</option>
                                    <option value="Male" >Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    </div>
                </div>
                </div>

                <!--Filter-->
            </div>


            <!-- Edit Admin -->
            <div class="modal fade" id="editAdminAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Admin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form  action=" <c:url value='/admin/edit-admin' /> " id="formAdminEdit" method="POST" enctype="multipart/form-data">
                            <div class="modal-body">
                            <hr />
                            <div id="errorAdminEdit">
	                            
                            </div>
                            <hr />
                            
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadAdminEdit' src = "/../FBExportSystem/resources/admin/img/profile-male.jpg" />

                                    <p class="fileAdminEdit">
                                    <input type="file" name="fileAdminEdit" id="fileAdminEdit" accept="image/x-png,image/jpeg" />
                                    <label for="fileAdminEdit">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameAdminEdit">Username</label>
                                    <input type="text" placeholder="Your username" id="usernameAdminEdit" name="usernameAdminEdit" class="form-control" required>
                                	<a data-toggle="collapse" href="#changeUsernameAdmin" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Username?
  									</a>
  									<div class="collapse" id="changeUsernameAdmin">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newUsernameAdminEdit">New username</label>
			                                    <input type="text" placeholder="Your new username" class="form-control" id="newUsernameAdminEdit" name="newUsernameAdminEdit">
		                                    </div>
		                                </div>
  									</div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameAdminEdit">Firstname</label>
                                    <input type="text" placeholder="Your firstname" id="firstnameAdminEdit" name="firstnameAdminEdit" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameAdminEdit">Middlename</label>
                                    <input type="text" placeholder="Your middlename" class="form-control" id="middlenameAdminEdit" name="middlenameAdminEdit" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameEmployeeEdit">Lastname</label>
                                    <input type="text" placeholder="Your lastname" class="form-control" id="lastnameAdminEdit" name="lastnameAdminEdit" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="passwordAdminEdit">Password</label>
                                    <input type="password" placeholder="Your password" name="passwordAdminEdit" length="20" class="form-control" id="passwordAdminEdit" required>
                                	<a data-toggle="collapse" href="#changePasswordAdmin" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Password?
  									</a>
  									<div class="collapse" id="changePasswordAdmin">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newPasswordAdminEdit">New password</label>
			                                    <input type="password" placeholder="Your new password" class="form-control" id="newPasswordAdminEdit" name="newPasswordAdminEdit">
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newRetypePasswordAdminEdit">Retype Password</label>
			                                    <input type="password" placeholder="Retype password" class="form-control" id="newRetypePasswordAdminEdit" name="newRetypePasswordAdminEdit">
		                                    </div>
		                                </div>
  									</div>
                                	
                                	<p class="form-text text-muted small">
									  password must be 5-20 characters , contains at least one uppercase and lowercase letter and number, and must not contain spaces and special characters.
									</p> 
                                </div>
                                

                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionAdminEdit">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" id="positionAdminEdit" name="positionAdminEdit"  required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleAdminEdit" type="radio" value="Male" name="genderAdminEdit" class="radio-template" checked required>
                                    <label for="maleAdminEdit" style="margin-right: 10px;">Male</label>
                                    <input id="femaleAdminEdit" type="radio" value="Female" name="genderAdminEdit" class="radio-template">
                                    <label for="femaleAdminEdit" style="margin-right: 10px;">Female</label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageAdminEdit">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" min="18" max="100" value="18" required class="form-control" id="ageAdminEdit" name="ageAdminEdit">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-control-label" for="emailAdminEdit">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailAdminEdit" name="emailAdminEdit" class="form-control" required>
                                	<a data-toggle="collapse" href="#changeEmailAdmin" role="button" aria-expanded="false" aria-controls="collapseExample">
    								Change Email?
  									</a>
  									<div class="collapse" id="changeEmailAdmin">
  										<div class="form-group">
		                                    <div class="form-inline">
			                                    <label class="mr-3 form-control-label" for="newEmailAdminEdit">New email</label>
			                                    <input type="email" placeholder="Your new email" class="form-control" id="newEmailAdminEdit" name="newEmailAdminEdit">
		                                    </div>
		                                </div>
  									</div>
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryAdminEdit" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" id = "countryAdminEdit" name = "countryAdminEdit" style="width: 75%;" required>
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityAdminEdit" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityAdminEdit" name="cityAdminEdit" style="width: 80%;" class="form-control" required disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressAdminEdit">Address</label><br>
                                    <textarea id="addressAdminEdit" name="addressAdminEdit" rows="3" cols="40" style="resize: none;"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeAdminEdit">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeAdminEdit" name="zipcodeAdminEdit" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeAdminEdit" name = "countryCodeAdminEdit" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberAdminEdit" name="phonenumberAdminEdit" placeholder="Your phone number" class="form-control" required />
                                </div>

                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" value="Save Changes" class="btn btn-primary" />
                            </div>
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     	</form>

                    </div>
                </div>
            </div>
            <!-- Edit Admin -->

            <!-- Add Admin -->
            <div class="modal fade" id="addAdminAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add New Admin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action=" <c:url value='/admin/add-new-admin' /> " id="formAdminAdd" method="POST" enctype="multipart/form-data">
                            <div class="modal-body">
                            <hr />
                            <div id="errorAdminAdd">
	                            
                            </div>
                            <hr />
                            
        					
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadAdminAdd' src = "/../FBExportSystem/resources/admin/img/profile-male.jpg" />

                                    <p class="fileAdminAdd">
                                    <input type="file" name="fileAdminAdd" id="fileAdminAdd" accept="image/x-png,image/jpeg" />
                                    <label for="fileAdminAdd">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameAdminAdd">Username</label>
                                    <input type="text" placeholder="Your username" name="usernameAdminAdd" id="usernameAdminAdd" class="form-control" length="20" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameAdminAdd">Firstname</label>
                                    <input type="text" placeholder="Your firstname" name="firstnameAdminAdd" id="firstnameAdminAdd" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameAdminAdd">Middlename</label>
                                    <input type="text" placeholder="Your middlename" name="middlenameAdminAdd" class="form-control" id="middlenameAdminAdd" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameAdminAdd">Lastname</label>
                                    <input type="text" placeholder="Your lastname" name="lastnameAdminAdd" class="form-control" id="lastnameAdminAdd" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="passwordAdminAdd">Password</label>
                                    <input type="password" placeholder="Your password" name="passwordAdminAdd" length="20" class="form-control" id="passwordAdminAdd" required>
                                     
                                </div>
								<div class="form-group">
									<label class="form-control-label" for="retypePasswordAdminAdd">Retype Password</label>
	                                <input type="password" placeholder="Your password" name="retypePasswordAdminAdd" length="20" class="form-control" id="retypePasswordAdminAdd" required>
	                                <p class="form-text text-muted small">
									  password must be 5-20 characters , contains at least one uppercase and lowercase letter and number, and must not contain spaces and special characters.
									</p>
								</div>
								
                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionAdminAdd">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" name="positionAdminAdd" id="positionAdminAdd" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleAdminAdd" type="radio" value="Male" name="genderAdminAdd" class="radio-template" checked required>
                                    <label for="maleAdminAdd" style="margin-right: 10px;">Male</label>
                                    <input id="femaleAdminAdd" type="radio" value="Female" name="genderAdminAdd" class="radio-template">
                                    <label for="femaleAdminAdd" style="margin-right: 10px;">Female</label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageAdminAdd">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" min="18" max="100" value="18" name="ageAdminAdd" min="1" class="form-control" id="ageAdminAdd" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="emailAdminAdd">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailAdminAdd" name="emailAdminAdd" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryAdminAdd" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" name="countryAdminAdd" id = "countryAdminAdd" style="width: 75%;" required>
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityAdminAdd" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityAdminAdd" name="cityAdminAdd" style="width: 80%;" class="form-control" disabled required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressAdminAdd">Address</label><br>
                                    <textarea id="addressAdminAdd" name="addressAdminAdd" rows="3" cols="40" style="resize: none;" required ></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeAdminAdd">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeAdminAdd" name="zipcodeAdminAdd" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeAdminAdd" name="countryCodeAdminAdd" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberAdminAdd" name="phonenumberAdminAdd" placeholder="Your phone number" class="form-control" required />
                                </div>


                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="btnSaveNewAdmin" value="Add Admin">
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>

                    </div>
                </div>
            </div>
            <!-- Add Employee -->

                <div class = "row">
                    <div class = "col-lg">
                    <div class = "card mb-0">
                        <div class="container" style="padding-top: 10px;">
                        <button type="button" width="100" id="btnUpdateAdmin" class="btn bg-blue float-right mr-1" title="Update Selected Item" data-toggle="modal" data-target="#editAdminAccount"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
                        <button type="button" width="100" id="btnAddAdmin" class="btn bg-green float-right mr-1" title="Add New Item" data-toggle="modal" data-target="#addAdminAccount"><i class="fa fa-user-plus" aria-hidden="true"></i> </button>
                        </div>
                        <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">
                        <table id="admin-table" class="table table-striped table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>First Name</th>
                                    <th>Middle Name</th>
                                    <th>Last Name</th>
                                    <th>Position</th>
                                    <th>Gender</th>
                                    <th>Age</th>
                                    <th>Email Address</th>
                                    <th>Country</th>
                                    <th>City</th>
                                    <th>Address</th>
                                    <th>Zip Code</th>
                                    <th>Country Code</th>
                                    <th>Phone Number</th>
                                    <th>Active</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                <th>Image</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>First Name</th>
                                <th>Middle Name</th>
                                <th>Last Name</th>
                                <th>Position</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Email Address</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Zip Code</th>
                                <th>Country Code</th>
                                <th>Phone Number</th>
                                <th>Active</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            <c:if test="${not empty adminList}">
        	
					        	<c:forEach var = "employee" items = "${adminList}">
					        		<tr>
		                                <td><img src="<c:out value = '${employee.profileImageLink}' />" height="100" width="100"/></td>
		                                <td class="usernameAdminRow"><c:out value = "${employee.username} " /></td>
		                                <td><c:out value = "${employee.password}" /></td>
		                                <td><c:out value = "${employee.firstname}" /></td>
		                                <td><c:out value = "${employee.middlename}" /></td>
		                                <td><c:out value = "${employee.lastname}" /> </td>
		                                <td><c:out value = "${employee.position}" /></td>
		                                <td><c:out value = "${employee.gender}" /></td>
		                                <td><c:out value = "${employee.age }" /></td>
		                                <td><c:out value = "${employee.contact.emailAddress }"/></td>
		                                <td><c:out value = "${employee.address.country }"/></td>
		                                <td><c:out value = "${employee.address.city }"/></td>
		                                <td><c:out value = "${employee.address.address }"/></td>
		                                <td><c:out value = "${employee.address.zipCode }"/></td>
		                                <td><c:out value = "${employee.contact.countryCode }"/></td>
		                                <td><c:out value = "${employee.contact.phoneNumber }"/></td>
		
		                                <td>
		                                	<c:choose>
		                                		<c:when test="${not employee.enabled}">
		                                			<label class="switch">
		                                        		<input type="checkbox" name="isActive" id="isActive">
		                                        		<span class="slider round"></span>
		                                    		</label>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<label class="switch">
				                                        <input type="checkbox" checked name="isActive" id="isActive">
				                                        <span class="slider round"></span>
				                                    </label>
		                                		</c:otherwise>
		                                	</c:choose>
		                                    
		                                </td>
		                            </tr>
					        	</c:forEach>
					        
					        </c:if>
                            

                            </tbody>
                        </table>
                        </div>
                    </div>
                    </div>

                </div>

            </div>
            </section>
        </div>
        <!--/.Panel 2-->
    </div>
    
    

    