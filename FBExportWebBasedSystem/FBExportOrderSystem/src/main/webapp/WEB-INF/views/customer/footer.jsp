<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<footer class="page-footer center-on-small-only nopadding blue lighten-1">

    <div class="container-fluid wow fadeIn">
        <div class="row">
            <div class="col-lg-3 col-md-6 ml-auto">
                <h5 class="title mb-3">
					<img class = "float-left mt-1 mr-1" src = "<c:url value = '/resources/company-logo.png' />" width = "35" height = "35">
                	<strong>
                	Fong Bros International Corporation</strong>
                </h5>
                <p>You can be sure you are getting the highest quality seafoods & superior customer service.</p>
            </div>
            <hr class="w-100 clearfix d-sm-none">
            <div class="col-lg-2 col-md-6 ml-auto">
            	<h5 class="title mb-3"></h5>
                <ul>
                    <li>
                        <a href="<c:url value = '/' />">Home</a>
                    </li>
                    <li>
                        <a href="<c:url value = '/about-us' />">About Us</a>
                    </li>
                    <li>
                        <a href="<c:url value = '/contact-us' />">Contact Us</a>
                    </li>
                    <security:authorize access = "!hasAuthority('CUSTOMER')">
                    <li>
                        <a href="<c:url value = '/login' />">Sign in</a>
                    </li>
                    <li>
                        <a href="<c:url value = '/sign-up' />">Not Registered? Sign up</a>
                    </li>
                    </security:authorize>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 ml-auto">
                <h5 class="title mb-3"><strong>Buying Stations</strong></h5>
                <ul>	
                    <li>
                        LMB Fish Buying Station
                    </li>
                    <li>
                        RML Seafoods Dealer
                    </li>
                    <li>
                        Triple K9 Trading
                    </li>
                    <li>
                        Terasi Foods Inc.
                    </li>
                </ul>
            </div>
            <!--/.Third column-->
            <!--Fourth column-->
            <div class="col-lg-2 col-md-6 ml-auto">
                <h5 class="title mb-3"></h5>
                <br />
                <ul>
                    <li>
                        D & L Seafoods
                    </li>
                    <li>
                        Ging-LV Marine Products
                    </li>
                    <li>
                        NM Seafoods Trading
                    </li>
                    <li>
                        JP Seafoods Buyer
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <br />


    <div class="footer-copyright elegant-color-dark">
        <div class="container-fluid wow fadeIn">
            <span class = "text-white"> &copy; <script>document.write(new Date().getFullYear())</script> Copyright: </span> <a href="/"> Fong bros International Corporation  </a>

        </div>
    </div>

 </footer>