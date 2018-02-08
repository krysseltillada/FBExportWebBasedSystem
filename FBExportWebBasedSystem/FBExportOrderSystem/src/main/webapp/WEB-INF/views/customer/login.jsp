<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container p-5">

    <div class = "row">
        <div class = "col-md-12">
            <fieldset>
                <legend> 
                	Login 
                	
                	
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
                                    <p> <a class = "blue-text" href = "#"> Forgot password? </a> / Not registered? <a class = "blue-text" href = "<c:url value = "/sign-up" />"> Sign up </a> </p>
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-md-1" style = "position: relative; left: 375px;">
                                <input type="submit" class="btn btn-primary" value = "Login" />
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></strong>

                    </form>

                    <hr />

            </fieldset>
        </div>
    </div>
</div>   

