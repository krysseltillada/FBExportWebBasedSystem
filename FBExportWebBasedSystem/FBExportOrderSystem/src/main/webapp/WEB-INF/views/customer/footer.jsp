<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<!--Footer-->
<footer class="page-footer font-small stylish-color-dark pt-4 mt-4">

    <!--Footer Links-->
    <div class="container text-center text-md-left">
        <div class="row">

            <!--First column-->
            <div class="col-md-4">
            	
                <h5 class="text-uppercase mb-2 mt-3 font-weight-bold">
                <img class = "float-left mt-1 mr-1 mr-2" src = "<c:url value = '/resources/company-logo.png' />" width = "35" height = "35">
                <span>Fong bros international corporation</span></h5>
                <p>You can be sure you are getting the highest quality seafoods & superior customer service.</p>
            </div>
            <!--/.First column-->

            <hr class="clearfix w-100 d-md-none">

            <!--Second column-->
            <div class="col-md-2 mx-auto">
                <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">
                Customer Service</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="<c:url value = '/about-us' />">About us</a>
                    </li>
                    <li>
                        <a href="<c:url value = '/contact-us' />">Contact us</a>
                    </li>
                </ul>
            </div>
            <!--/.Second column-->

            <hr class="clearfix w-100 d-md-none">

            <!--Third column-->
            <div class="col-md-3 mx-auto">
                <h5 class="text-uppercase mb-4 mt-3 font-weight-bold"> <i class="fa fa-map-marker mr-1"></i> Location</h5>
                <ul class="list-unstyled">
                    <li>
                         9474 A Alejandro St Paranaque City
                    </li>
                     <li>
                         Metro Manila - Philippines
                    </li>
                </ul>
            </div>
            <!--/.Third column-->

            <hr class="clearfix w-100 d-md-none">

            <!--Fourth column-->
            <div class="col-md-3 mx-auto">
                <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">
                <i class="fa fa-phone mr-2"></i>Contact us</h5>
                <ul class="list-unstyled">
                    <li> 
                    	<i class="fa fa-phone mr-1"></i> + 01 234 567 89
                    </li>
                    <li>
                        <i class="fa fa-envelope mr-1"></i> fongbrosinc@gmail.com
                    </li>
                </ul>
            </div>
            <!--/.Fourth column-->
        </div>
    </div>
    <!--/.Footer Links-->

    <hr>

	<security:authorize access="!hasAuthority('CUSTOMER')">
	
	   <div class="text-center">
	       <ul class="list-unstyled list-inline mb-0">
	           <li class="list-inline-item">
	               <h5 class="mb-1">Start ordering</h5>
	           </li>
	           <li class="list-inline-item">
	               <a href="<c:url value = '/sign-up' />" class="btn btn-primary btn-rounded">Sign up!</a>
	           </li>
	       </ul>
	   </div>
    
    </security:authorize>

    <hr>

    <!--Social buttons-->
    <div class="text-center pb-3">
    	<p class = "mt-1 mb-2">Payment options</p>
        <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/cc-badges-ppppcmcvdam.png" 
        	 alt="Pay with PayPal, PayPal Credit or any major credit card"
        	 height = "40" />
        <img class = "ml-1" src = "<c:url value = '/resources/cash-on-delivery.png' />" width = "120" height = "40">
    </div>
    <!--/.Social buttons-->

    <!--Copyright-->
    <div class="footer-copyright text-center">
        © 2018 Copyright:
        <a href="<c:url value = '/' />"> Fong Bros International Corporation </a>. All Rights Reserved
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->