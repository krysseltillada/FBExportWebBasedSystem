<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container">

    <h2 class = "h2-responsive text-center mt-4 wow fadeIn"> Popular Products </h2>

    <div id="popularProductsCarousel" class="carousel slide carousel-fade pl-5 pr-5 wow fadeIn" data-ride="carousel">

        <hr />

        <ol class="carousel-indicators">
            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-2" data-slide-to="1"></li>
            <li data-target="#carousel-example-2" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="view hm-black-light" style = "height: 350px;">
                    <img class="d-block w-100 img-fluid" src="resources/customer/img/lapu-lapu-fish.jpg" alt="First slide">
                    <div class="mask"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive">Light mask</h3>
                    <p>First text</p>
                </div>
            </div>

                <div class="carousel-item">
                <div class="view hm-black-light" style = "height: 350px;">
                    <img class="d-block w-100 img-fluid" src="resources/customer/img/lapu-lapu-fish.jpg" alt="Third slide">
                    <div class="mask"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive">Slight mask</h3>
                    <p>Second text</p>
                </div>
            </div>

            <div class="carousel-item">
                <div class="view hm-black-light" style = "height: 350px;">
                    <img class="d-block w-100 img-fluid" src="resources/customer/img/lapu-lapu-fish.jpg" alt="Third slide">
                    <div class="mask"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive">Slight mask</h3>
                    <p>Third text</p>
                </div>
            </div>
        </div>

        <a class="carousel-control-prev" href="#popularProductsCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#popularProductsCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class = "container mt-4">
    <h2 class = "h2-responsive  mt-3 ml-5 wow fadeIn"> Most Viewed product </h2>

    <hr class = "ml-5 mr-5"/>

    <div class = "row mx-auto wow fadeIn productGridList">

        <div class = "col-md">
            <div class="card hoverable">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    200.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Laguna oh laguna laguna baldeeee ohh yeaaaaa
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Puffer fish </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>

        <div class = "col-md">
            <div class="card hoverable" style = "margin-right: 0px;">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    1000.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        sa imagination sea :)
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Baby Shark </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">baby shark durudurudu baby shark dudururuduru </p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>


        <div class = "col-md">
            <div class="card hoverable">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    500.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        sa mars
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Lapu Lapu fish </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <div class = "row">
        <button type="button" class="btn btn-primary mx-auto">See more</button>
    </div>

</div>

<div class = "container mt-4">
    <h2 class = "h2-responsive  mt-3 ml-5 wow fadeIn"> New products </h2>

    <hr class = "ml-5 mr-5"/>

    <div class = "row mx-auto wow fadeIn productGridList">

        <div class = "col-md">
            <div class="card hoverable">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    200.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Laguna oh laguna laguna baldeeee ohh yeaaaaa
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Puffer fish </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>

        <div class = "col-md">
            <div class="card hoverable" style = "margin-right: 0px;">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    1000.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        sa imagination sea :)
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Baby Shark </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">baby shark durudurudu baby shark dudururuduru </p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>


        <div class = "col-md">
            <div class="card hoverable">

                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                    500.00 php
                </span>

                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                </span>

                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        sa mars
                </span>

                <img src="resources/customer/img/lapu-lapu-fish.jpg" alt="Card image cap" height = "200" />



                <div class="card-body">


                    <h4 class="card-title"> <a href = "#" class = "black-text"> Lapu Lapu fish </a> </h4>

                    <hr class = "m-0"/>

                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                    <hr class = "m-0"/>

                    <div class = "mt-1">

                        <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                            Add to cart</button>

                        <span style = "font-size: 12px; position: absolute; top: 155px;"> Fresh until: <span class = "red-text"> nov 28 2017 </span> </span>
                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: nov 19 2017 </span>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <div class = "row">
        <button type="button" class="btn btn-primary mx-auto">See more</button>
    </div>

</div>      
