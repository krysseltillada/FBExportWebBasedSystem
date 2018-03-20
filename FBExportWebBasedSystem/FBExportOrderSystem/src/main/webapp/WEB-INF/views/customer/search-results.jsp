<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container mt-5">

	<form action = "<c:url value = '/search-results/filter'/>" >
		
		<input type = "hidden" name = "q" value = "${param.q}" />
		<input type = "hidden" name = "priceRange" value = "" id = "price-range" />
		
	    <div class = "row">
	        <div class = "col">
	
	                <div class = "row mb-1">
	                    <div class = "col-md-9">
	                        <header>
	                        
	                            <h5> <span>${(productSearchCount > 0) ? productSearchCount : 'No'} Search results for "${param.q}"</span>
	                            </h5>
	                        </header>
	                    </div>
	                    <div class = "col-md-3 pl-5">
	
	                            <div class = "form-inline">
	                                <label class = "mr-2"> Sort by: </label>
	                                <select name = "sortBy" class = "browser-default">
	                                        <option value = "p-high-to-low" ${param.sortBy eq 'p-high-to-low' ? 'selected' : ''}> price: high to low </option>
	                                        <option value = "p-low-to-high" ${param.sortBy eq 'p-low-to-high' ? 'selected' : ''}> price: low to high </option>
	                                        <option value = "r-high-to-low" ${param.sortBy eq 'r-high-to-low' ? 'selected' : ''}> rating: high to low </option>
	                                        <option value = "r-low-to-high" ${param.sortBy eq 'r-low-to-high' ? 'selected' : ''}> rating: low to high </option>
	                                    </select>
	                            </div>
	
	                    </div>
	
	                </div>
	
	
	            <hr class = "m-0 mb-2"/>
	        </div>
	    </div>

	    <div class = "row">
	
	        <div class = "col">
	
	                <div class = "row mb-2">
	                        <div class = "col-md-3 mt-1">
	                            <label> Price: <span class = "price" id = "min-price">0</span> <span class = "currency>">PHP</span> - <span class = "price" id = "max-price">${highestProductPrice}</span> <span class = "currency">PHP</span> </label>
	                        </div>
	
	                        <div class = "col-md-4 mt-1">
	                            <div id = "slider" class = "mt-2" > </div>
	                        </div>
	
	                        <div class = "col-md-3 mt-1">
	
	                                <div class = "form-inline">
	                                    <label class = "mr-3"> Origin: </label>
	                                    <select name = "origin" class = "browser-default" style = "width: 150px;">
	                                    	<option value = "none" selected> Choose origin </option>
	                                    	<c:forEach var = "origin" items = "${productOrigins}">
	                                    		<option value = "${origin}"> ${origin} </option>
	                                    	</c:forEach>
	                                    </select>
	                                </div>
	
	                        </div>
	
	                        <div class = "col-md-2">
	                            <button type="submit" class="btn btn-primary m-0" style = "padding: 10px 56px 10px 56px;">
	                                Filter
	                            </button>
	                        </div>
	
	                </div>
	
	
	                <hr class = "mt-1"/>
	        </div>
	    </div>

	</form>

</div> 

