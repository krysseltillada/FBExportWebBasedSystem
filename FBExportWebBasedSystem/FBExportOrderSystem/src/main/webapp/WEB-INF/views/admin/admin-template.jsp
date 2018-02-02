<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<tiles:importAttribute name = "cssfiles" />
<tiles:importAttribute name = "javascriptfiles"/>

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
			
			<tiles:importAttribute name = "mainNavBar" />
			
			<div class="page-content d-flex align-items-stretch">
				
				<tiles:importAttribute name = "sideBar" />
				
				<div class = "content-inner">
					<tiles:importAttribute name = "main" />
					<tiles:importAttribute name = "footer" />
				</div>
			
			</div>
			
		</div>
		
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "${javascriptfile}" type = "text/javascript"></script>
		</c:forEach> 
		
	
	</body>
</html>