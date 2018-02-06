<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>
<!DOCTYPE html>

<tiles:importAttribute name = "cssfiles" />
<tiles:importAttribute name = "javascriptfiles" />

<html>
	<head>
	
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Fong Bros</title>
	    <meta name="description" content="">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="robots" content="all,follow">
		
		<c:forEach var = "cssfile" items = "${cssfiles}">
			<link href = "${cssfile}" rel = "stylesheet" type = "text/css" />
		</c:forEach>
		
		<style media="screen">
		
	      body{
	        background-color: #ecf0f1;
	      }
	
	      #login-banner{
	        background-image: url("resources/admin/img/project-6.jpg");
	      }

    	</style>
		
	</head>
	<body>
	
		 <div class="login-page">
		      <div class="container d-flex align-items-center">
		        <div class="form-holder has-shadow">
		          <div class="row">
		            <!-- Logo & Information Panel-->
		            <div class="col-lg-6" id="login-banner">
		              <div class="d-flex align-items-center">
		                <div class="content" style="color: white; padding: 50px;">
		                   <div class="logo" style="margin-bottom: 200px;">
		                    <h2>Fong Bros International Corporation </h2>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <!-- Form Panel    -->
		            <div class="col-lg-6 bg-white">
		              <div class="form d-flex align-items-center">
		                <div class="content text-center">
		                  <i class="fa fa-user-circle fa-5x" style="font-size: 100px; color: grey; margin-bottom: 15px;  " aria-hidden="true"></i>
		                  <form id="login-form" method="post">
		                    <div class="form-group">
		                      <input id="login-username" type="text" name="loginUsername" required="" class="input-material">
		                      <label for="login-username" class="label-material">User Name</label>
		                    </div>
		                    <div class="form-group text-left">
		                      <input id="login-password" type="password" name="loginPassword" required="" class="input-material">
		                      <label for="login-password" class="label-material">Password</label>
		                    </div><a id="login" href="index.html" class="btn btn-primary pull-right">Login</a>
		                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
		                    <a href="#" class="forgot-pass pull-left">Forgot Password?</a>
		                  </form>
		                  <br>
		
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		
		    </div>
	
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "${javascriptfile}" type = "text/javascript"></script>
		</c:forEach> 
	</body>
	
	
</html>