<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container p-5">

    <div class = "row">
        <div class = "col-md-12">
            <fieldset>
                <legend> 
                	Reset Password
                	
                </legend>
                
                <c:if test="${not empty errorForgotPassword}">
                	<c:forEach var="error" items="${errorForgotPassword}">
                		<span style="color: red;">*<c:out value='${error}' /></span><br>
                	</c:forEach>
                </c:if>

                <hr />

                    <form method = "POST" action = "${requestScope['javax.servlet.forward.request_uri']}" class = "mt-5 mb-5 ml-5" id = "resetForm">
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "new-password"> New Password: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="password" name = "newPassword" id="new-password" class="form-control" data-toggle="tooltip" data-placement="right" title="Enter your new password">
                                    <label for="new-password">New Password</label>
                                </div>
                            </div>
                        </div>
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "confirm-password"> Retype Password: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="password" name = "retypePassword" id="confirm-password" class="form-control" data-toggle="tooltip" data-placement="right" title="Enter your retype password">
                                    <label for="confirm-password">Retype Password</label>
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-md-1" style = "position: relative; left: 375px;">
                                <input type="submit" class="btn btn-primary" id="reset-submit" value = "Reset" />
                                <img class="reset-email" style="display:none;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
                                
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    </form>

                    <hr />

            </fieldset>
        </div>
    </div>
</div>