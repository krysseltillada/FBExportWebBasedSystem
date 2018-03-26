<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container p-5">

    <div class = "row">
        <div class = "col-md-12">
            <fieldset>
                <legend> 
                	Login
                	<c:if test="${not empty accountFound}">
						<span class = "green-text ml-3" style = "font-size: 15px;"> <strong> *${accountFound} </strong> </span>
					</c:if>
                	<c:if test="${not empty accountNotFound}">
						<span class = "red-text ml-3" style = "font-size: 15px;"> <strong> *${accountNotFound} </strong> </span>
					</c:if> 
					<c:if test="${not empty emailConfirmationMessage}">
						<span class = "green-text ml-3" style = "font-size: 15px;"> <strong> *${emailConfirmationMessage} </strong> </span>
					</c:if>                	
               		<c:if test = "${not empty loginErrorMessage}">
               			<span class = "red-text ml-3" style = "font-size: 15px;"> <strong> *${loginErrorMessage} </strong> </span>
               		</c:if>
                	
                </legend>

                <hr />

                    <form method = "POST" action = "<c:url value = '/login' />" class = "mt-5 mb-5 ml-5" id = "loginForm">
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "username-email"> Username / Email: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="text" name = "username" id="username-email" class="form-control" data-toggle="tooltip" data-placement="right" title="Enter your username or email" required>
                                    <label for="username-email">Username or email</label>
                                </div>
                            </div>
                        </div>
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "password"> Password: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="password" name = "password" id="password" class="form-control" data-toggle="tooltip" data-placement="right" title="Your password" required>
                                    <label for="password">password</label>
                                </div>
                            </div>
                        </div>

                        <div class = "row mt-2">
                            <div class = "col-md-12">
                                <div style = "position: relative; left: 80px; font-size: 14px;">
                                    <p> <a class = "blue-text" id="forgotPassword" data-toggle="modal" data-target="#forgotPasswordModal"> Forgot password? </a> / Not registered? <a class = "blue-text" href = "<c:url value = "/sign-up" />"> Sign up </a> </p>
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-md-1" style = "position: relative; left: 375px;">
                                <input type="submit" class="btn btn-primary" value = "Login" />
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    </form>

                    <hr />

            </fieldset>
        </div>
    </div>
</div>   

<!-- Modal -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Forgot Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <form action="/forgotpassword" method="post" id="forgotpasswordForm">
	            <div class="modal-body">
	             	<p>Please enter your registered email address. We will send you a link to change your password.</p>
	             	<br>
	                <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "email"> Email: </label>
                            </div>
                            <div class = "col-md-9">
                                <div class="md-form form-sm">
                                    <input type="email" name = "email" id="email" class="form-control" data-toggle="tooltip" data-placement="right" title="Enter your email address">
                                    <label for="email">Email</label>
                                </div>
                            </div>
                        </div>
	            </div>
	            <div class="modal-footer">
	            <button type="submit" class="btn btn-primary" id="submit-forgotpassword">Send</button>
	            <img class="forgotpassword-email" style="display:none; margin-right: 35px;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
	            
	            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                
	            </div>
            </form>
        </div>
    </div>
</div>

