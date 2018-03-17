<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container mt-4">
    <div class = "row">
        <div class = "col">
            <h2 id = "place-order-header">
                Place Order
                <i class="fa fa-shopping-cart ml-2" aria-hidden="true"></i>
            </h2>
            <hr />
        </div>
    </div>

    <div class = "row">

        <div class = "col-md-4">

            <div class = "row" style = "border: 1px solid #E5E5E5;">

                <h6 class = "pt-3 pl-3 pb-2 font-weight-bold">
                    Order Summary <i class="fa fa-shopping-cart mr-2" aria-hidden="true"></i> (${fn:length(cartItemList)} items)
                </h6>

            </div>

            <div class = "row">

                <table id = "cartItemTable" class="table table-sm tableBodyScroll mb-0"  style = "border: 1px solid #DFDFDF;">
                        <thead>
                            <tr>
                            <th>#</th>
                            <th>Item Name</th>
                            <th>Price</th>
                            <th>Weight</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        	<c:forEach var = "cartItem" items = "${cartItemList}">
	                            <tr>
	                                <th scope="row">
	                                    <img src = "<c:url value = '${cartItem.product.productImageLink}' />" width = "40" height = "40" />
	                                </th>
	                                <td><a href = "<c:url value = '/view-product/${cartItem.product.productId}' />" >${cartItem.product.name} </a></td>
	                                <td>${cartItem.price}</td>
	                                <td>${cartItem.weight.weight} ${cartItem.weight.weightType}</td>
	                            </tr>
                            </c:forEach>

                        </tbody>

                </table>

            </div>

            <div class = "row mb-4" style = "border: 1px solid #E5E5E5;">
            
            	<div class="col">

	                <div class="pt-2 pb-2 float-left font-weight-bold" style="font-size: 12px;">
	                	<div class = "row">
		                	<div class = "col-md-6 pr-0">
			                    <span class="mr-4">  Total Weight: <fmt:formatNumber value = "${totalWeight}" maxFractionDigits = "2" /> IN KILOGRAMS </span>
								<br>
								<span> Sub total: <span id="placeOrderSubTotal">${totalPrice}</span> <span id="placeOrderSubtotalCurrency">PHP</span> </span> <br />
								<span> Taxable: 0 </span> <br />
							</div>
							<div class = "col-md-6">
								<span> Tax Rate: 0% </span> <br />
								<span> Shipping fee: 1000 <span id="placeOrderShippingFeeCurrency">PHP</span> </span> <br />
			                    <span> Total Due: <span id="placeOrdertotalPrice">${totalPrice}</span> <span id="placeOrderCurrency">PHP</span> </span>
		                    </div>
	                    </div>
	                </div>

                </div>

            </div>

        </div>
        <div class = "col-md-8 order-md-first">
        	
        	<form action = "<c:url value = '/place-order/order' />" method = "POST">
	            <h6>
	                <strong> 1. Select your shipping address </strong>
	                <i class="fa fa-truck ml-2" aria-hidden="true"></i>
	            </h6>

            	<hr />

	            <div class = "row">
	
	                <div class = "col-md" style="max-height: 500px; overflow-y: auto;">
	
	                    <div id = "shippingAddressList" class="list-group">
	                    
	                    	<c:forEach var = "shippingAddress" items = "${shippingAddressList}">
		                        <span class="flex-column align-items-start">
		                            <div class="z-depth-1 border-light mb-2 waves-effect shipping-address-radio-button" style=" height: 10rem;">
		                                    <div class="card-header pt-2 pb-2" style = "font-size: 14px;">
		                                        <strong> ${shippingAddress.addressType}'s Address </strong>
		                                        <input class="float-right mt-1" type="radio" name = "shipping-address" value="${shippingAddress.shippingAddressId}" required>
		                                    </div>
		
		                                    <div class="card-body pt-3">
		
		                                        <div class = "card-text">
		                                            <ul class="list-unstyled" style = "font-size: 14px;">
		                                                <li> <strong> ${shippingAddress.receiverFullName} </strong> </li>
		                                                <li> ${shippingAddress.address.zipCode} ${shippingAddress.address.address} ${shippingAddress.address.city} </li>
		                                                <li> ${shippingAddress.address.country} </li>
		                                                <li> Phone number: (+${shippingAddress.contact.countryCode}) ${shippingAddress.contact.phoneNumber} </li>
		                                            </ul>
		
		                                        </div>
		
		                                    </div>
		                                </div>
		                        </span>
	                        </c:forEach>
	
	                    </div>
	
	                </div>
	
	            </div>

	            <div class = "row mt-2">
	
	                <div class = "col-12">
	
	                    <div id = "addShippingAddress" style="width: 18rem; border: 1px solid #E5E5E5; cursor: pointer;"
	                            data-toggle="collapse" href="#addShippingAddressForm" role="button" aria-expanded="false" aria-controls="addShippingAddressForm">
	                        <div class="card-body p-2">
	                            <a class="card-title" style = "font-size: 14px;">
	                                <i class="fa fa-plus-square mr-2" aria-hidden="true"></i>
	                                <strong> Add Shipping address </strong>
	                            </a>
	                        </div>
	                    </div>
	
	                    <div class="collapse" id="addShippingAddressForm">
	
	                        <br />
	                        
	                        <div class = "row">
	
	                            <div class = "col-12">
	
	                                <h6 class = "mb-0"> <strong> Address To </strong> </h6>
	
	                                <hr class = "mb-0"/>
	
	                                <div class="form-inline mt-1">
		
	                                    <input type="text" class="form-control mr-2 p-0" id="address-to" placeholder="Your friend, coworker?">
	
	                                </div>
	
	                            </div>
	
	
	                        </div>
	
	                        <div class = "row">
	
	                            <div class = "col-12">
	
	                                <h6 class = "mb-0"> <strong> Receiver's name </strong> </h6>
	
	                                <hr class = "mb-0"/>
	
	                                <div class="form-inline mt-1">
	
	                                    <input type="text" class="form-control mr-2 p-0" id="full-name" placeholder="full-name">
	
	                                </div>
	
	                            </div>
	
	                        </div>
	                        
	                         <div class = "row">
	
	                            <div class = "col">
	
	                                <h6>
	                                    <strong> Your contact information </strong>
	                                </h6>
	
	                                <hr class = "mt-1 mb-1" />
	
	                                <div class="form-inline">
	
	                                    <select class = "countryCode mr-2" id = "country-code">
	                                    </select>
	
	                                    <input type="text" class="form-control p-0" id = "phone-number" placeholder="Phone number">
	
	                                </div>
	                               
	                            </div>
	
	                        </div>
	
	                        <div class = "row mt-2">
	
	                            <div class = "col">
	
	                                <h6> <strong> Your address </strong> </h6>
	
	                                <hr class = "mt-1" />
	
	                                <div class = "row mb-0">
	
	                                    <div class = "col">
	                                        <label for = "country">Country: <label>
	                                        <select class = "country browser-default mt-2 mb-0" id = "country">
	                                        </select>
	                                    </div>
	
	                                </div>
	
	                                <div class = "row mt-0">
	                                        <div class = "col-md-4 col-sm-6">
	                                        <input class = "mt-3 p-0" type = "text" id = "city" placeholder = "City" />
	                                    </div>
	                                    <div class = "col-md-4 col-sm-6">
	                                        <input class = "mt-3 p-0" type = "text" id = "zip-code" placeholder = "Zipcode" />
	                                    </div>
	                                </div>
	
	                                <br />
	
	                                <div class = "row">
	                                        <div class = "col-md-6">
	                                            <textarea placeholder = "Address" id = "address" style = "height: 5rem;"></textarea>
	                                      	</div>
		                                    <div class = "col-md-6">
		                                            <textarea placeholder = "Shipping instructions" id = "shipping-instructions" style = "height: 5rem;"></textarea>
		                                    </div>
	                                </div>
	                                
	                                <button type="button" class="btn btn-primary pt-2 pb-2" id = "btn-add-shipping-address">Add</button>
	                                <button type="button" class="btn btn-primary pt-2 pb-2"
	                                        data-toggle="collapse" href="#addShippingAddressForm" role="button" aria-expanded="false" aria-controls="addShippingAddressForm">Cancel</button>
	
									<span class = "ml-3 red-text font-weight-bold" id = "errorMessage" style = "display: none;"></span>
	                                <hr />
	                                
	
	                            </div>
	
	
	                        </div>
	
	                       
	
	
	                    </div>
	
	                </div>
	
	            </div>

	            <div class = "row mt-3">
	                <div class = "col">
	                    <h6>
	                        <strong> 2. Choose payment method </strong>
	                        <i class="fa fa-money ml-2" aria-hidden="true"></i>
	                    </h6>
	                    <hr />
	
	
	                    <div class = "row">
	                        <div class = "col">
	                            <div class="form-inline pt-4 pb-4 pl-4">
	
	                                <div class="form-group">
	                                    <input class = "mr-2" name="payment-method" id = "cash-on-delivery" type="radio" value = "CASH_ON_DELIVERY" required>
	                                    <label for="cash-on-delivery">
	                                        <span class = "mr-2"> CASH ON DELIVERY </span>
	                                        <i class="fa fa-truck" aria-hidden="true"></i>
	                                    </label>
	                                </div>
	
	                                <div class="form-group">
	                                    <input class = "mr-2" name="payment-method" id = "pay-on-paypal" type="radio" value = "PAYPAL" required>
	                                    <label for="pay-on-paypal">
	                                        <span class = "mr-2"> PAY ON PAYPAL </span>
	                                        <i class="fa fa-paypal" aria-hidden="true"></i>
	                                    </label>
	                                </div>
	
	                            </div>
	
	                        </div>
	                    </div>
	
	                    <br />
	
	                    <a href = "<c:url value = '/' />" class="btn btn-primary pt-3 pb-3 float-right">Cancel</a>
	                    <button type="submit" class="btn btn-primary pt-3 pb-3 float-right">Place Order</button>
	                    
	                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <input type="hidden" name = "total-price-approx" value = "${totalPrice}" />
	                    <input type="hidden" name = "total-weight-approx" value = "${totalWeight}" /> 
	
	                </div>
	            </div>

	            <hr />
			
			</form>

        </div>

    </div>
</div>  