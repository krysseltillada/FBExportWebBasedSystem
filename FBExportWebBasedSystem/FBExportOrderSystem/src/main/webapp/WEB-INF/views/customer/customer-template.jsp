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

        <title>Fong Bros</title>
        
        <c:if test="${not empty reCaptcha}">
        	<script src="${reCaptcha}"></script>
        </c:if>  

		<c:forEach var = "cssfile" items="${cssfiles}">
			<link href = "${cssfile}" rel = "stylesheet" type = "text/css"  />
		</c:forEach>
		
		<style type="text/css">


            /* table body scroll for order list and place order */

            /* .tableBodyScroll tbody {
                display:block;
                max-height:175px;
                height: 175px;
                overflow-y:auto;
            }
            .tableBodyScroll thead, .tableBodyScroll tfoot, tbody tr {
                display:table;
                width:100%;
                table-layout:fixed;
            } */

            /* end of table body scroll */


            /* profile page style */

            main {
                padding-top: 2rem;
                padding-bottom: 2rem;
            }

            .widget-wrapper {
                padding-bottom: 2rem;
                border-bottom: 1px solid #e0e0e0;
                margin-bottom: 2rem;
            }

            .reviews {
                text-align: center;
                border-top: 1px solid #e0e0e0;
                border-bottom: 1px solid #e0e0e0;
                padding: 1rem;
                margin-top: 1rem;
                margin-bottom: 2rem;
            }

            .price {
                position: absolute;
                left: 0;
                top: 0;
                margin-top: -2px;
            }

            .price .tag {
                margin: 0;
            }

            .navbar {
                background-color: #676b74;
            }

            footer.page-footer {
                background-color: #676b74;
                margin-top: 2rem;
            }
            .card {
                font-weight: 300;
            }
            .navbar .btn-group .dropdown-menu a:hover {
                color: #000 !important;
            }
            .navbar .btn-group .dropdown-menu a:active {
                color: #fff !important;
            }

            /* end of profile page style */

            /* .ui-slider { display : inline-block; width : 10em; } */

            .navbar .dropdown-menu a:hover {
                color : black !important;
            }

        </style>
	    
	</head>

	<body>
	
		<tiles:insertAttribute name = "userNavigation" />
		<tiles:insertAttribute name = "header" />
		<tiles:insertAttribute name = "main" />
		<tiles:insertAttribute name = "footer" />
		
		<tiles:insertAttribute name = "modals" />
		
		<tiles:insertAttribute name = "templates" />
		
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "${javascriptfile}" type = "text/javascript"></script>
		</c:forEach>
		
	</body>

</html>
