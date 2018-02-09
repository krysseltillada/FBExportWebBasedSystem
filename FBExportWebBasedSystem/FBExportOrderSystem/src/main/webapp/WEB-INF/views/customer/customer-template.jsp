<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>


<tiles:importAttribute name = "cssfiles" /> 
<tiles:importAttribute name = "javascriptfiles" />
<tiles:importAttribute name = "reCaptcha" />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        
        <meta name="_csrf" content="${_csrf.token}"/>
  		<meta name="_csrf_header" content="${_csrf.headerName}"/>

        <title>Fong Bros</title>
        
        <c:if test="${not empty reCaptcha}">
        	<script src="<c:url value = '${reCaptcha}' />"></script>
        </c:if>  
        
       	<c:forEach var = "cssfile" items="${cssfiles}">
			<link href = "<c:url value = '${cssfile}' />" rel = "stylesheet" type = "text/css"  />
		</c:forEach>
	    
	</head>

	<body>
	
		<tiles:insertAttribute name = "userNavigation" />
		
		<tiles:insertAttribute name = "header" />
		<tiles:insertAttribute name = "main" />
		<tiles:insertAttribute name = "footer" />
		
		<tiles:insertAttribute name = "modals" />
		
		<tiles:insertAttribute name = "templates" />
		
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "<c:url value = '${javascriptfile}' />" type = "text/javascript"></script>
		</c:forEach>
		
	</body>

</html>
