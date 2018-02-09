<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2" >Manage Accounts</span>
            <span class = "small float-right"  > <a style="margin: 5px;"data-toggle="collapse" href="#collapseEmployees" aria-expanded="false" aria-controls="collapseExample"> Filter Employees <i class="fa fa-filter ml-1" aria-hidden="true"> </i> </a></span>
            <span class = "small float-right" > <a style="margin: 5px;" data-toggle="collapse" href="#collapseClients" aria-expanded="false" aria-controls="collapseExample"> Filter Clients <i class="fa fa-filter ml-1" aria-hidden="true"> </i> </a></span>
        </div>
        </div>

    </div>
    </header>

    <ul class="nav nav-tabs nav-justified " role="tablist" style="background-color: #ecf0f1;">
        <li class="nav-item">
            <a style="color: #596275;" class="nav-link active" data-toggle="tab" href="#panel5" role="tab"><i class="fa fa-user"></i> Client Accounts</a>
        </li>
        <li class="nav-item">
            <a style="color: #596275;" class="nav-link" data-toggle="tab" href="#panel6" role="tab"><i class="fa fa-user"></i> Employees</a>
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
                                        <option value="" disabled selected>Choose your country</option>
                                    </select>
                                </td>
                                </tr>
                                <tr>
                                    <td>Maximum age:</td>
                                    <td><input type="text" id="maxAgeClient" name="maxAgeClient"></td>
                                    <td>Account Status:</td>
                                    <td>
                                    <select class="browser-default" style="width: 75%;">
                                        <option value="" disabled selected>Choose account status</option>
                                        <option value="Active" >Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                <td>Gender:</td>
                                <td>
                                    <select class="browser-default" style="width: 75%;">
                                        <option value="" disabled selected>Choose gender</option>
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
                                <form>
                                <div class="modal-body">
                                    <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <label class="form-control-label" for="usernameClientEdit">Username</label>
                                        <input type="text" placeholder="Your username" id="usernameClientEdit" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                        <label class="form-control-label" for="firstnameClientEdit">Firstname</label>
                                        <input type="text" placeholder="Your firstname" id="firstnameClientEdit" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                        <label class="form-control-label" for="middlenameClientEdit">Middlename</label>
                                        <input type="text" placeholder="Your middlename" class="form-control" id="middlenameClientEdit" required>
                                        </div>
                                        <div class="form-group">
                                        <label class="form-control-label" for="lastnameClientEdit">Lastname</label>
                                        <input type="text" placeholder="Your lastname" class="form-control" id="lastnameClientEdit" required>
                                        </div>
                                        <div class="form-group">
                                        <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                        <input id="maleClientEdit" type="radio" value="Male" name="genderClientEdit" class="radio-template" required>
                                        <label for="maleClientEdit" style="margin-right: 10px;">Male</label>
                                        <input id="femaleClientEdit" type="radio" value="Female" name="genderClientEdit" class="radio-template">
                                        <label for="femaleClientEdit" style="margin-right: 10px;">Female</label>
                                        </div>
                                        <div class="form-group">
                                        <div class="form-inline">
                                            <label class="mr-3 form-control-label" for="ageClientEdit">Age</label>
                                            <input type="number" style="width: 50%;"placeholder="Your age" min="1" required class="form-control" id="ageClientEdit">
                                        </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <label class="form-control-label" for="emailClientEdit">Email</label>
                                        <input type="email" placeholder="Your email address" id="emailClientEdit" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                        <div class = "form-inline">
                                                <label for = "countryClientEdit" class = "mr-3 form-control-label"> Country: </label>
                                                <select class="browser-default" id = "countryClientEdit" style="width: 75%;" required>
                                                    <option value="" disabled selected>Choose your country</option>
                                                </select>
                                        </div>
                                            <div class="form-inline" >
                                            <label for="cityClientEdit" class=" mr-3 form-control-label">City : </label>
                                            <input type="text" id="cityClientEdit" style="width: 80%;" class="form-control" required disabled/>
                                        </div>
                                        </div>
                                        <div class="form-group">
                                        <label class="form-control-label" for="addressClientEdit">Address</label><br>
                                        <textarea name="address" id="addressClientEdit" rows="3" cols="40" style="resize: none;"></textarea>
                                        </div>
                                        <div class="form-group">
                                        <div class="form-inline">
                                            <label class="form-control-label mr-3" for="zipcodeClientEdit">Zip Code : </label>
                                            <input type="text" placeholder="Your zip code" id="zipcodeClientEdit" class="form-control">
                                        </div>
                                        </div>
                                        <div class="form-group">
                                            <select class="browser-default" id = "countryCodeClientEdit" required>
                                                <option value="" disabled selected>Country Code</option>
                                            </select>
                                            <input type="text" id="phonenumberClientEdit" placeholder="Your phone number" class="form-control" required />
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                                </form>

                            </div>
                        </div>
                    </div>
                <!-- Edit Account Modal -->


                <div class = "row" >
                    <div class = "col-lg">
                    <div class = "card mb-0">
                        <div class="container" style="padding-top: 10px;">
                        <button type="button" width="100" id="btnDeleteClient" class="btn bg-red float-right mr-1" title="Delete Selected Item"> <i class="fa fa-trash" aria-hidden="true"></i> </button>
                        <button type="button" width="100" id="btnUpdateClient" class="btn bg-blue float-right mr-1" title="Update Selected Item" data-toggle="modal" data-target="#editClientAccount"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
                        </div>
                        <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">

                        <table id="client-table" class="table table-striped table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th> <input type="checkbox" value="" class="checkbox-template checkbox-delete" id = "checkbox-all-client"> </th>
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
                            <tr>
                                <td></td>
                                <td><i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i></td>
                                <td><img src="upload-product-img.png" height="100" width="100"/></td>
                                <td>Night Rider</td>
                                <td>ahsbfvfkshdahsbd12454</td>
                                <td>Alfred</td>
                                <td>Argarin</td>
                                <td>Borja</td>
                                <td>Male</td>
                                <td>23</td>
                                <td>alfredoborja81194@gmail.com</td>
                                <td>Philippines</td>
                                <td>Parañaque</td>
                                <td>71 Ninoy Aquino Avenue</td>
                                <td>1700</td>
                                <td>63</td>
                                <td>9996668084</td>

                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked name="isActive" id="isActive">
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i></td>
                                <td><img src="upload-product-img.png" height="100" width="100"/></td>
                                <td>Night Rider 123</td>
                                <td>ahsbfvfkshdahsbd12454</td>
                                <td>Alfred</td>
                                <td>Argarin</td>
                                <td>Borja</td>
                                <td>Male</td>
                                <td>23</td>
                                <td>alfredoborja81194@gmail.com</td>
                                <td>Philippines</td>
                                <td>Parañaque</td>
                                <td>71 Ninoy Aquino Avenue</td>
                                <td>1700</td>
                                <td>63</td>
                                <td>9996668084</td>

                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked name="isActive" id="isActive">
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>

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
                                    <option value="" disabled selected>Choose your country</option>
                                </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Maximum age:</td>
                                <td><input type="text" id="maxAgeEmployee" name="maxAgeEmployee"></td>
                                <td>Account Status:</td>
                                <td>
                                <select class="browser-default" style="width: 75%;">
                                    <option value="" disabled selected>Choose account status</option>
                                    <option value="Active" >Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                            <td>Gender:</td>
                            <td>
                                <select class="browser-default" style="width: 75%;">
                                    <option value="" disabled selected>Choose gender</option>
                                    <option value="Male" >Male</option>
                                    <option value="Female">Female</option>
                                </select>

                                <td>Position:</td>
                                <td>
                                <select class="browser-default" style="width: 75%;">
                                    <option value="" disabled selected>Choose position</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                            <td>Role:</td>
                            <td>
                                <select class="browser-default" style="width: 75%;">
                                    <option value="" disabled selected>Choose role</option>
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
                        <form>
                            <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadEmployeeEdit' src = "resources/admin/img/profile-male.jpg" />

                                    <p class="fileEmployeeAdd">
                                    <input type="file" name="fileEmployeeEdit" id="fileEmployeeEdit" accept="image/x-png,image/jpeg" />
                                    <label for="fileEmployeeEdit">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameEmployeeEdit">Username</label>
                                    <input type="text" placeholder="Your username" id="usernameEmployeeEdit" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameEmployeeEdit">Firstname</label>
                                    <input type="text" placeholder="Your firstname" id="firstnameEmployeeEdit" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameEmployeeEdit">Middlename</label>
                                    <input type="text" placeholder="Your middlename" class="form-control" id="middlenameEmployeeEdit" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameEmployeeEdit">Lastname</label>
                                    <input type="text" placeholder="Your lastname" class="form-control" id="lastnameEmployeeEdit" required>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionEmployeeEdit">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" id="positionEmployeeEdit" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleEmployeeEdit" type="radio" value="Male" name="genderEmployeeEdit" class="radio-template" required>
                                    <label for="maleEmployeeEdit" style="margin-right: 10px;">Male</label>
                                    <input id="femaleEmployeeEdit" type="radio" value="Female" name="genderEmployeeEdit" class="radio-template">
                                    <label for="femaleEmployeeEdit" style="margin-right: 10px;">Female</label>
                                </div>

                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageEmployeeEdit">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" min="1" required class="form-control" id="ageEmployeeEdit">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-control-label" for="emailEmployeeEdit">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailEmployeeEdit" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryEmployeeEdit" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" id = "countryEmployeeEdit" style="width: 75%;" required>
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityEmployeeEdit" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityEmployeeEdit" style="width: 80%;" class="form-control" required disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressEmployeeEdit">Address</label><br>
                                    <textarea name="address" id="addressEmployeeEdit" rows="3" cols="40" style="resize: none;"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeEmployeeEdit">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeEmployeeEdit" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeEmployeeEdit" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberEmployeeEdit" placeholder="Your phone number" class="form-control" required />
                                </div>

                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
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
                        <form action="/add-new-employee" method="POST" enctype="multipart/form-data">
                            <div class="modal-body">
                            <c:if test="${not empty errorMessages }">
        	
        						<hr />
        	
        						<c:forEach var = "errorMessage" items = "${errorMessages}">
        						<span class = "red-text"> *<c:out value="${errorMessage}" /> </span> <br />
        						</c:forEach>
        						
        						<hr />
        						
        					</c:if>
        					
                            <div class="row">
                                <div class="col-lg-6">
                                <div class="form-group text-center">
                                    <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD; width: 100px" id='img-uploadEmployeeAdd' src = "resources/admin/img/profile-male.jpg" />

                                    <p class="fileEmployeeAdd">
                                    <input type="file" name="fileEmployeeAdd" id="fileEmployeeAdd" accept="image/x-png,image/jpeg" />
                                    <label for="fileEmployeeAdd">Upload your image</label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="usernameEmployeeAdd">Username</label>
                                    <input type="text" placeholder="Your username" name="usernameEmployeeAdd" id="usernameEmployeeAdd" class="form-control" length="20">
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="firstnameEmployeeAdd">Firstname</label>
                                    <input type="text" placeholder="Your firstname" name="firstnameEmployeeAdd" id="firstnameEmployeeAdd" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="middlenameEmployeeAdd">Middlename</label>
                                    <input type="text" placeholder="Your middlename" name="middlenameEmployeeAdd" class="form-control" id="middlenameEmployeeAdd">
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="lastnameEmployeeAdd">Lastname</label>
                                    <input type="text" placeholder="Your lastname" name="lastnameEmployeeAdd" class="form-control" id="lastnameEmployeeAdd">
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="passwordEmployeeAdd">Password</label>
                                    <input type="password" placeholder="Your password" name="passwordEmployeeAdd" length="20" class="form-control" id="passwordEmployeeAdd">
                                	<p class="form-text text-muted small">
									  password must be 5-20 characters , contains at least one uppercase and lowercase letter and number, and must not contain spaces and special characters.
									</p> 
                                </div>
                                <!--  <div class="form-group">
                                    <label class="form-control-label" for="retypePasswordEmployeeAdd">Retype Password</label>
                                    <input type="password" placeholder="Your retype password" name="retypePasswordEmployeeAdd" class="form-control" id="retypePasswordEmployeeAdd" required>
                                </div> -->


                                </div>

                                <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="positionEmployeeAdd">Position</label>
                                    <input type="text" placeholder="Your position" class="form-control" name="positionEmployeeAdd" id="positionEmployeeAdd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" style="margin-right: 10px;">Gender : </label>
                                    <input id="maleEmployeeAdd" type="radio" value="Male" name="genderEmployeeAdd" class="radio-template" checked >
                                    <label for="maleEmployeeAdd" style="margin-right: 10px;">Male</label>
                                    <input id="femaleEmployeeAdd" type="radio" value="Female" name="genderEmployeeAdd" class="radio-template">
                                    <label for="femaleEmployeeAdd" style="margin-right: 10px;">Female</label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="mr-3 form-control-label" for="ageEmployeeAdd">Age</label>
                                    <input type="number" style="width: 50%;"placeholder="Your age" name="ageEmployeeAdd" min="1" class="form-control" id="ageEmployeeAdd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="emailEmployeeAdd">Email</label>
                                    <input type="email" placeholder="Your email address" id="emailEmployeeAdd" name="emailEmployeeAdd" class="form-control">
                                </div>
                                <div class="form-group">
                                    <div class = "form-inline">
                                            <label for = "countryEmployeeAdd" class = "mr-3 form-control-label"> Country: </label>
                                            <select class="browser-default" name="countryEmployeeAdd" id = "countryEmployeeAdd" style="width: 75%;">
                                                <option value="" disabled selected>Choose your country</option>
                                            </select>
                                    </div>
                                    <div class="form-inline" >
                                        <label for="cityEmployeeAdd" class=" mr-3 form-control-label">City : </label>
                                        <input type="text" id="cityEmployeeAdd" name="cityEmployeeAdd" style="width: 80%;" class="form-control" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="addressEmployeeAdd">Address</label><br>
                                    <textarea name="address" id="addressEmployeeAdd" name="addressEmployeeAdd" rows="3" cols="40" style="resize: none;" ></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                    <label class="form-control-label mr-3" for="zipcodeEmployeeAdd">Zip Code : </label>
                                    <input type="text" placeholder="Your zip code" id="zipcodeEmployeeAdd" name="zipcodeEmployeeAdd" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <select class="browser-default" id = "countryCodeEmployeeAdd" name="countryCodeEmployeeAdd" >
                                            <option value="" disabled selected>Country Code</option>
                                        </select>
                                        <input type="text" id="phonenumberEmployeeAdd" name="phonenumberEmployeeAdd" placeholder="Your phone number" class="form-control" />
                                </div>


                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="btnSaveNewEmployee" value="Add Employee">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- Add Employee -->

                <div class = "row">
                    <div class = "col-lg">
                    <div class = "card mb-0">
                        <div class="container" style="padding-top: 10px;">
                        <button type="button" width="100" id="btnDeleteEmployee" class="btn bg-red float-right mr-1" title="Delete Selected Item"> <i class="fa fa-trash" aria-hidden="true"></i> </button>
                        <button type="button" width="100" id="btnUpdateEmployee" class="btn bg-blue float-right mr-1" title="Update Selected Item" data-toggle="modal" data-target="#editEmployeeAccount"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
                        <button type="button" width="100" id="btnAddEmployee" class="btn bg-green float-right mr-1" title="Add New Item" data-toggle="modal" data-target="#addEmployeeAccount"><i class="fa fa-user-plus" aria-hidden="true"></i> </button>
                        </div>
                        <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">
                        <table id="employee-table" class="table table-striped table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th> <input type="checkbox" value="" class="checkbox-template checkbox-delete" id = "checkbox-all-employee"> </th>
                                    <th> </th>
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
                                <th></th>
                                <th></th>
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
                            <tr>
                                <td></td>
                                <td><i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i></td>
                                <td><img src="upload-product-img.png" height="100" width="100"/></td>
                                <td>Night Rider</td>
                                <td>ahsbfvfkshdahsbd12454</td>
                                <td>Alfred</td>
                                <td>Argarin</td>
                                <td>Borja</td>
                                <td>CEO</td>s
                                <td>Male</td>
                                <td>23</td>
                                <td>alfredoborja81194@gmail.com</td>
                                <td>Philippines</td>
                                <td>Parañaque</td>
                                <td>71 Ninoy Aquino Avenue</td>
                                <td>1700</td>
                                <td>63</td>
                                <td>9996668084</td>

                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked name="isActive" id="isActive">
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>

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