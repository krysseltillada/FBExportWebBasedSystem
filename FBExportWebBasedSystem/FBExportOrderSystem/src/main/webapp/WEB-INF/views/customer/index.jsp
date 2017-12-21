<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Material Design Bootstrap</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Bootstrap core CSS -->

    <link href="<c:url value = 'resources/css/bootstrap.min.css' />" rel="stylesheet" />
    <!-- Material Design Bootstrap -->
    <link href="<spring:url value = 'resources/css/mdb.min.css' />" rel="stylesheet" />
    
    <!-- Your custom styles (optional) -->
    
    <link href="<spring:url value = 'resources/css/style.css' />" rel="stylesheet">
</head>

<body>

     <!--Main Navigation-->
    <header>
    
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="#"><strong>Navbar</strong></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="view intro-2 hm-indigo-slight">
            <div class="full-bg-img flex-center">
                <div class="container">
                    <div class="white-text text-center wow fadeInUp">
                        <h2>This Navbar isn't fixed</h2>
                        <h5>When you scroll down it will disappear</h5>
                        <br>
                        <p>Full page intro with background image will be always displayed in full screen mode, regardless of device </p>
                    </div>
                </div>
            </div>
        </div>
    
    </header>

    <main class="text-center py-5 mt-3">

        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <p align="justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                </div>
            </div>
        </div>
    
    </main>

    <!-- Start your project here-->
   
    <!-- /Start your project here-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="<spring:url value = 'resources/js/jquery-3.2.1.min.js' />"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="<spring:url value = 'resources/js/popper.min.js' />"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="<spring:url value = 'resources/js/bootstrap.min.js' />"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="<spring:url value = 'resources/js/mdb.min.js' />"></script>
</body>

</html>