<c:choose>

	<c:when test = "${fn:length(productList) > 0}">

		<div class = "container">
		
			<div class = "row mx-auto productGridList" style = "padding-left: 60px; padding-right: 60px;">
				
				<c:forEach var = "product" items = "${productList}">
				
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
						                      ${product.origin}
						                </span>
						
						                <img src="<c:url value = '${product.productImageLink}' />" alt="${product.name}" height = "200" />
						
						
						                <div class="card-body">
						
						
						                    <h4 class="card-title"> <a href = "<c:url value = '/view-product/${product.productId}' />" class = "black-text"> ${product.name} </a> </h4>
						
						                    <hr class = "m-0"/>
						
						                    <p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">${product.description}</p>
						
						                    <hr class = "m-0"/>
						
						                    <div class = "mt-1">
						
												<c:choose>
						
													<c:when test = "${isCustomerLoggedIn}">
														<c:if test="${product.weight > 0}">
															<button type = "button" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;" disabled>
								                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
								                            Add to cart</button>
														</c:if>
								                        
							                        </c:when>
							                        <c:otherwise>
							                        	<c:if test="${product.weight > 0}">
							                        		<a href="<c:url value = '/login' />" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
								                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
								                            Login to add</a>
							                        	</c:if>
							                        </c:otherwise>
							                            
						                        </c:choose>
						                           
											
												<span style = "font-size: 12px; position: absolute; top: 155px;" class = "black-text"> Stocks: <span id = "product-stock-status" style="color: ${(product.weight > 0 ) ? 'green' : 'red'}">${(product.weight > 0 ) ? 'On Stock' : 'Out of Stock'} </span> </span>
						                        <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: <span id = "product-date-posted">${product.datePosted}</span> </span>
						                        
						                        <input type = "hidden" value = "${product.productId}" id = "product-id" />
						                    </div>
						                </div>
						
						            </div>
						        </div>
			
			   </c:forEach>
			   
			</div>
		
			<hr />
		
			<div class = "row">
			    <div style = "margin-left: auto; margin-right: auto; margin-top: 10px;">
			            <nav>
			                <ul class="pagination pg-blue">
			                
			                	<c:choose>
			                	
			                		<c:when test = "${(param.sortBy == null) || (empty param.sortBy)}">
			                    
					                    <li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
											<c:url value = "/search-results" var = "prevSearchResultsLink" >
												<c:param name="q" value = "${param.q}" />
												<c:param name="pageNumber" value="${currentPageCount - 1}" />
											</c:url>
										    <a class="page-link" aria-label="Previous" href = "${prevSearchResultsLink}">
										    	<span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
										    </a>
										</li>
					                    
					                    <c:forEach var = "pageCount" begin = "0" end = "${numberOfPages}">
											<li class="page-item ${pageCount eq currentPageCount ? 'active' : ''}">
												<c:url value = "/search-results" var = "productSearchPageLink" >
													<c:param name="q" value = "${param.q}" />
											    	<c:param name="pageNumber" value="${pageCount}" />
											    </c:url>
											    <a class="page-link" href = "${productSearchPageLink}">${pageCount + 1}</a>
											</li>
										</c:forEach>
										
										<li class="page-item ${currentPageCount eq numberOfPages ? 'disabled' : ''}">
											<c:url value = "/search-results" var = "nextSearchResultsLink" >
												<c:param name="q" value = "${param.q}" />
												<c:param name="pageNumber" value="${currentPageCount + 1}" />
											</c:url>
										    <a class="page-link" aria-label="Next" href = "${nextSearchResultsLink}">
										    	<span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										    </a>
										</li>
										
									</c:when>
									
									<c:otherwise>
									
										<li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
											<c:url value = "/search-results/filter" var = "prevSearchResultsLink" >
												<c:param name="q" value = "${param.q}" />
												<c:param name="pageNumber" value="${currentPageCount - 1}" />
												<c:param name="priceRange" value = "${param.priceRange}" />
												<c:param name="sortBy" value = "${param.sortBy}" />
												<c:param name="origin" value = "${param.origin}" />
											</c:url>
										    <a class="page-link" aria-label="Previous" href = "${prevSearchResultsLink}">
										    	<span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
										    </a>
										</li>
					                    
					                    <c:forEach var = "pageCount" begin = "0" end = "${numberOfPages}">
											<li class="page-item ${pageCount eq currentPageCount ? 'active' : ''}">
												<c:url value = "/search-results/filter" var = "productSearchPageLink" >
													<c:param name="q" value = "${param.q}" />
											    	<c:param name="pageNumber" value="${pageCount}" />
											    	<c:param name="priceRange" value = "${param.priceRange}" />
													<c:param name="sortBy" value = "${param.sortBy}" />
													<c:param name="origin" value = "${param.origin}" />
											    </c:url>
											    <a class="page-link" href = "${productSearchPageLink}">${pageCount + 1}</a>
											</li>
										</c:forEach>
										
										<li class="page-item ${currentPageCount eq numberOfPages ? 'disabled' : ''}">
											<c:url value = "/search-results/filter" var = "nextSearchResultsLink" >
												<c:param name="q" value = "${param.q}" />
												<c:param name="pageNumber" value="${currentPageCount + 1}" />
												<c:param name="priceRange" value = "${param.priceRange}" />
												<c:param name="sortBy" value = "${param.sortBy}" />
												<c:param name="origin" value = "${param.origin}" />
											</c:url>
										    <a class="page-link" aria-label="Next" href = "${nextSearchResultsLink}">
										    	<span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										    </a>
										</li>
									
									</c:otherwise>
									
								</c:choose>
			                    
				                
			                </ul>
			            </nav>
			    </div>
			</div>
		</div>
	
	</c:when>
	
	<c:otherwise>
		<div class = "container p-5">
			<div class = "row mx-auto">
				<div class = "col">
					<h5> You search for <strong>"${param.q}"</strong> but no results show up.</h5>
					<br />
					<h6> You could try something like.</h6>
					
					<ul>
					  <li> Using more general search terms </li>
					  <li> Checking your spelling </li>
					</ul>
					
				</div>
			</div>
		</div>
	</c:otherwise>

</c:choose>