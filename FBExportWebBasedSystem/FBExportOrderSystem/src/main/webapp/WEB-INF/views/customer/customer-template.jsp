<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<tiles:importAttribute name = "cssfiles" />
<tiles:importAttribute name = "javascriptfiles" />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Fong Bros</title>
        
        <script src='https://www.google.com/recaptcha/api.js'></script>  

		<c:forEach var = "cssfile" items="${cssfiles}">
			<link href = "${cssfile}" rel = "stylesheet" type = "text/css"  />
		</c:forEach>
		
		<style type="text/css">

            #addShippingAddress:hover {
                background-color:#DFDFDF;
            }

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


            /* shopping cart */

            .breadcrumb a {
                color: white;
            }
             .lighter-text {
            color: #ABB0BE;
            }

            .main-color-text {
            color: #6394F8;
            }

            .badge {
            background-color: #6394F8;
            border-radius: 10px;
            color: white;
            display: inline-block;
            font-size: 12px;
            line-height: 1;
            padding: 3px 7px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            }

            .cart {
                margin-right: 50px;
            }

            .shopping-cart {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            display: none;
            margin: 20px 0;
            float: right;
            background: white;
            width: 320px;
            position: relative;
            border-radius: 3px;
            padding: 20px;
            }

            .shopping-cart-box {
                position: absolute; left: -210px; top: 45px; z-index: 3;
            }

            .shopping-cart .shopping-cart-header {
            border-bottom: 1px solid #E8E8E8;
            padding-bottom: 15px;
            }
            .shopping-cart .shopping-cart-header .shopping-cart-total {
            float: right;
            }

            .shopping-cart .shopping-cart-items {
                padding-top: 20px;
                padding-left: 8px;
                overflow-y: auto;
                list-style-type: none;
            }
            .shopping-cart .shopping-cart-items li {
                margin-bottom: 18px;
                color: black;
            }
            .shopping-cart .shopping-cart-items img {
            float: left;
            margin-right: 12px;
            }
            .shopping-cart .shopping-cart-items .item-name {
            display: block;
            padding-top: 10px;
            font-size: 16px;
            }
            .shopping-cart .shopping-cart-items .item-price {
            color: #6394F8;
            margin-right: 8px;
            }
            .shopping-cart .shopping-cart-items .item-quantity {
            color: #ABB0BE;
            }

            .shopping-cart:after {
            bottom: 100%;
            left: 89%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: white;
            border-width: 8px;
            margin-left: -8px;
            }

            .cart-icon {
            color: #515783;
            font-size: 24px;
            margin-right: 7px;
            float: left;
            }

            .button {
            background: #6394F8;
            color: white;
            text-align: center;
            padding: 12px;
            text-decoration: none;
            display: block;
            border-radius: 3px;
            font-size: 16px;
            width: 285px;
            }
            .button:hover {
            background: #729ef9;
            }


            /* end of shopping cart */

            /* main template */


            .navbar {
                height: auto;
                padding:0px;
                font-size: 14px;
            }

            nav.sub-nav .sub-nav-date:hover {
                text-decoration: underline;
            }

            nav.sub-nav .container ul.nav-flex-icons li.nav-item a i {
                margin-right: 3px;
            }

            header .main-nav-bar .container .navbar-nav .nav-link {
                font-size: 16px;
            }

            header .main-nav-bar {
                margin-top: 50px;
            }

            footer.page-footer {
                background-color: white;
                margin-top: 2rem;
            }

            header nav div a.navbar-brand {
                margin-left: 7px;
            }

            .pattern-4 {
                background-attachment: fixed;
            }

            .view {
                background-color: white;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                height: 100vh;
            }

            .full-bg-img {
                color: #fff;
            }


            .navbar .btn-group .dropdown-menu a:hover {
                color: #000 !important;
            }
            .navbar .btn-group .dropdown-menu a:active {
                color: #fff !important;
            }

            nav.navbar div.container div ul.top-navigation li{
                padding-right: 10px;
                padding-left: 0px;
                margin: 0px;
            }


            .slider {
                width: 95px;
                margin: 2em auto;
            }

            .closebtn {
                margin-left: 15px;
                color: black;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }


             /* ul{
                    padding: 0;
                    list-style: none;

                }
                ul li{
                    position: relative;
                    line-height: 21px;
                    text-align: left;
                }
                ul li a{
                    display: block;
                    padding: 8px 25px;
                    color: #333;
                    text-decoration: none;
                }
                ul li ul.dropdown{
                    min-width: 100%;
                    background: #f2f2f2;
                    display: none;
                    position: absolute;
                    z-index: 999;
                    left: 0;
                }
                ul li:hover ul.dropdown{
                    display: block;
                }
                ul li ul.dropdown li{
                    display: block;
                }  */

                .card {
                    width: 300px;
                    height: 400px;
                    z-index: 0;
                    margin-bottom: 25px;
                }

                .col {
                    margin-right: 0px !important;
                }

                header nav.nav-category {
                    height: 30px;
                }

                header nav.nav-category div.container ul.top-navigation li.nav-item a {
                    padding-right: 0px;
                    padding-left: 0px;
                }


                header nav.nav-category div.container ul.top-navigation {
                    margin-left: 100px;
                }

                /*Profile picture upload*/

                .file {
                  position: relative;
                }
                .file label {
                  background-color: #3498db;
                  padding: 5px 20px;
                  color: #fff;
                  font-weight: bold;
                  font-size: .9em;
                  transition: all .4s;
                }
                .file input {

                  position: absolute;
                  display: inline-block;
                  left: 0;
                  top: 0;
                  opacity: 0.01;
                  cursor: pointer;
                }
                .file input:hover + label,
                .file input:focus + label {
                  background: #34495E;
                  color: #3498db;
                }
                /*Profile picture upload*/

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
