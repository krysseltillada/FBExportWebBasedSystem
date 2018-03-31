<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container">

    <h2 class = "h2-responsive text-center mt-4 wow fadeIn"> Popular Products </h2>
	
	<c:choose>
        
        
	        <c:when test = "${fn:length(mostPopularProductList) > 0}">

			    <div id="popularProductsCarousel" class="carousel slide carousel-fade pl-5 pr-5 wow fadeIn" data-ride="carousel">
			
					<hr />
					
			        <ol class="carousel-indicators">
			        	<c:forEach var = "circleIndicatorCount" begin = "0" end = "${fn:length(mostPopularProductList) -1}">
				            <li data-target="#popularProductsCarousel" data-slide-to="${circleIndicatorCount}" ${(circleIndicatorCount eq 0) ? 'class = "active"' : ''}></li>
			            </c:forEach>
			        </ol>
			
			        	<div class="carousel-inner" role="listbox">
			        
					        	<c:forEach var = "productCountIndex" begin = "0" end = "${fn:length(mostPopularProductList) - 1}">
					        	
						            <div class="carousel-item ${ (productCountIndex eq 0) ? 'active' : '' }">
						                <div class="view hm-black-light" style = "height: 350px;">
						                    <img class="d-block w-100 img-fluid" src="<c:url value = '${mostPopularProductList[productCountIndex].productImageLink}' />" alt="First slide">
						                    <div class="mask"></div>
						                </div>
						                <div class="carousel-caption">
						                    <h3 class="h3-responsive"><a class = "text-white" href = "<c:url value = '/view-product/${mostPopularProductList[productCountIndex].productId}' />"> ${mostPopularProductList[productCountIndex].name} </a></h3>
						                    <p>${mostPopularProductList[productCountIndex].origin}</p>
						                </div>
						            </div>
						           
						          </c:forEach>
			
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
    
    	  </c:when>
        
          <c:otherwise>
		         	
		         	<div class="carousel slide carousel-fade pl-5 pr-5 wow fadeIn">
		         		<hr />
		         		<p class = "text-center"> No popular products Posted. </p>
		         	</div>
		         	
		  </c:otherwise>
		          
	</c:choose>
</div>

<div class = "container mt-4">
    <h2 class = "h2-responsive  mt-3 ml-5 wow fadeIn"> Most Viewed product </h2>

    <hr class = "ml-5 mr-5"/>

    <div class = "row mx-auto wow fadeIn productGridList">
    
    	<c:choose>
    	
    		<c:when test = "${fn:length(mostViewedProductList) > 0}">

		    	<c:forEach var = "product" items = "${mostViewedProductList}">
		
			        <div class = "col-md-4">
			            <div class="card card-product hoverable">
			
			                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
			                   	 <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			                   	 <input type = "hidden" id = "real-price-approx" value = "" />
			                </span>
			
			                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
			                        Per <span> Kilograms </span>
			                </span>
			
			                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
			                      Available : <span>${product.weight}</span> Kg
			                </span>
			
			                <img src="<c:url value = '${product.productImageLink}' />" alt="${product.name}" height = "200" />
			
			
			                <div class="card-body">
			
			
			                    <h4 class="card-title" style = "height: 30px; max-height: 30px; overflow-y: auto;"> <a href = "<c:url value = '/view-product/${product.productId}' />" class = "black-text"> ${product.name} </a> </h4>
			
			                    <hr class = "m-0"/>
			
			                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Origin : <span>${product.origin}</span> <br/>Description : <span>${product.description}</span></p>
			
			                    <hr class = "m-0"/>
			
			                    <div class = "mt-1">
			
									<c:choose>
			
										<c:when test = "${isCustomerLoggedIn}">
											<c:if test="${product.status ne 'OUT_OF_STOCK'}">
												<button type = "button" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;" disabled>
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Add to cart</button>
											</c:if>
					                        
				                        </c:when>
				                        <c:otherwise>
				                        	<c:if test="${product.status ne 'OUT_OF_STOCK'}">
				                        		<a href="<c:url value = '/login' />" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Sign in</a>
				                        	</c:if>
				                        </c:otherwise>
				                            
			                        </c:choose>
			                           
								
									<span style = "font-size: 12px; position: absolute; top: 155px;" class = "black-text"> Stocks: <span id = "product-stock-status" style="color: ${(product.status != 'OUT_OF_STOCK' ) ? 'green' : 'red'}">${(product.status !='OUT_OF_STOCK' ) ? 'On Stock' : 'Out of Stock'} </span> </span>
			                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: <span id = "product-date-posted"> <fmt:formatDate value = '${product.datePosted}' type = 'date' dateStyle = 'LONG' /> </span> </span>
			                        
			                        <input type = "hidden" value = "${product.productId}" id = "product-id" />
			                    </div>
			                </div>
			
			            </div>
			        </div>
			        
		        </c:forEach>    
		        
	        </c:when>
	        
	        <c:otherwise>
				<div class = "mx-auto">
	        		<p> No Most viewed Products Posted. </p>
	        	</div>
	        </c:otherwise>

		</c:choose>
		
    </div>
    
    <c:if test = "${mostViewedProductCount > 3}">

	    <div class = "row">
	        <button type="button" id = "see-more-most-viewed-products" class="btn btn-primary mx-auto" disabled>See more</button>
	    	<img class="see-more-most-view-loader mx-auto" style="display:none;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
	    </div>
	    
    </c:if>

