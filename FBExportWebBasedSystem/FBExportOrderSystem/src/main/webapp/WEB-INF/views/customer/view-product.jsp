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
                        <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			            <input type = "hidden" id = "real-price-approx" value = "" />
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px;  width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Available : <span>${product.weight}</span> Kg
                    </span>

                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.productImageLink}' />" alt="First slide">
                </div>
                <!--/First slide-->
                <!--Second slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			            <input type = "hidden" id = "real-price-approx" value = "" />
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px;  width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Available : <span>${product.weight}</span> Kg
                    </span>
                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.previewImageLinks.get(0)}' />" alt="Second slide">
                </div>
                <!--/Second slide-->
                <!--Third slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			            <input type = "hidden" id = "real-price-approx" value = "" />
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px; width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Available : <span>${product.weight}</span> Kg
                    </span>
                    <img style="width: 100%; height: 450px;" src="<c:url value = '${product.previewImageLinks.get(1)}' />" alt="Third slide">

                </div>
                <!--/Third slide-->
                <!--4th slide-->
                <div class="carousel-item">
                    <span style = "position: absolute; right:0px; color: white; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			            <input type = "hidden" id = "real-price-approx" value = "" />
                    </span>

                    <span style = "position: absolute; right:0px; color: white; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
                        per <span> kilograms </span>
                    </span>
                    <span style = "position: absolute; color: white; bottom: 0px; width: 40%; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                        Available : <span>${product.weight}</span> Kg
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
        	<input type="hidden" value="${product.productId}" id="productId"/>
            <h4 class="card-title" style="word-break: break-all;"> ${product.name}</h4>
            <h6 id="productOrigin" style="word-break: break-all;"> Origin : <span>${product.origin}</span></h6>
            <p class="card-text" style="word-break: break-all;">
                <i class="fa fa-quote-left"></i>${product.description}</p>
				
				<c:choose>
					<c:when test="${product.weight <= 0}">
						<h4><b class = "red-text" id = "product-stock-status">Out of Stock</b> </h4><br>			
					</c:when>
					<c:otherwise>
						<h4><b class = "green-text" id = "product-stock-status">On Stock</b> </h4><br>
					</c:otherwise>
				</c:choose>
                <span class = "black-text"> Posted on: <span id="product-date-posted">${datePosted}</span> </span><br>

	
			
			<security:authorize access = "hasAuthority('CUSTOMER')">
					<c:if test="${product.weight > 0}">
						<button type = "button" class="btn btn-primary btnProductItemAddToCart" style = "margin-top:25px;">
                		<i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
                		Add to cart</button>
					</c:if>
            </security:authorize>
            <security:authorize access= "!hasAuthority('CUSTOMER')">
            <br>
            	<c:if test="${product.weight > 0}">
            		<a href="<c:url value = '/login' />" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Login to add</a>
            	</c:if>
            </security:authorize>
            
            <hr>
            <div class="container">
            <div class="row">
                <div class="col-sm-3" style="margin-bottom:30px;">
                <br>
                <h4>Customer Feedback</h4>
                <h1 id="averageRating"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2"  value='${averageRate}' /></h1>
                <!--Review-->
                <div id="averageStars">
                	<i id="star1"> </i>
                	<i id="star2"> </i>
               	 	<i id="star3"> </i>
                	<i id="star4"> </i>
                	<i id="star5"> </i>
                </div>

                </div>
                <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div id="count5-progress" class="progress-bar" role="progressbar" style="width: <c:out value = '${rates.get("Count5.0") div rates.get("CountTotal") * 100 }'/>%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <span id="count5-rate"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value='${rates.get("Count5.0") eq 0.0 ? 0.0 : rates.get("Count5.0") div rates.get("CountTotal") * 100 }' />% </span>
                   
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div id="count4-progress" class="progress-bar" role="progressbar" style="width: <c:out value = '${rates.get("Count4.0") eq 0.0 ? 0.0 : rates.get("Count4.0") div rates.get("CountTotal") * 100 }'/>%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <span id="count4-rate"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value='${rates.get("Count4.0") eq 0.0 ? 0.0 : rates.get("Count4.0") div rates.get("CountTotal") * 100 }' />% </span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div id="count3-progress" class="progress-bar" role="progressbar" style="width: <c:out value = '${rates.get("Count3.0") div rates.get("CountTotal") * 100 }'/>%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <span id="count3-rate"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value='${rates.get("Count3.0") eq 0.0 ? 0.0 : rates.get("Count3.0") div rates.get("CountTotal") * 100 }' />% </span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div id="count2-progress" class="progress-bar" role="progressbar" style="width: <c:out value = '${rates.get("Count2.0") div rates.get("CountTotal") * 100 }'/>%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <span id="count2-rate"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value='${rates.get("Count2.0") eq 0.0 ? 0.0 : rates.get("Count2.0") div rates.get("CountTotal") * 100 }' />% </span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-9">
                    <div class="progress" style="height: 20px;">
                        <div id="count1-progress" class="progress-bar" role="progressbar" style="width: <c:out value = '${rates.get("Count1.0") div rates.get("CountTotal") * 100 }'/>%; height: 20px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    </div>

                    <div class="col-sm-3">
                    <i class="fa fa-star yellow-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <i class="fa fa-star grey-text fa-lg"> </i>
                    <span id="count1-rate"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value='${rates.get("Count1.0") eq 0.0 ? 0.0 : rates.get("Count1.0") div rates.get("CountTotal") * 100 }' />% </span>
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
		            
		            <div id="errorReview">
		            </div>
		            
		            <div class="text-right">
		                <div class="star-rating">
		                <c:choose>
		                	<c:when test="${starRate eq 5.0}">
		                		<input id="star-5" class="star-radio" type="radio" name="rating" value="5" checked >
		                	</c:when>
		                	<c:otherwise>
		                	    <input id="star-5" class="star-radio" type="radio" name="rating" value="5"  >
		                	</c:otherwise>
		                </c:choose>
		                <label class="star" for="star-5">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <c:choose>
		                	<c:when test="${starRate eq 4.0}">
		                		<input id="star-4" class="star-radio" type="radio" name="rating" value="4" checked >
		                	</c:when>
		                	<c:otherwise>
		                	    <input id="star-4" class="star-radio" type="radio" name="rating" value="4"  >
		                	</c:otherwise>
		                </c:choose>
		                <label class="star" for="star-4">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <c:choose>
		                	<c:when test="${starRate eq 3.0}">
		                		<input id="star-3" class="star-radio" type="radio" name="rating" value="3" checked >
		                	</c:when>
		                	<c:otherwise>
		                	    <input id="star-3" class="star-radio" type="radio" name="rating" value="3"  >
		                	</c:otherwise>
		                </c:choose>
		                <label class="star" for="star-3">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <c:choose>
		                	<c:when test="${starRate eq 2.0}">
		                		<input id="star-2" class="star-radio" type="radio" name="rating" value="2" checked >
		                	</c:when>
		                	<c:otherwise>
		                	    <input id="star-2" class="star-radio" type="radio" name="rating" value="2"  >
		                	</c:otherwise>
		                </c:choose>
		                <label class="star" for="star-2">
		                    <i class="fa fa-star fa-lg"> </i>
		                </label>
		
		                <c:choose>
		                	<c:when test="${starRate eq 1.0}">
		                		<input id="star-1" class="star-radio" type="radio" name="rating" value="1" checked >
		                	</c:when>
		                	<c:otherwise>
		                	    <input id="star-1" class="star-radio" type="radio" name="rating" value="1"  >
		                	</c:otherwise>
		                </c:choose>
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
          	
    			<c:choose>
    				<c:when test = "${fn:length(reviewList) > 0}">
	            		<h4>Reviews<h4>
	            	</c:when>
	            	<c:otherwise>
		        		<h4>No Reviews<h4>
	    			</c:otherwise>
    			</c:choose>
        </div>


    </div>
    
    <!-- COMMENTS -->
    <div id="comments">
    	<c:choose>
    	
    		<c:when test = "${fn:length(reviewList) > 0}">
    			<c:if test="${not empty reviewList}">
		        	<c:forEach items="${reviewList}" var="review">
		        		<c:if test="${not empty customerList}">
		        			<c:forEach items="${customerList}" var="customer">
		        				<c:if test="${customer.username eq review.username}">
		        					
		        						<!--Grid row-->
		        						<div>
								        <div class="row mt-3">
								
								            <!--Grid column-->
								            <div class="col-lg-3 text-center">
								                <!--Featured image-->
								                <img src="<c:url value="${customer.profileImageLink}" />" width="100" height="100" class="rounded-circle" alt="<c:out value="${customer.username}" />" >
								            </div>
								            <!--Grid column-->
								
								            <!--Grid column-->
								            <div class="col-lg-9 col-xl-9">
								            	<c:if test="${sessionScope.customerUsername eq review.username}">
								            		<button type="button" class="close deleteReview" aria-label="Close" style="cursor: pointer;"><span aria-hidden="true">&times;</span></button>
								            	</c:if>
								            	
								            	<input class="reviewId" type="hidden" value="${review.reviewId}"/>
								                <h3 class="mb-3 font-bold dark-grey-text">
								                </h3>
								                <p class="grey-text">${review.description}</p>
								                <p>by
								                <a class="font-bold dark-grey-text">${review.username}</a>, <fmt:formatDate type="both" dateStyle="long" timeStyle="medium" value="${review.date}" /></p>
								            	
								            	
								            </div>
								            <!--Grid column-->
											
								        </div>
								        <hr class="mb-5">
								       </div>
								        <!--Grid row-->
		        				</c:if>
		        			</c:forEach>	
		        		</c:if>
				    	
					       
		        	</c:forEach>
		        	
		        </c:if>
    		</c:when>
    		
    		
    	</c:choose>
        
      
	</div>
	
	  <c:if test = "${reviewCount > 3}">

		    <div class = "row">
		        <button type="button" id = "see-more-customer-review" style="margin: 0 auto;" class="btn btn-default btn-lg btn-block">Show more comments</button>
		    	<img class="see-more-view-loader mx-auto" style="display:none;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
		    </div>
		    
		    <hr>
		    
	    </c:if>
        <!-- COMMENTS -->
	

</div>

</c:if>