<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../lib/tags/tag-libraries.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<header style = "text-align:center;">
		<tiles:insertAttribute name = "header" />
	</header>
	
	<main style = "text-align:center;">
		<tiles:insertAttribute name = "main" />
	</main>
	
	<footer style = "text-align:center;">
		<tiles:insertAttribute name = "footer" />
	</footer>
	

</body>
</html>