</div>

<div class = "container mt-4">
    <h2 class = "h2-responsive  mt-3 ml-5 wow fadeIn"> Newest products </h2>

    <hr class = "ml-5 mr-5"/>

    <div class = "row mx-auto wow fadeIn productGridList">
    
    	<c:choose>
    		
    		<c:when test = "${fn:length(newLatestProductList) > 0}"> 
		    	<c:forEach var = "product" items = "${newLatestProductList}">
		
			        <div class = "col-md-4">
			            <div class="card card-product hoverable">
			
			                <span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
			                   	 <span id = "price">${product.price}</span> <span id = "currency">PHP</span>
			                   	 <input type = "hidden" id = "real-price-approx" value = "" />
			                </span>
			
			                <span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
			                        Per <span> Kilograms </span>
			                </span>
			
			                <span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
			                      Available : <span>${product.weight}</span> Kg
			                </span>
			
			                <img src="<c:url value = '${product.productImageLink}' />" alt="${product.name}" height = "200" />
			
			                <div class="card-body" >
			
			                    <h4 class="card-title" style = "height: 30px; max-height: 30px; overflow-y: auto;"> <a href = "<c:url value = '/view-product/${product.productId}' />" class = "black-text"> ${product.name} </a> </h4>
			
								
			                    <hr class = "m-0"/>
			
			                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">Origin : <span>${product.origin}</span> <br/>Description : <span>${product.description}</span></p>
			
			                    <hr class = "m-0"/>
			
			                    <div class = "mt-1">
			
			                        <c:choose>
			
										<c:when test = "${isCustomerLoggedIn}">
											<c:if test="${product.status ne 'OUT_OF_STOCK'}">
												<button type = "button" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;" disabled>
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Add to cart</button>
											</c:if>
					                        
				                        </c:when>
				                        <c:otherwise>
				                        	<c:if test="${product.status ne 'OUT_OF_STOCK'}">
				                        		
				                        		<a href="<c:url value = '/login' />" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
					                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
					                            Sign in</a>
					                            
				                        	</c:if>
				                        </c:otherwise>
				                            
			                        </c:choose>
			
									<span style = "font-size: 12px; position: absolute; top: 155px;" class = "black-text"> Stocks: <span id = "product-stock-status" style="color: ${(product.status != 'OUT_OF_STOCK' ) ? 'green' : 'red'}">${(product.status ne 'OUT_OF_STOCK' ) ? 'On Stock' : 'Out of Stock'} </span> </span>
			                        
			                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: <span id = "product-date-posted"> <fmt:formatDate value = '${product.datePosted}' type = 'date' dateStyle = 'LONG' /> </span> </span>
			                        
			                        <input type = "hidden" value = "${product.productId}" id = "product-id" />
			                    </div>
			                </div>
			
			            </div>
			        </div>
			        
		        </c:forEach>
	        </c:when>
	        
	        <c:otherwise>
	        	<div class = "mx-auto">
	        		<p> No Newest Products Posted. </p>
	        	</div>
	        </c:otherwise>

		</c:choose>
		
    </div>
    
    
    <c:if test = "${newLatestProductCount > 3}">

	    <div class = "row">
	        <button type="button" id = "see-more-newest-products" class="btn btn-primary mx-auto" disabled>See more</button>
	        <img class="see-more-newest-loader mx-auto" style="display:none;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
	    </div>
    
    </c:if>

</div>      
