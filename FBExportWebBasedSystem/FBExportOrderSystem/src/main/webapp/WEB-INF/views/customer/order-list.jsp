 <%@ include file = "../../lib/tags/tag-libraries.jsp" %>
 
 <main>

    <div class = "container mt-4">

        <div class = "row">
            <div class = "col-sm-2">
                <h4 class = "pt-3">
                    Order Lists
                    <i class="fa fa-reorder ml-2" aria-hidden="true"></i>
                </h4>
            </div>
            <div class = "col-sm-10">
                
                <form class = "form-inline float-right small">

                    
                    <label class="mr-sm-2" for="inlineFormCustomSelect">Filter by</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect">
                        <option selected>All</option>
                        <option value="1">Pending</option>
                        <option value="2">Approved</option>
                        <option value="3">Rejected</option>
                        <option value="3">Received</option>
                        <option value="3">Paid</option>
                        <option value="3">To Ship</option>
                        <option value="1">Cash on delivery</option>
                        <option> Paypal </option>
                    </select>

                
                    <label class="mr-sm-2" for="inlineFormCustomSelect">Sort by</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect">
                        <option selected>Unsorted</option>
                        <option value="1">Date ordered (latest)</option>
                        <option value="1">Date ordered (oldest)</option>
                        <option> Order id (latest)</option>
                        <option> Order id (oldest)</option>
                    </select>
                    

                    <button type="button" class="btn btn-primary pt-2 pb-2 pl-4 pr-4 mr-4">Filter</button>

                    <input type="text" id="form1" class="form-control m-0 p-0" placeholder = "Order id">
                    <button type="button" class="btn btn-primary pt-2 pb-2 pl-4 pr-4">Search</button>
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
                        <a href="#" class="list-group-item">
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
                            <li class="nav-item">
                                <a class="nav-link" href="#">Returned orders</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Cancelled orders</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class = "btn btn-primary waves-effect waves-light p-2 m-0" href = "<c:url value = '/order-list' />"> Refresh  <i class="fa fa-refresh ml-2" aria-hidden="true"></i> </a>
                            </li>
                        </ul>
                        

                        <div>

                            <div class="list-group" style = "border-bottom: 1px solid #DFDFDF;">
                            
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
			                                                        ${order.orderId}
			                                                </div>
			                                                <div class = "col-sm-3">
			                                                    <strong> TOTAL PRICE: </strong> <br />
			                                                        <span>${order.totalPrice}</span> <span>php</span>
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
			                                                    <span class = "orange-text"> Pending </span> </strong>
			                                            </h6>
			
			                                            <div class="dropdown blue-text" style = "font-size: 13px;">
			                                                    <i class="fa fa-print" aria-hidden="true"></i>
			                                                    <a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                                        Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
			                                                    </a>
			
			                                                    <a href = "#"> Cancel </a>
			                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			                                                    <a class="dropdown-item" href="#">Print order</a>
			                                                    <a class="dropdown-item disabled" href="#">Print receipt</a>
			                                                    <a class="dropdown-item disabled" href="#">Print shipping information</a>
			                                                    <a class="dropdown-item disabled" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                                    </c:forEach>
			
			                                                                </tbody>
			                                                                <tfoot>
			                                                                    <tr>
			                                                                        <th></th>
			                                                                        <th></th>
			                                                                        <th>Total: ${order.totalWeight} KILO </th>
			                                                                        <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "green-text"> Approved </span> </strong>
														</h6>
			
														<div class="dropdown blue-text" style = "font-size: 13px;">
																<i class="fa fa-print" aria-hidden="true"></i>
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
																</a>
																<a href = "#"> Cancel </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item disabled" href="#">Print receipt</a>
																<a class="dropdown-item disabled" href="#">Print shipping information</a>
																<a class="dropdown-item disabled" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                                    </c:forEach>
			
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: ${order.totalWeight} KILO </th>
			                                                                        <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
																	</p> 
																</div>
															</div>
														</div>
			
													</div>
			
													<hr class = "m-0"/>
			
													<div class = "row">
														<div class = "col-sm-9">
															<strong class = "ml-2 red-text" style = "font-size: 14px; position: relative; top: 15px;"> *reminder: ${order.message} </strong>
														</div>
														<div class = "col-sm-3">
															<button type="button" class="btn btn-primary float-right">Pay order</button>
														</div>
													</div>
			
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "red-text"> Rejected </span> </strong>
														</h6>
			
														<div class="dropdown blue-text" style = "font-size: 13px;">
																<i class="fa fa-print" aria-hidden="true"></i>
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
																</a>
																<a href = "#"> Reorder </a> |
																<a href = "#"> Delete </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item disabled" href="#">Print receipt</a>
																<a class="dropdown-item disabled" href="#">Print shipping information</a>
																<a class="dropdown-item disabled" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                            </c:forEach>
																		
			
																	</tbody>
																	<tfoot>
																		<tr>
																			<th></th>
																			<th></th>
																			<th>Total: ${order.totalWeight} KILO </th>
			                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
															<strong class = "ml-2 red-text" style = "font-size: 14px; position: relative; top: 15px;"> *reason: bad weather. </strong>
														</div>
														<div class = "col-sm-5">
															<button type="button" class="btn btn-primary float-right">Delete</button>
															<button type="button" class="btn btn-primary float-right">Reorder</button>
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "blue-text"> Received </strong>
														</h6>
			
															<div class="blue-text" style = "font-size: 13px;">
															<span class="dropdown">
																<i class="fa fa-print" aria-hidden="true"></i>
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
																</a>
			
																<a href="#">Rate</a> |
			
																	<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																	<a class="dropdown-item" href="#">Print order</a>
																	<a class="dropdown-item" href="#">Print receipt</a>
																	<a class="dropdown-item" href="#">Print shipping information</a>
																	<a class="dropdown-item" href="#">Print shipping log</a>
																</div>
			
															</span>
			
															<span class="dropdown">
			
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Options <i class="fa fa-caret-down" aria-hidden="true"></i>
																</a>
			
																<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																	<a class="dropdown-item" href="#">Return/Refund order</a>
																	<a class="dropdown-item" href="#">Delete order</a>
																</div>
			
															</span>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                            </c:forEach>
																		
			
																	</tbody>
																	<tfoot>
																		<tr>
																			<th></th>
																			<th></th>
																			<th>Total: ${order.totalWeight} KILO </th>
			                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "purple-text"> To Ship </span> </strong>
														</h6>
			
														<div class="dropdown blue-text" style = "font-size: 13px;">
															<i class="fa fa-print" aria-hidden="true"></i>
															<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
															</a>
															<a href = "#"> Details </a> |
															<a class = "disabled grey-text"> Cancel </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item" href="#">Print receipt</a>
																<a class="dropdown-item" href="#">Print shipping information</a>
																<a class="dropdown-item" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                            </c:forEach>
																		
			
																	</tbody>
																	<tfoot>
																		<tr>
																			<th></th>
																			<th></th>
																			<th>Total: ${order.totalWeight} KILO </th>
			                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
																	</p>
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "light-green-text"> Paid </strong>
														</h6>
			
														<div class="dropdown blue-text" style = "font-size: 13px;">
															<i class="fa fa-print" aria-hidden="true"></i>
															<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
															</a>
															<a href = "#"> Refund </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item" href="#">Print receipt</a>
																<a class="dropdown-item disabled" href="#">Print shipping information</a>
																<a class="dropdown-item disabled" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                            </c:forEach>
																		
			
																	</tbody>
																	<tfoot>
																		<tr>
																			<th></th>
																			<th></th>
																			<th>Total: ${order.totalWeight} KILO </th>
			                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
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
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "brown-text"> Returned </span> </strong>
														</h6>

														<div class="dropdown blue-text" style = "font-size: 13px;">
															<i class="fa fa-print" aria-hidden="true"></i>
															<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
															</a>
															<a href = "#"> Reason </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item" href="#">Print receipt</a>
																<a class="dropdown-item" href="#">Print shipping information</a>
																<a class="dropdown-item" href="#">Print shipping log</a>
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
				                                                                            <span>${cartItem.price}</span> <span>PHP</span>
				                                                                        </td>
				                                                                    </tr>
			                                                                    
			                                                            </c:forEach>
																		
			
																	</tbody>
																	<tfoot>
																		<tr>
																			<th></th>
																			<th></th>
																			<th>Total: ${order.totalWeight} KILO </th>
			                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
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
																	${order.orderId}
															</div>
															<div class = "col-sm-3">
																<strong> TOTAL PRICE: </strong> <br />
																	<span>${order.totalPrice}</span> <span>php</span>
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

														<div class="dropdown blue-text" style = "font-size: 13px;">
																<i class="fa fa-print" aria-hidden="true"></i>
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
																</a>

																<a href = "#"> Reason </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item disabled" href="#">Print receipt</a>
																<a class="dropdown-item disabled" href="#">Print shipping information</a>
																<a class="dropdown-item disabled" href="#">Print shipping log</a>
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
						                                                                            <span>${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: ${order.totalWeight} KILO </th>
					                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																	<span>${order.totalPrice}</span> <span>php</span>
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
																<span class = "pink-text"> Refund </strong>
														</h6>

														<div class="dropdown blue-text" style = "font-size: 13px;">
																<i class="fa fa-print" aria-hidden="true"></i>
																<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Print <i class="fa fa-caret-down" aria-hidden="true"></i> |
																</a>

																<a href = "#"> Reason </a>
															<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item" href="#">Print order</a>
																<a class="dropdown-item" href="#">Print receipt</a>
																<a class="dropdown-item disabled" href="#">Print shipping information</a>
																<a class="dropdown-item disabled" href="#">Print shipping log</a>
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
						                                                                            <span>${cartItem.price}</span> <span>PHP</span>
						                                                                        </td>
						                                                                    </tr>
					                                                                    
					                                                            </c:forEach>
																				
					
																			</tbody>
																			<tfoot>
																				<tr>
																					<th></th>
																					<th></th>
																					<th>Total: ${order.totalWeight} KILO </th>
					                                                                <th>Total: <span>${order.totalPrice}</span> <span>PHP</span> </th>
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
																		NOVEMBER 29 1998
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
							</div>
							
		 

                                <div class="d-flex justify-content-center">

                                    <nav class="my-4">
                                        <ul class="pagination pagination-circle pg-blue mb-0">


                                            <li class="page-item disabled"><a class="page-link">First</a></li>


                                            <li class="page-item disabled">
                                                <a class="page-link" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>

                                            <li class="page-item active"><a class="page-link">1</a></li>
                                            <li class="page-item"><a class="page-link">2</a></li>
                                            <li class="page-item"><a class="page-link">3</a></li>
                                            <li class="page-item"><a class="page-link">4</a></li>
                                            <li class="page-item"><a class="page-link">5</a></li>


                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>

                                            <li class="page-item"><a class="page-link">Last</a></li>

                                        </ul>
                                    </nav>

                                </div>

                            </div>

                        </div>


                </div>


            </div>

        </div>

        <hr />
    </div> 

</main>  