<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header id = "desktopWebsiteHeader" style="background-image: url('<spring:url value = 'resources/customer/img/h1.jpg' />'); background-repeat: no-repeat; background-size: cover;">
    <div class = "container">
        <h2 class = "mb-0">
            <a class="navbar-brand" href="<c:url value = '/' />" style = "margin-top: 5px; margin-bottom: 5px; color:#000;">
                Fong Bros International Corp
            </a>
        </h2>
    </div>
</header>

<header>

    <nav class="navbar navbar-expand-lg navbar-dark blue lighten-1">

        <div class = "container pt-1 pb-1">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-brand d-none m-0 mb-1" href="<c:url value = '/' />" id = "nav-bar-brand-mobile-header">

                <span class = "pr-2" style = "font-size: 14px;">
                    Fong Bros International Corp
                </span>

            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value = '/' />">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">

                    </li>
                    <li class="nav-item">
                        <a class="nav-link pr-1" href="<c:url value = '/about-us' />">
                            About Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pr-1" href="<c:url value = '/contact-us' />">
                            Contact Us
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav nav-flex-icons">
                    <li class="nav-item mr-3">

                        <form  role="search" class = "form-inline">
                            <input type="text" class="form-control" placeholder="Search" name="q">
                            <button class="btn btn-default light-blue lighten-2" type="submit" style = "height: 30px;">
                                <i class="fa fa-search" aria-hidden="true" style="font-size: 10px; position: relative; top: -10px;"></i>
                            </button>
                        </form>
                    </li>

                    <li class="nav-item">
                        <a href="#" id="cart" class = "text-white mt-2 m-0">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge light-blue lighten-2 productCartHeaderItemCount" style = "margin-left: 5px;">0</span>
                        </a>


                    </li>
                </ul>
            </div>
        </div>
    </nav>

</header>