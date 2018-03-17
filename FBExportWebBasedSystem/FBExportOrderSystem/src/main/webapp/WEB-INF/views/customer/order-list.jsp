 <%@ include file = "../../lib/tags/tag-libraries.jsp" %>
 
 <main>

    <div class = "container mt-4">

        <div class = "row">
            <div class = "col-sm-3">
                <h4 class = "pt-3">
                    Order Lists
                    <i class="fa fa-reorder ml-2" aria-hidden="true"></i>
                </h4>
            </div>
            <div class = "col-sm-9">
            
                <form id = "filterForm" action = "<c:url value = '/order-list/filter' />" class = "form-inline float-left small mt-2">
                    
                    <label class="mr-sm-2" for="inlineFormCustomSelect">Filter by</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" name = "filterBy" id = "FilterBy">
                        <option value = "All" ${param.filterBy eq 'All' ? 'selected' : ''}>All</option>
                        <option value="Pending" ${param.filterBy eq 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Approved" ${param.filterBy eq 'Approved' ? 'selected' : ''}>Approved</option>
                        <option value="Rejected" ${param.filterBy eq 'Rejected' ? 'selected' : ''}>Rejected</option>
                        <option value="Received" ${param.filterBy eq 'Received' ? 'selected' : ''}>Received</option>
                        <option value="Paid" ${param.filterBy eq 'Paid' ? 'selected' : ''}>Paid</option>
                        <option value="To Ship" ${param.filterBy eq 'To Ship' ? 'selected' : ''}>To Ship</option>
                        <option value="Returned" ${param.filterBy eq 'Returned' ? 'selected' : ''}>Returned</option>
                        <option value="Cancelled" ${param.filterBy eq 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                        <option value="Refund" ${param.filterBy eq 'Refund' ? 'selected' : ''}>Refund</option>
                        <option value="Cash on delivery" ${param.filterBy eq 'Cash on delivery' ? 'selected' : ''}>Cash on delivery</option>
                        <option value="Paypal" ${param.filterBy eq 'Paypal' ? 'selected' : ''}> Paypal </option>
                    </select>

                
                    <label class="mr-sm-2" for="inlineFormCustomSelect">Sort by</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" name = "sortBy" id = "SortBy">
                        <option value= "Unsorted" ${param.sortBy eq 'Unsorted' ? 'selected' : ''}>Unsorted</option>
                        <option value="Date ordered(latest)" ${param.sortBy eq 'Date ordered(latest)' ? 'selected' : ''}>Date ordered (latest)</option>
                        <option value="Date ordered(oldest)" ${param.sortBy eq 'Date ordered(oldest)' ? 'selected' : ''}>Date ordered (oldest)</option>
                        <option value="Order id(latest)" ${param.sortBy eq 'Order id(latest)' ? 'selected' : ''}> Order id (latest)</option>
                        <option value="Order id(oldest)" ${param.sortBy eq 'Order id(oldest)' ? 'selected' : ''}> Order id (oldest)</option>
                    </select>
                    
                </form>
				<form action = "<c:url value = '/order-list' />" class = "form-inline small float-right">
					<input type="text" name="orderId" class="form-control m-0 p-0 ml-5" placeholder = "Order id">
                    <button type="submit" class="btn btn-primary pt-2 pb-2 pl-4 pr-4">Search</button>
				</form>   
				
				             
            </div>
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
                        <a href="#" class="list-group-item">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="<c:url value = '/view-profile' />" class="list-group-item active">
                            <i class="fa fa-reorder mr-2" aria-hidsden="true"></i>
                            Order Lists
                        </a>
                        <a href="<c:url value = '/shipping'/>" class="list-group-item">
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

                <div class="row">
                    <div class="col-md-12">

                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Orders</a>
                            </li>
                            <!-- 
                            <li class="nav-item">
                                <a class="nav-link" href="#">Returned orders</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Cancelled orders</a>
                            </li>  -->
                            <c:if test = "${pageCount > 0}">
	                            <li class="nav-item dropdown ml-2">
	                                <a class = "btn btn-primary waves-effect waves-light p-2 m-0 btn-refresh" href = "javascript:void(0)"> Refresh  <i class="fa fa-refresh ml-2" aria-hidden="true"></i> </a>
	                            </li>
                            </c:if>
                        </ul>
                        

                        <div>

                            <div class="list-group" ${pageCount > 0 ? 'style = "border-bottom: 1px solid #DFDFDF;"' : ''}>
                            
                            	<c:choose>
                            		<c:when test = "${pageCount > 0}">
		                            	<c:forEach var = "order" items = "${orderList}">
		                            	
		                            		<c:choose>
		                            		
		                            			<c:when test = "${order.orderStatus eq 'PENDING'}">
		
					                                <span class="list-group-item flex-column align-items-start black-text" >
					
					                                    <div class = "row">
					
					                                        <div class = "col-9">
					                                            <div class = "row" style = "font-size: 13px;">
					                                                <div class = "col-1">
					                                                        <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
					                                                            data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
					                                                </div>
					                                                <div class = "col-sm-2">
					                                                    <strong> ORDER ID: </strong> <br />
					                                                    <span id = "orderId">${order.orderId}</span>
					                                                </div>
					                                                <div class = "col-sm-3">
					                                                    <strong> TOTAL PRICE: </strong> <br />
					                                                        <span class = "price">${order.totalPrice}</span> <span>PHP</span>
					                                                </div>
					                                                <div class = "col-sm-3">
					                                                    <strong> PAYMENT METHOD: </strong> <br />
					                                                        ${ (order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
					                                                        												 "Paypal"}
					                             
					                                                </div>
					                                                <div class = "col-sm-3">
					                                                    <strong> DATE ORDERED: </strong> <br />
					                                                        <fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
					                                                </div>
					                                            </div>
					                                        </div>
					                                        <div class = "col-sm-3">
					                                            <h6 class = "mb-0">
					                                                <strong>
					                                                    Status:
					                                                    <span id = "orderStatus" class = "orange-text"> Pending </span> </strong>
					                                            </h6>
					
					                                            <div style = "font-size: 13px;">
					                                               	<a href = "javascript:void(0)" class = "btn-cancel-order" > Cancel Order
					                                               		<i class="fa fa-times-circle-o" aria-hidden="true"></i>
					                                               	</a>
																</div>					                                                
					
					                                        </div>
					                                    </div>
					
					                                </span>
					
					                                <div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
					
					                                    <div class = "ml-3 mr-3 mt-3 mb-2">
					
					                                        <div class = "row">
					                                            <div class = "col-sm-8">
					
					                                                <h6>
					                                                    <strong> ${order.totalItems} Items ordered </strong>
					                                                </h6>
					
					                                            </div>
					                                            <div class = "col-sm-4">
					                                                    <div style = "font-size: 14px;">
					                                                        <a class = "disabled grey-text"> Shipping information </a> |
					                                                        <a class = "disabled grey-text"> Shipping log </a>
					                                                    </div>
					                                            </div>
					                                        </div>
					
					                                            <hr class = "mt-0" />
					
					                                        <div class = "row">
					                                            <div class = "col-sm">
					
					                                                <div class = "row">
					                                                    <div class = "col-sm-7">
					
					                                                        <div>
					
					                                                            <table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
					                                                                <thead>
					                                                                    <tr>
					                                                                    <th>#</th>
					                                                                    <th>Item Name</th>
					                                                                    <th>Weight </th>
					                                                                    <th>Price</th>
					                                                                    </tr>
					                                                                </thead>
					                                                                <tbody>
					                                                                	
					                                                                	<c:forEach var = "cartItem" items = "${order.cart.items}">
					                                                                
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
		
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                       
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                                    </c:forEach>
					
					                                                                </tbody>
					                                                                <tfoot>
					                                                                    <tr>
					                                                                        <th></th>
					                                                                        <th></th>
					                                                                        <th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits = "1" /> KILO </th>
					                                                                        <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
					                                                                    </tr>
					
					                                                                </tfoot>
					                                                            </table>
					
					                                                        </div>
					                                                    </div>
					                                                    <div class = "col-sm-5" style = "font-size: 14px;">
					                                                            <p>
					                                                            <strong> Receiver's name:  </strong> 
					                                                            ${order.shippingAddress.receiverFullName} <br />
					                                                        </p>
					                                                        <p>
					                                                            <strong> Shipping Instructions:  </strong> <br />
					                                                            ${order.shippingAddress.shippingInstructions}
					                                                        </p>
					                                                        <p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
					                                                      
					                                                    </div>
					                                                </div>
					                                            </div>
					
					                                        </div>
					
					                                    </div>
					                                </div>
					
												</c:when>
												<c:when test = "${order.orderStatus eq 'APPROVED'}">
		
													<span class="list-group-item flex-column align-items-start black-text" >
														<div class = "row">
					
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																		<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																		<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span id = "orderStatus" class = "green-text"> Approved </span> </strong>
																</h6>
					
																<div style = "font-size: 13px;">
																	<a href = "javascript:void(0)" class = "btn-cancel-approved-order"> 
																		Cancel Order <i class="fa fa-times-circle-o" aria-hidden="true"></i>
																	</a>
																</div>
					
					
															</div>
														</div>
													</span>
				
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
														<div class = "ml-3 mr-3 mt-3 mb-2">
					
															<div class = "row">
																<div class = "col-sm-8">
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
					
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a class = "disabled grey-text"> Shipping information </a> |
																			<a class = "disabled grey-text"> Shipping log </a>
																		</div>
																</div>
															</div>
					
															<hr class = "mt-0" />
					
															<div class = "row">
																<div class = "col-sm">
					
																	<div class = "row">
																		<div class = "col-sm-7">
					
																			<div>
					
																				<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																					<thead>
																						<tr>
																						<th>#</th>
																						<th>Item Name</th>
																						<th>Weight </th>
																						<th>Price</th>
																						</tr>
																					</thead>
																					<tbody>
																					
																						<c:forEach var = "cartItem" items = "${order.cart.items}">
					                                                                
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
						                                                                       
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                                    </c:forEach>
					
																					</tbody>
																					<tfoot>
																						<tr>
																							<th></th>
																							<th></th>
																							<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits = "1" /> KILO </th>
					                                                                        <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																						</tr>
					
																					</tfoot>
																				</table>
					
																			</div>
																		</div>
																		<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name (${order.shippingAddress.addressType}'s Address):  </strong>  <br />
																				<span id = "receiverFullName">${order.shippingAddress.receiverFullName}</span> <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            <span id = "zipCode">${order.shippingAddress.address.zipCode}</span> <span id = "address">${order.shippingAddress.address.address}</span>
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            <span id = "country">${order.shippingAddress.address.country}</span> (<span id = "city">${order.shippingAddress.address.city}</span>)
					                                                        </p>
					                                                        
					                                                        <input type = "hidden" id = "phone-number" value = "${order.shippingAddress.contact.phoneNumber}" />
								
																		</div>
																	</div>
																</div>
					
															</div>
															
															<c:if test = "${order.paymentMethod eq 'PAYPAL'}">
					
																<hr class = "m-0"/>
						
																<div class = "row">
																	<div class = "col-sm-9">
																		<strong class = "ml-2 red-text" style = "font-size: 14px; position: relative; top: 15px;"> *reminder: ${order.message} </strong>
																	</div>
																	<div class = "col-sm-3 mt-2 paypal-button">
																	</div>
																</div>
															
															</c:if>
					
														</div>
													</div>  
													
													
												</c:when>
		                            
		                            			<c:when test = "${order.orderStatus eq 'REJECTED'}">
		
													<span class="list-group-item flex-column align-items-start black-text" >
					
														<div class = "row">
					
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																		<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span id = "orderStatus" class = "red-text"> Rejected </span> </strong>
																</h6>
					
																<div style = "font-size: 13px;">
																		<a class = "btn-reorder" href = "javascript:void(0)"> Reorder </a> <span>|</span>
																		<a class = "btn-cancel-rejected-order" href = "javascript:void(0)"> 
																			Cancel Order
																			<i class="fa fa-times-circle-o" aria-hidden="true"></i> 
																		</a>
																</div>
					
					
															</div>
														</div>
					
													</span>
				
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
					
														<div class = "ml-3 mr-3 mt-3 mb-2">
					
															<div class = "row">
																<div class = "col-sm-8">
					
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
					
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a class = "disabled grey-text"> Shipping information </a> |
																			<a class = "disabled grey-text"> Shipping log </a>
																		</div>
																</div>
															</div>
					
															<hr class = "mt-0" />
					
															<div class = "row">
																<div class = "col-sm-7">
					
																	<div>
					
																		<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																			<thead>
																				<tr>
																				<th>#</th>
																				<th>Item Name</th>
																				<th>Weight </th>
																				<th>Price</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																				<c:forEach var = "cartItem" items = "${order.cart.items}">
																				
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
		
						                                                                        <td>${cartItem.product.name}</td>
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits="1" /> KILO </th>
					                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																				</tr>
					
																			</tfoot>
																		</table>
					
																	</div>
																</div>
																<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
																</div>
															</div>
					
															<hr class = "m-0"/>
					
															<div class = "row">
																<div class = "col-sm-7">
																	<strong class = "ml-2 red-text" style = "font-size: 14px; position: relative; top: 15px;"> *reason: ${order.reason} </strong>
																</div>
																<div class = "col-sm-5">
																	<button type="button" class="btn btn-primary float-right btn-cancel-rejected-order">Cancel</button>
																	<button type="button" class="btn btn-primary float-right btn-reorder">Reorder</button>
																</div>
															</div>
					
														</div>
													</div> 
		                            			
		                            			</c:when>
		                            		
		                            			<c:when test = "${order.orderStatus eq 'RECEIVED'}">
		
													<span class="list-group-item flex-column align-items-start black-text">
					
														<div class = "row">
					
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																		<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span id = "orderStatus" class = "blue-text"> Received </span> </strong>
																</h6>
					
																<div class="blue-text" style = "font-size: 13px;">
																	
																	<div style = "font-size: 13px;">
						                                               	<a class="btn-review-order" href="javascript:void(0)">Review order</a> |
																		<a class="btn-return-order" href="javascript:void(0)">Return order</a>
																	</div>		
																	
																</div>
					
					
															</div>
														</div>
					
													</span>
				
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
					
														<div class = "ml-3 mr-3 mt-3 mb-2">
					
															<div class = "row">
																<div class = "col-sm-8">
					
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
					
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a href = "#"> Shipping information </a> |
																			<a href = "#"> Shipping log </a>
																		</div>
																</div>
															</div>
					
															<hr class = "mt-0" />
					
															<div class = "row">
																<div class = "col-sm-7">
					
																	<div>
					
																		<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																			<thead>
																				<tr>
																				<th>#</th>
																				<th>Item Name</th>
																				<th>Weight </th>
																				<th>Price</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																				<c:forEach var = "cartItem" items = "${order.cart.items}">
																				
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
						                                                                       
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits = "1" /> KILO </th>
					                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																				</tr>
					
																			</tfoot>
																		</table>
					
																	</div>
																</div>
																<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
					
																			<p>
																				<strong> Expected date: </strong> <br />
																				<fmt:formatDate value = "${order.shipping.expectedDate}" type = "date" dateStyle = "LONG" />
																			</p>
																</div>
															</div>
					
														</div>
													</div> 
		                            				
		                            			</c:when>
		                            			
		                            			<c:when test = "${order.orderStatus eq 'TO_SHIP'}">
		
													<span class="list-group-item flex-column align-items-start black-text">
					
														<div class = "row">
					
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																			<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span id = "orderStatus" class = "purple-text"> To Ship </span> </strong>
																</h6>
					
																<div style = "font-size: 13px;">
																	<a href = "<c:url value = '/shipping?orderId=${order.orderId}' />"> Details </a>
																</div>
					
					
															</div>
														</div>
					
													</span>
					
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
					
														<div class = "ml-3 mr-3 mt-3 mb-2">
					
															<div class = "row">
																<div class = "col-sm-8">
					
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
					
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a href = "<c:url value = '/shipping?orderId=${order.orderId}#shippingInformation'/>"> Shipping information </a> |
																			<a href = "<c:url value = '/shipping?orderId=${order.orderId}#shippingLog' />"> Shipping log </a>
																		</div>
																</div>
															</div>
					
															<hr class = "mt-0" />
					
															<div class = "row">
																<div class = "col-sm-7">
					
																	<div>
					
																		<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																			<thead>
																				<tr>
																				<th>#</th>
																				<th>Item Name</th>
																				<th>Weight </th>
																				<th>Price</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																				<c:forEach var = "cartItem" items = "${order.cart.items}">
																				
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
						                                                                       
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits = "1" /> KILO </th>
					                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																				</tr>
					
																			</tfoot>
																		</table>
					
																	</div>
																</div>
																<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
					
																			<p>
																				<strong> Expected date: </strong> <br />
																				<fmt:formatDate value = "${order.shipping.expectedDate}" dateStyle = "LONG" type = "date" />
																			</p>
																</div>
															</div>
					
															<hr class = "m-0"/>
					
															<div class = "row">
																<div class = "col-sm-9">
																	<strong class = "ml-2 blue-text" style = "font-size: 14px; position: relative; top: 15px;"> *reminder: click the received button if your order is receive. </strong>
																</div>
																<div class = "col-sm-3">
																	<button type="button" class="btn btn-primary float-right btn-received-order">Received</button>
																</div>
															</div>
															
														</div>
													</div> 
		                            				
		                            			</c:when>
		                            			
		                            			<c:when test = "${order.orderStatus eq 'PAID'}">
		
													<span class="list-group-item flex-column align-items-start black-text">
					
														<div class = "row">
					
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																		<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span id = "orderStatus" class = "light-green-text"> Paid </span> <a style = "font-size: 13px;" href = "<c:url value = '/payment-receipt?orderId=${order.orderId}' />">  (Receipt) </a> </strong>
																</h6>
					
																<div style = "font-size: 13px;">
																	<a href = "javascript:void(0)" class = "btn-refund-order"> Refund </a>
																</div>
					
					
															</div>
														</div>
					
													</span>
					
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
					
														<div class = "ml-3 mr-3 mt-3 mb-2">
					
															<div class = "row">
																<div class = "col-sm-8">
					
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
					
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a class = "disabled grey-text"> Shipping information </a> |
																			<a class = "disabled grey-text"> Shipping log </a>
																		</div>
																</div>
															</div>
					
															<hr class = "mt-0" />
					
															<div class = "row">
																<div class = "col-sm-7">
					
																	<div>
					
																		<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																			<thead>
																				<tr>
																				<th>#</th>
																				<th>Item Name</th>
																				<th>Weight </th>
																				<th>Price</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																				<c:forEach var = "cartItem" items = "${order.cart.items}">
																				
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
						                                                                       
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits = "1" /> KILO </th>
					                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																				</tr>
					
																			</tfoot>
																		</table>
					
																	</div>
																</div>
																<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
																</div>
															</div>
					
														</div>
													</div>  
		                            			
												</c:when>
												
												<c:when test = "${order.orderStatus eq 'RETURNED'}">
													<span class="list-group-item flex-column align-items-start black-text">
														<div class = "row">
		
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																			${order.orderId}
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span  class = "brown-text"> Returned </span> </strong>
																</h6>
		
																<div class="blue-text" style = "font-size: 13px;">
																	<a href = "javascript:void(0)" 
																		   data-toggle="popover" 
																		   data-trigger="focus"
																		   title="Reason" 
																		   data-content="${order.reason}"> Reason </a>
																</div>
		
		
															</div>
														</div>
													</span>
				
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
														<div class = "ml-3 mr-3 mt-3 mb-2">
		
															<div class = "row">
																<div class = "col-sm-8">
		
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
		
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a href = "<c:url value = "/shipping?orderId=${order.orderId}#shippingInformation" />"> Shipping information </a> |
																			<a href = "<c:url value = "/shipping?orderId=${order.orderId}#shippingLog" />"> Shipping log </a>
																		</div>
																</div>
															</div>
		
															<hr class = "mt-0" />
		
															<div class = "row">
																<div class = "col-sm-7">
		
																	<div>
		
																		<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																			<thead>
																				<tr>
																				<th>#</th>
																				<th>Item Name</th>
																				<th>Weight </th>
																				<th>Price</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																				<c:forEach var = "cartItem" items = "${order.cart.items}">
																				
						                                                                    <tr>
						                                                                        <th scope="row">
						                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
						                                                                        </th>
						
						                                                                        <td>
						                                                                        	${cartItem.product.name} 
						                                                                        </td>
						                                                                       
						                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
						                                                                        
						                                                                        <td>
						                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits="1" /> KILO </th>
					                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																				</tr>
					
																			</tfoot>
																		</table>
		
																	</div>
																</div>
																<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
		
																			<p>
																				<strong> Expected date: </strong> <br />
																				<fmt:formatDate value ="${order.shipping.expectedDate}" type = "date" dateStyle = "LONG" />
																			</p>
																</div>
															</div>
		
														</div>
													</div> 
												</c:when>
		
												<c:when test = "${order.orderStatus eq 'CANCELLED'}">
		
													<span class="list-group-item flex-column align-items-start black-text" >
														<div class = "row">
		
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																		<span id = "orderId">${order.orderId}</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span class = "red-text"> Cancelled </span> </strong>
																</h6>
		
																<div style = "font-size: 13px;">
		
																	<a href = "javascript:void(0)" 
																	   data-toggle="popover" 
																	   data-trigger="focus"
																	   title="Reason" 
																	   data-content="${order.reason}"> Reason </a>
																			   
																</div>
																
															</div>
														</div>
													</span>
					
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
														<div class = "ml-3 mr-3 mt-3 mb-2">
		
															<div class = "row">
																<div class = "col-sm-8">
		
																	<h6>
																		<strong> ${order.totalItems} Items ordered </strong>
																	</h6>
		
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a class = "disabled grey-text"> Shipping information </a> |
																			<a class = "disabled grey-text"> Shipping log </a>
																		</div>
																</div>
															</div>
		
																<hr class = "mt-0" />
		
															<div class = "row">
																<div class = "col-sm">
		
																	<div class = "row">
																		<div class = "col-sm-7">
		
																			<div>
		
																				<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																					<thead>
																						<tr>
																						<th>#</th>
																						<th>Item Name</th>
																						<th>Weight </th>
																						<th>Price</th>
																						</tr>
																					</thead>
																					<tbody>
																					
																						<c:forEach var = "cartItem" items = "${order.cart.items}">
																						
								                                                                    <tr>
								                                                                        <th scope="row">
								                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
								                                                                        </th>
								
								                                                                        <td>
								                                                                        	${cartItem.product.name} 
								                                                                        </td>
								                                                                       
								                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
								                                                                        
								                                                                        <td>
								                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
								                                                                        </td>
								                                                                    </tr>
							                                                                    
							                                                            </c:forEach>
																						
							
																					</tbody>
																					<tfoot>
																						<tr>
																							<th></th>
																							<th></th>
																							<th>Total: <fmt:formatNumber value="${order.totalWeight}" maxFractionDigits="1" /> KILO </th>
							                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																						</tr>
							
																					</tfoot>
																				</table>
		
																			</div>
																		</div>
																		<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
		
																		</div>
																	</div>
																</div>
		
															</div>
		
														</div>
													</div>
											
												</c:when>
		
												<c:when test = "${order.orderStatus eq 'REFUND'}">
		
													<span class="list-group-item flex-column align-items-start black-text" >
														<div class = "row">
		
															<div class = "col-9">
																<div class = "row" style = "font-size: 13px;">
																	<div class = "col-1">
																			<i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
																				data-toggle="collapse" href="#orderCollapseItem-id-${order.orderId}" role="button" aria-expanded="false" aria-controls="orderCollapseItem-id-${order.orderId}" style = "cursor: pointer;"></i>
																	</div>
																	<div class = "col-sm-2">
					
																		<strong> ORDER ID: </strong> <br />
																			${order.orderId}
																	</div>
																	<div class = "col-sm-3">
																		<strong> TOTAL PRICE: </strong> <br />
																			<span class = "price">${order.totalPrice}</span> <span>PHP</span>
																	</div>
																	<div class = "col-sm-3">
																		<strong> PAYMENT METHOD: </strong> <br />
																			${(order.paymentMethod eq 'CASH_ON_DELIVERY') ? "Cash on delivery" :
																															"Paypal"}
																	</div>
																	<div class = "col-sm-3">
																		<strong> DATE ORDERED: </strong> <br />
																			<fmt:formatDate value="${order.dateOrdered}" type = "date" dateStyle="LONG" />
																	</div>
																</div>
															</div>
															<div class = "col-sm-3">
																<h6 class = "mb-0">
																	<strong>
																		Status:
																		<span class = "pink-text"> Refund </span> <a style = "font-size: 13px;" href = "<c:url value = '/payment-receipt?orderId=${order.orderId}' />"> (Receipt)</a></strong>
																</h6>
		
																<div style = "font-size: 13px;">
																		
																		<a href = "javascript:void(0)" 
																		   data-toggle="popover" 
																		   data-trigger="focus"
																		   title="Reason" 
																		   data-content="${order.reason}"> Reason </a>
		
																</div>
		
															</div>
														</div>
													</span>
					
													<div class="collapse multi-collapse" id="orderCollapseItem-id-${order.orderId}" style = "border-left: 1px solid #DFDFDF; border-right: 1px solid #DFDFDF;">
														<div class = "ml-3 mr-3 mt-3 mb-2">
		
															<div class = "row">
																<div class = "col-sm-8">
		
																	<h6>
																		<strong> 3 Items ordered </strong>
																	</h6>
		
																</div>
																<div class = "col-sm-4">
																		<div style = "font-size: 14px;">
																			<a class = "disabled grey-text"> Shipping information </a> |
																			<a class = "disabled grey-text"> Shipping log </a>
																		</div>
																</div>
															</div>
		
																<hr class = "mt-0" />
		
															<div class = "row">
																<div class = "col-sm">
		
																	<div class = "row">
																		<div class = "col-sm-7">
		
																			<div>
		
																				<table class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
																					<thead>
																						<tr>
																						<th>#</th>
																						<th>Item Name</th>
																						<th>Weight </th>
																						<th>Price</th>
																						</tr>
																					</thead>
																					<tbody>
																					
																						<c:forEach var = "cartItem" items = "${order.cart.items}">
																						
								                                                                    <tr>
								                                                                        <th scope="row">
								                                                                            <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
								                                                                        </th>
								
								                                                                        <td>
								                                                                        	${cartItem.product.name} 
								                                                                        </td>
								                                                                       
								                                                                        <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
								                                                                        
								                                                                        <td>
								                                                                            <span class = "price">${cartItem.price}</span> <span>PHP</span>
								                                                                        </td>
								                                                                    </tr>
							                                                                    
							                                                            </c:forEach>
																						
							
																					</tbody>
																					<tfoot>
																						<tr>
																							<th></th>
																							<th></th>
																							<th>Total: <fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits="1"/> KILO </th>
							                                                                <th>Total: <span class = "price">${order.totalPrice}</span> <span>PHP</span> </th>
																						</tr>
							
																					</tfoot>
																				</table>
		
																			</div>
																		</div>
																		<div class = "col-sm-5" style = "font-size: 14px;">
																			<p>
																				<strong> Receiver's name:  </strong> 
																				${order.shippingAddress.receiverFullName} <br />
																			</p>
																			<p>
																				<strong> Shipping Instructions:  </strong> <br />
																				${order.shippingAddress.shippingInstructions}
																			</p>
																			<p>
					                                                            <strong> Shipping Address: </strong> <br />
					                                                            ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
					                                                        </p>
					
					                                                        <p>
					                                                            <strong> Country(city): </strong> <br />
					                                                            ${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
					                                                        </p>
		
																		</div>
																	</div>
																</div>
		
															</div>
		
														</div>
													</div>
		
												</c:when>
		                            			
		                            		</c:choose>
			                            
		                            	</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="row">
											<div class="col-12 pt-3 pl-5 pr-5">
											    <h5 class="text-center mt-5"> No orders Found. </h5>
										    </div>
						                </div>
									</c:otherwise>
								</c:choose>
							</div>
							
								<c:if test = "${pageCount > orderItemsCount}">

	                                <div class="d-flex justify-content-center">
	
	                                    <nav class="my-4">
	                                        <ul class="pagination pagination-circle pg-blue mb-0">
	
			                                        	<c:choose>
			                                        
				                                        	<c:when test = "${(param.filterBy == null) || (empty param.filterBy)}">
				
				
					                                            <li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list" var = "firstOrderPageLink" >
						                                            	<c:param name="pageNumber" value="0" />
						                                            </c:url>
					                                            	<a class="page-link" href = "${firstOrderPageLink}">First</a>
					                                            </li>
					
					
					                                            <li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list" var = "prevOrderPageLink" >
						                                            	<c:param name="pageNumber" value="${currentPageCount - 1}" />
						                                            </c:url>
					                                                <a class="page-link" aria-label="Previous" href = "${prevOrderPageLink}">
					                                                    <span aria-hidden="true">&laquo;</span>
					                                                    <span class="sr-only">Previous</span>
					                                                </a>
					                                            </li>
					
																<c:forEach var = "pageCount" begin = "0" end = "${pageNumber}">
						                                            <li class="page-item ${pageCount eq currentPageCount ? 'active' : ''}">
						                                            	<c:url value = "/order-list" var = "orderListPageLink" >
						                                            		<c:param name="pageNumber" value="${pageCount}" />
						                                            	</c:url>
						                                            	<a class="page-link" href = "${orderListPageLink}">${pageCount + 1}</a>
						                                            </li>
					                                            </c:forEach>
					
					
					                                            <li class="page-item ${currentPageCount eq pageNumber ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list" var = "nextOrderPageLink" >
						                                            	<c:param name="pageNumber" value="${currentPageCount + 1}" />
						                                            </c:url>
					                                                <a class="page-link" aria-label="Next" href = "${nextOrderPageLink}">
					                                                    <span aria-hidden="true">&raquo;</span>
					                                                    <span class="sr-only">Next</span>
					                                                </a>
					                                            </li>
					
					                                            <li class="page-item">
					                                            	<c:url value = "/order-list" var = "lastOrderPageLink" >
						                                            	<c:param name="pageNumber" value="${pageNumber}" />
						                                            </c:url>
					                                            	<a class="page-link" href = "${lastOrderPageLink}">Last</a>
					                                            </li>
				                                            
				                                            </c:when>
			                                            
				                                            <c:otherwise>
				                                            
				                                            	<li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list/filter" var = "firstOrderPageLinkFilter" >
						                                            	<c:param name="pageNumber" value="0" />
						                                            	<c:param name="filterBy"   value="${param.filterBy}" />
						                                            	<c:param name="sortBy" value="${param.sortBy}" /> 
						                                            </c:url>
					                                            	<a class="page-link" href = "${firstOrderPageLinkFilter}">First</a>
					                                            </li>
					
					
					                                            <li class="page-item ${currentPageCount eq 0 ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list/filter" var = "prevOrderPageLinkFilter" >
						                                            	<c:param name="pageNumber" value="${currentPageCount - 1}" />
						                                            	<c:param name="filterBy"   value="${param.filterBy}" />
						                                            	<c:param name="sortBy" value="${param.sortBy}" /> 
						                                            </c:url>
					                                                <a class="page-link" aria-label="Previous" href = "${prevOrderPageLinkFilter}">
					                                                    <span aria-hidden="true">&laquo;</span>
					                                                    <span class="sr-only">Previous</span>
					                                                </a>
					                                            </li>
					
																<c:forEach var = "pageCount" begin = "0" end = "${pageNumber}">
						                                            <li class="page-item ${pageCount eq currentPageCount ? 'active' : ''}">
						                                            	<c:url value = "/order-list/filter" var = "orderListPageLinkFilter" >
						                                            		<c:param name="pageNumber" value="${pageCount}" />
						                                            		<c:param name="filterBy"   value="${param.filterBy}" />
						                                            		<c:param name="sortBy" value="${param.sortBy}" /> 
						                                            	</c:url>
						                                            	<a class="page-link" href = "${orderListPageLinkFilter}">${pageCount + 1}</a>
						                                            </li>
					                                            </c:forEach>
					
					
					                                            <li class="page-item ${currentPageCount eq pageNumber ? 'disabled' : ''}">
					                                            	<c:url value = "/order-list/filter" var = "nextOrderPageLinkFilter" >
						                                            	<c:param name="pageNumber" value="${currentPageCount + 1}" />
						                                            	<c:param name="filterBy"   value="${param.filterBy}" />
						                                            	<c:param name="sortBy" value="${param.sortBy}" /> 
						                                            </c:url>
					                                                <a class="page-link" aria-label="Next" href = "${nextOrderPageLinkFilter}">
					                                                    <span aria-hidden="true">&raquo;</span>
					                                                    <span class="sr-only">Next</span>
					                                                </a>
					                                            </li>
					
					                                            <li class="page-item">
					                                            	<c:url value = "/order-list/filter" var = "lastOrderPageLinkFilter" >
						                                            	<c:param name="pageNumber" value="${pageNumber}" />
						                                            	<c:param name="filterBy"   value="${param.filterBy}" />
						                                            	<c:param name="sortBy" value="${param.sortBy}" /> 
						                                            </c:url>
					                                            	<a class="page-link" href = "${lastOrderPageLinkFilter}">Last</a>
					                                            </li>
				                                            
				                                            </c:otherwise>
			                                            
			                                            </c:choose>
		
	                                        </ul>
	                                    </nav>
	
	                                </div>
	                                
                                </c:if>

                            </div>

                        </div>


                </div>


            </div>

        </div>

        <hr />
    </div> 

</main>  

