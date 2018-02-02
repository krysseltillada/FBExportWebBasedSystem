<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<tiles:importAttribute name = "cssfiles" />
<tiles:importAttribute name = "javascriptfiles"/>
<tiles:importAttribute name = "sideBarActiveLink" />

<!DOCTYPE html>
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
		
	</head>
	<body>
			
		<div class = "page">
			
			<tiles:insertAttribute name = "mainNavBar" />
				
			<div class = "page-content d-flex align-items-stretch">
			
				<nav class="side-navbar">

				    <div class="sidebar-header d-flex align-items-center">
				    <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
				    <div class="title">
				        <h1 class="h4">Kryssel tillada</h1>
				        <p>System Admin</p>
				    </div>
				    </div>
				    <span class="heading text-muted">
				        <span class = "mr-2"> Main menu </span>
				        <i class="fa fa-bars" aria-hidden="true"></i>
				    </span>
				    <ul class="list-unstyled">
				       <li ${ (sideBarActiveLink eq "dashboard") ? "class = 'active'" : ''}><a href="index.html"> <i class="icon-presentation"></i>Dashboard </a></li>
				       <li ${ (sideBarActiveLink eq "inventory") ? "class = 'active'" : ''}><a href="index.html"> <i class="icon-padnote"></i>Inventory </a></li>
				       <li ${ (sideBarActiveLink eq "orders") ? "class = 'active'" : ''}><a href="index.html"> <i class="fa fa-list-alt" aria-hidden="true"></i> Orders </a></li>
				       <li ${ (sideBarActiveLink eq "report-logs") ? "class = 'active'" : ''}><a href="index.html"> <i class="fa fa-file-text" aria-hidden="true"></i> Report logs </a></li>
				       <li ${ (sideBarActiveLink eq "system-settings") ? "class = 'active'" : ''}><a href="index.html"> <i class="fa fa-cog" aria-hidden="true"></i> System Settings </a></li>
				    </ul>
				
				</nav>						

				<div class = "content-inner">
					<tiles:insertAttribute name = "main" />
					<tiles:insertAttribute name = "footer" />
				</div>
				
			</div>
			
		</div>
		
		<tiles:insertAttribute name = "templates" />
		
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "${javascriptfile}" type = "text/javascript"></script>
		</c:forEach> 
	
	</body>
</html>