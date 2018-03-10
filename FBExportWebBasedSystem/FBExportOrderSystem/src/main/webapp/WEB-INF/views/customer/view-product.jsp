<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<c:if test='${not empty product}' >

<div class = "container" style="margin-top: 40px;">
	<div class = "col">
            <header style = "margin-bottom: 10px;">
                <h1> Product Information </h1>
                <hr />
            </header>
        </div>
        
    <div class = "row mx-auto">

		
		        
        <!--Carousel Wrapper-->
        <div id="carousel-example-1z" class="carousel slide carousel-fade col-12" data-ride="carousel" >
            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                <li data-target="#carousel-example-1z" data-slide-to="3"></li>
            </ol>
            <!--/.Indicators-->

            <!--Slides-->
            <div class="carousel-inner" role="listbox">

                <!--First slide-->
                <div class="carousel-item active">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.price} php
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px;  width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.origin}
                    </span>

                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.productImageLink}' />" alt="First slide">
                </div>
                <!--/First slide-->
                <!--Second slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.price} php
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px;  width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.origin}
                    </span>
                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.previewImageLinks.get(0)}' />" alt="Second slide">
                </div>
                <!--/Second slide-->
                <!--Third slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.price} php
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px; width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.origin}
                    </span>
                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.previewImageLinks.get(1)}' />" alt="Third slide">

                </div>
                <!--/Third slide-->
                <!--4th slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.price} php
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px; width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        ${product.origin}
                    </span>
                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.previewImageLinks.get(2)}' />" alt="Third slide">

                </div>
                <!--/4th slide-->
            </div>
            <!--/.Slides-->
            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->

        <hr>

        <!--Content-->
        <div class="text-center card-body">
            <h4 class="card-title"> ${product.name} </h4>
            <p class="card-text">
                <i class="fa fa-quote-left"></i> ${product.description} </p>
				
				<c:choose>
					<c:when test="${product.weight <= 0}">
						<h4><b class = "red-text"> *Out of Stock </b> </h4><br>			
					</c:when>
					<c:otherwise>
						<h4><b class = "green-text"> *On Stock </b> </h4><br>
					</c:otherwise>
				</c:choose>
                <span class = "black-text"> Posted on: ${datePosted} </span><br>

	
			
			<security:authorize access = "hasAuthority('CUSTOMER')">
            <button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "margin-top:25px;">
                <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                Add to cart</button>
            </security:authorize>
            <security:authorize access= "!hasAuthority('CUSTOMER')">
            <br>
            <a href="<c:url value = '/login' />" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Login to add</a>
            </security:authorize>
            
            <hr>
            <div class="container">
            <div class="row">
                <div class="col-sm-3" style="margin-bottom:30px;">
                <br>
                <h4>Customer Feedback</h4>
                <h1>4.5</h1>
                <!--Review-->
                <i class="fa fa-star yellow-text fa-2x"> </i>
                <i class="fa fa-star yellow-text fa-2x"> </i>
                <i class="fa fa-star yellow-text fa-2x"> </i>
                <i class="fa fa-star yellow-text fa-2x"> </i>
                <i class="fa fa-star-half-full yellow-text fa-2x"> </i>

                </div>
                <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" role="progressbar" style="width: 90%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    90%
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" role="progressbar" style="width: 65%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    65%
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" role="progressbar" style="width: 45%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    45%
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" role="progressbar" style="width: 54%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    54%
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" role="progressbar" style="width: 10%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    10%
                    </div>
                </div>
                </div>



            </div>

            </div>
			<security:authorize access = "hasAuthority('CUSTOMER')">
				
            	<form id="reviewProduct" method="POST" action="<c:url value = '/review-product/${product.productId}' />">
            		<div class="md-form">

		            <textarea id="textarea-char-counter" class="md-textarea" name="review" length="120"></textarea>
		            <label for="textarea-char-counter">Add Review</label>
		            </div>
		            
		            <div class="text-right">
		                <div class="star-rating">
		                <input id="star-5" class="star-radio" type="radio" name="rating" value="5">
		                <label class="star" for="star-5">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <input id="star-4" class="star-radio" type="radio" name="rating" value="4">
		                <label class="star" for="star-4">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <input id="star-3" class="star-radio" type="radio" name="rating" value="3">
		                <label class="star" for="star-3">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <input id="star-2" class="star-radio" type="radio" name="rating" value="2">
		                <label class="star" for="star-2">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <input id="star-1" class="star-radio" type="radio" name="rating" value="1">
		                <label class="star" for="star-1">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                </div>
		               
		
		                <!-- Default button -->
		                <input type="submit" class="btn btn-default" value="Post Review" />
		
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		            </div>
            	</form>
            	
            </security:authorize>

            <br>
            <h4>Reviews<h4>
        </div>


    </div>
    
    <!-- COMMENTS -->
        <c:if test="${not empty reviewList}">
        	<c:forEach items="${reviewList}" var="review">
		        		<!--Grid row-->
			        	<div class="row mt-3">
			
			            <!--Grid column-->
			            <div class="col-lg-3 text-center">
			                <!--Featured image-->
			                <img src="https://mdbootstrap.com/img/Photos/Others/images/31.jpg" width="100" height="100" class="rounded-circle" alt="Second sample image" >
			            </div>
			            <!--Grid column-->
			
			            <!--Grid column-->
			            <div class="col-lg-9 col-xl-9">
			                <h3 class="mb-3 font-bold dark-grey-text">
			                </h3>
			                <p class="grey-text">${review.description}</p>
			                <p>by
			                <a class="font-bold dark-grey-text">${review.username}</a>, <fmt:formatDate type="both" dateStyle="long" timeStyle="medium" value="${review.date}" /></p>
			            </div>
			            <!--Grid column-->
		
			        </div>
			        <!--Grid row-->
			
			        <hr class="mb-5">
			       
        	</c:forEach>
        	
        </c:if>

        <!-- COMMENTS -->
	<button type="button" class="btn btn-default btn-lg btn-block">Show more comments</button>
<hr>
</div>

</c:if>