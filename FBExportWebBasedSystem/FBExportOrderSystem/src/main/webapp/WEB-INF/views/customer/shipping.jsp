<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

  <main>

    <div class = "container mt-4">

        <div class = "row">
            <div class = "col-sm-3">
                <h4 class = "pt-3">
                    Shipping
                    <i class="fa fa-ship ml-2" aria-hidden="true"></i>
                </h4>
            </div>
            
            <c:if test = "${(not empty param.orderId)}">
	            <div class = "col-9">
	                <form action = "<c:url value = '/shipping' />" class = "form-inline float-right">
	                    <input type="text" name = "orderId" class="form-control m-0 p-0" placeholder = "Order id" pattern = "[0-9]" title = "valid order id only">
	                    <button type="submit" class="btn btn-primary pt-2 pb-2 pl-4 pr-4">Search</button>
	                </form>
	            </div>
            </c:if>
        </div>


        <hr class = "mt-1" />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="<c:url value = '/view-profile' />" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="<c:url value = '/notifications' />" class="list-group-item">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="<c:url value = '/order-list' />" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="<c:url value = '/shipping' />" class="list-group-item active">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="<c:url value = '/your-address' />" class="list-group-item">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addresses
                        </a>
                        <a href="<c:url value = '/account-settings' />" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>
                        <a href="<c:url value = '/sign-out' />" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>

                </div>

            </div>

            <div class="col-lg-9">
            	
            	<c:choose>
            
	            	<c:when test = "${(param.orderId == null) || (empty param.orderId)}">
		            	<div class="row">
							<div class="col-12 pt-3 pl-5 pr-5">
							
							<form action = "<c:url value = '/shipping' />">
						                    
							    <h5 class="text-center"> Track shipping information by order id </h5>
							    <input type="text" name = "orderId" placeholder="Order id" class="text-center mt-3"> 
				
							    <div class="row">
								    <input type="submit" class="mt-3 mx-auto btn-primary pt-2 pb-2 pl-4 pr-4" value="SEARCH" pattern = "[0-9]" title = "valud order id only">
							    </div>
							    
						    </form>
						
						    </div>
		                </div>
	                </c:when>
	                
	             	<c:otherwise>
						
						<c:choose>
						
							<c:when test = "${order.shipping ne null}">
							
				                <div class="row">
				
				                    <div class="col-md-12">
				
				                        <div class = "row">
				                            <div class = "col">
				
				                                <div id = "shippingInformation">
				                                    <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
				                                        data-toggle="collapse" href="#shippingInformationCollapseItem " role="button" aria-expanded="false" aria-controls="shippingInformationCollapseItem" style = "cursor: pointer;"></i>
				                                    <span class = "h5-responsive"> <strong> Shipping information </strong> </span>
				                                    
				                                </div>
				
				                                <hr class = "mt-1" />
				
				                                <div class="collapse.show multi-collapse" id="shippingInformationCollapseItem">
				
				                                    <div class = "row no-gutters">
				                                        <div class = "col-lg-8">
				                                            <strong> Address <i class="fa fa-address-book-o" aria-hidden="true"></i> : ${order.shippingAddress.address.address} </strong>
				                                        </div>
				                                        <div class = "col-lg-4">
				                                            <strong> Zipcode <i class="fa fa-home" aria-hidden="true"></i> : ${order.shippingAddress.address.zipCode} </strong>
				                                        </div>
				                                    </div>
				                                    <div class = "row no-gutters">
				                                        <div class = "col-lg-8">
				                                            <strong> Country <i class="fa fa-globe" aria-hidden="true"></i> : ${order.shippingAddress.address.country} </strong>
				                                        </div>
				                                        <div class = "col-lg-4">
				                                            <strong> City <i class="fa fa-map" aria-hidden="true"></i> : ${order.shippingAddress.address.city} </strong>
				                                        </div>
				                                    </div>
				                                    <div class = "row no-gutters">
				                                        <div class = "col-lg-8">
				                                            <strong> Shipment status : ${(order.shipping.shipmentStatus eq 'ON_CARGO_SHIP') ? 'On Cargo Ship <i class="fa fa-ship" aria-hidden="true"></i>' 
				                                            																				: 'On Truck <i class="fa fa-truck" aria-hidden="true"></i>'}  </strong>
				                                        </div>
				                                        <div class = "col-lg-4">
				                                            <strong> Phone number <i class="fa fa-mobile-phone" aria-hidden="true"></i> : (+${order.shippingAddress.contact.countryCode}) ${order.shippingAddress.contact.phoneNumber} </strong>
				                                        </div>
				                                    </div>
				                                    <div class = "row no-gutters">
				                                        <div class = "col-lg-8">
				                                            <strong> Departure : <fmt:formatDate value = "${order.shipping.departureDate}" type = "date" dateStyle = "long" /> </strong>
				                                        </div>
				                                        <div class = "col-lg-4">
				                                            <strong> Arrival : <fmt:formatDate value = "${order.shipping.arrivalDate}" type = "date" dateStyle = "long" /> </strong>
				                                        </div>
				                                    </div>
				
				                                    <br />
				                                    
				                                    <c:if test = "${order.shipping.shipmentStatus eq 'ON_CARGO_SHIP'}">
				
					                                    <div>
					                                        <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
					                                            data-toggle="collapse" href="#vesselStatusCollapseItem " role="button" aria-expanded="false" aria-controls="vesselStatusCollapseItem" style = "cursor: pointer;"></i>
					                                        <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
					                                        <span class = "float-right" style = "font-size: 16px;">
					                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
					                                            <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
					                                        </span>
					                                    </div>
					
					                                    <hr class = "mt-1" />
					
					                                    <div class="collapse multi-collapse" id="vesselStatusCollapseItem">
				
					                                        <div class = "row no-gutters">
					                                            <div class = "col-md-8">
					                                                <strong> Vessel name: ${order.shipping.vesselStatus.vesselName} </strong>
					                                            </div>
					                                            <div class = "col-md-4">
					                                                <strong> IMO Number: ${order.shipping.vesselStatus.imoNumber}</strong>
					                                            </div>
					                                        </div>
					
					                                        <div class = "row no-gutters">
					                                            <div class = "col-md-8">
					                                                <strong> MMSI Number: ${order.shipping.vesselStatus.mmsiNumber} </strong>
					                                            </div>
					                                                <div class = "col-md-4">
					                                                <strong> Destination: ${order.shipping.vesselStatus.destination} </strong>
					                                            </div>
					                                        </div>
				
					                                        <hr class = "mt-1" />
					
					                                        <div class = "row">
					
					                                            <div class = "col">
					
					                                                <iframe name="marinetraffic" id="marinetraffic" width="100%" height="450" scrolling="no" frameborder="0"
					                                                        src="http://www.marinetraffic.com/en/ais/embed/zoom:5/centery:37.446/centerx:24.9467/maptype:1/shownames:true/mmsi:${order.shipping.vesselStatus.mmsiNumber}/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false">
					                                                        Browser does not support embedded objects.&lt;br/&gt;Visit directly &lt;a href="http://www.marinetraffic.com/"&gt;www.marinetraffic.com&lt;/a&gt;
					                                                </iframe>
					
					                                            </div>
					
					
					                                        </div>
					
				                                    	</div>
				
				
													</c:if>
				                                </div>
				
				                            </div>
				
				
				                        </div>
				
				                        <div class = "row">
				                            <div class = "col">
				                                <div id = "shippingLog">
				                                    <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
				                                        data-toggle="collapse" href="#shippingLogCollapseItem " role="button" aria-expanded="false" aria-controls="orderCollapseItem5" style = "cursor: pointer;"></i>
				                                    <span class = "h5-responsive"> <strong> Shipping Log </strong> </span>
				                                </div>
				
				                                <hr class = "mt-1" />
				
				                                <div class="collapse.show multi-collapse" id="shippingLogCollapseItem">
				                                    <div class="list-group" style = "max-height: 530px; overflow-y: auto;">
				                                    
				                                    	<c:choose>
				                                    	
				                                    		<c:when test = "${fn:length(order.shipping.shippingLog) > 0}">
				                                    
						                                    	<c:forEach var="shippingLogItemIndex" begin="1" end="${fn:length(order.shipping.shippingLog)}" step="1">
																   
																   <c:set var="shippingLogItemIndexRev" value="${fn:length(order.shipping.shippingLog) - shippingLogItemIndex}" />
																   
																   <span class="list-group-item list-group-item-action flex-column align-items-start">
							                                            
							                                            <div class="d-flex w-100 justify-content-between">
								                                            <h5 class="mb-1">${order.shipping.shippingLog[shippingLogItemIndexRev].header}</h5>
								                                            <small>
								                                            	<fmt:formatDate value="${order.shipping.shippingLog[shippingLogItemIndexRev].date}" type = "date" dateStyle = "LONG"/> -
								                                            	${order.shipping.shippingLog[shippingLogItemIndexRev].time}
								                                            </small>
							                                            </div>
							                                            
							                                            <p class="mb-1">${order.shipping.shippingLog[shippingLogItemIndexRev].description}</p> 
							                                            <small>${order.shipping.shippingLog[shippingLogItemIndexRev].address}</small>
							                                        </span>
																   
																   
																</c:forEach>
														
															</c:when>
															
															<c:otherwise>
															
																<div class="row">
							                                        <div class="mx-auto mt-2">
							                                            <h5> No shipping logs here </h5>
							                                        </div>
							                                    </div>
																
															</c:otherwise>
														
														</c:choose>
		
				                                    </div>
				                                </div>
				
				
				
				                            </div>
				                        </div>
				
				                    </div>
				
				
				                </div>
			                
			                </c:when>
		                
		                	<c:otherwise>
		                	
			                	<div class="row mt-5">
									<div class="col-12 pt-3 pl-5 pr-5">
									            
									    <h5 class="text-center"> Shipping information not exists yet for this order. </h5>
								
								    </div>
				                </div>
		                		
		                	</c:otherwise>
		                
		                </c:choose>
				
					</c:otherwise>
				</c:choose>

            </div>

        </div>

        <hr />
    </div>



</main>