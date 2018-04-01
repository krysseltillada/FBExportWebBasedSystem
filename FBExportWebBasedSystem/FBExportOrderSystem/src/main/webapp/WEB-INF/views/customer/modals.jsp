<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class="modal fade" id="notificationModalMobile" tabindex="-1" role="dialog" aria-labelledby="notificationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fluid" role="document">
        <div class="modal-content">
            <div class="modal-header">

            <span> Notifications </span>


            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body p-0">
                    <h6 class="dropdown-header">
                        <span> 1 notifications </span>
                        <span class = "float-right"> Clear all </span>
                    </h6>

                    <div style = "max-height: 380px; overflow-y: auto;">
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start notification-link pl-4 pr-4">
                                <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Order approved</h6>
                                <button type="button" class="close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                </button>
                                </div>
                                <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                <small> 1 day ago </small>
                            </a>


                        </div>

                    </div>

                    <span class="dropdown-header text-center">
                        <a class = "p-0" href = "#"> see more </a>
                    </span>

            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="addToCartModal" tabindex="-1" role="dialog" aria-labelledby="addToCartModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title ml-1" id="productHeaderTitle">
                    <strong> Add To Cart (<span></span>) </strong>
                    <i class="fa fa-cart-plus ml-1 mb-1" aria-hidden="true"></i>

                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pb-0">

                <div class = "container p-0">
                    <div class = "row">
                        <div class = "col-md-5">
                                <span id = "addToCartModalAvailableWeight" style = "position: absolute; color: white; top: 270px; max-width: 280px; height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                                	Available : <span id="availableWeight"></span> Kg
                                </span> 
                            <img class = "border rounded" id = "addToCartProductImage" alt = "Product" src = "" width = "300" height = "300" />
                        </div>

                        <div class = "col-md-7">
                            <h4 class = "mt-1" id = "addToCartProductName"> Puffer Fish </h4>
                            <hr class = "m-0"/>

                            <p class = "mt-2 mb-0"> 
                            
                            <strong>Price:</strong> 
                            
                            
                            <span id = "priceAddToCartModal"></span> / Per 
                            <input id = "priceAddToCartModalRealApprox" type = "hidden" value = "" />
                            <span id = "massDefTypeAddToCart"> kilograms </span> 
                            
                            </p>
                            
                            <p class = "mb-0"> <strong>Stocks:</strong> <span id = "product-stock-status"></span> </p>
                            <p class = "mb-0"> <strong>Date posted:</strong> <span id = "date-posted"></span> </p>

                            <h6 class = "mt-2 pb-2 pt-2" style = "border-width: 1px 0px 1px 0px; border-style: solid; border-color: #E5E5E5; width: 150px;"> <strong>Product Description: </strong> </h6>


                            <div class = "mt-2" style = "height: 70px; overflow-y: auto;">

                                <span class = "text-left" id = "addToCartModalProductDescription">
                                	Origin : <span id="productOrigin"></span> <br />
                                	Description : <span id="productDescription"></span>
                                </span>
                            </div>

                            <hr />


                                <div class = "row">
                                    <div class = "col-md-6">


                                            <div class = "row">

                                                <div class = "col-md-6">

                                                    <label> <strong> Weight</strong> </label>

                                                </div>

                                                <div class = "col-md-6">

                                                    <select class="browser-default" id = "massType">
                                                        <option value="kilogram" selected>KILO</option>
                                                        <option value="ton">TON</option>
                                                        <option value="lb">POUND</option>
                                                    </select>

                                                </div>

                                            </div>

                                    </div>
                                    <div class = "col-md-6">

                                            <div class = "row">

                                                <div class = "col-md-6">
                                                    <label> <strong> Quantity: </strong> </label>
                                                </div>

                                                <div class = "col-md-6">
                                                        <input id="quantity" class = "text-center" name="value" maxlength="10" style = "width: 50px;" data-toggle="tooltip" data-placement="top" title="Invalid value">
                                                </div>

                                            </div>

                                    </div>
                                </div>




                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer mt-1">

                <div class = "container p-0 ml-1">

                    <div class = "row no-gutters">

                        <div class = "col-md-8 mt-2">

                                    <div class = "row">
                                        <div class = "col-md-6">
                                            <label for = "totalPrice"> <strong> Total price: </strong> </label>
                                            <input type="text" id="totalPrice" value = "" style = "width: 120px;  text-align: center;" readonly />
                                            <input type="hidden" id = "total-real-price-approx" value = "" />
                                        </div>
                                        <div class = "col-md-6">
                                            <label for = "totalMass"  class = "black-text"> <strong> Total weight: </strong> </label>
                                            <input type="text" id="totalWeight" value = "" style = "width: 120px; text-align: center;" readonly />
                                        </div>
                                    </div>

                        </div>

                        <div class = "col-md-2">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        </div>

                        <div class = "col-md-2">
                            <button type="button" class="btn btn-primary" id = "btnAddToCart">Add <i class="fa fa-plus-circle ml-1" aria-hidden="true"></i></button>
                        </div>
                        
                        <input type = "hidden" value = "" id = "product-id" />
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<security:authorize access = "hasAuthority('CUSTOMER')">

	<div class="modal fade autoModal" id="shoppingModalCart" tabindex="-1" role="dialog" aria-labelledby="shoppingCartModal" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            
	            <div class="modal-header">
	            <div class="shopping-cart-header" style="margin-left:40px;">
	                <i class="fa fa-shopping-cart cart-icon"></i><span class="badge productCartHeaderItemCount">0</span>
	            </div>
	
	            <div class="shopping-cart-total" style="margin-right:40px;">
	                <span class="lighter-text">Total:</span>
	                <span class="main-color-text">0.00 PHP</span>
	            </div>
	
	            </div>
	            <div class="modal-body" style = "max-height: 400px; overflow-y: auto; overflow-x: auto;">
	
	            <div class = "d-none" id = "productCartEmptyMessage">
	                <p class="text-center p-5"> No products added. </p>
	            </div>
	            
	              <sql:query var="cartItems" 
	                            		   dataSource = "${dataSource}">
	                           	SELECT p.product_image_link, p.product_id, i.item_id, p.name, i.price, i.weight, i.weight_type FROM 
	                           		   (((Customer c INNER JOIN cart_items ci ON c.cart_cart_id = ci.cart_cart_id) 
	                           		   				 INNER JOIN item i ON ci.items_item_id = i.item_id) 
	                           		   				 INNER JOIN product p ON p.product_id = i.product_product_id) WHERE c.id = ${sessionScope.customerId}
				  </sql:query>
	                <table class="table table-hover">
	                    <thead>
	                        <tr>
	                           
	                            <th>Image</th>
	                            <th>Product name</th>
	                            <th>Price</th>
	                            <th>Weight </th>
	                            <th>Remove</th>
	                           	
	                        </tr>
	                    </thead>
	                    <tbody>
	                    
	                    	<c:forEach var = "cartItem" items = "${cartItems.rows}">
	                    	
	                    		<tr>
	                    			<td><img src="<c:url value = '${cartItem.product_image_link}' />" width="50" height="50" class="float-left" /></td>
	                    			<td><a href = "<c:url value = '/view-product/${cartItem.product_id}' />">${cartItem.name} </a> </td>
	                    			<td> ${cartItem.price} </td>
	                    			<td><span class="productWeightCart">${cartItem.weight}</span> ${cartItem.weight_type} </td>
	                    			<td class="text-center"><a class = "delete-cart-item"><i class="fa fa-remove text"></i></a></td>
									<input type = "hidden" id = "item-id" value = "${cartItem.item_id}" />
									<input type = "hidden" class = "product-id" value = "${cartItem.product_id}" />
	                    		</tr>
	                    		
	                    		
	                    	</c:forEach>
	                    
	                    </tbody>
	                </table>
	
	            </div>
	            <!--Footer-->
	            <div class="modal-footer">
	                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
	                <button class="btn btn-primary btn-place-order">Place Order</button>
	            </div>
	        </div>
	    </div>
	</div>

</security:authorize>

<div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="addAddressModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

            <span> Add Address <i class="fa fa-address-card ml-2" aria-hidden="true"></i> </span>
            <span class = "errorMessage red-text mr-2 small"></span>

            </div>

            <div class = "modal-body pb-1 small">
                
                
                        <div class="form-group ml-2 mr-2">
                            <label class="form-control-label">Address To</label>
                            <input type="text" placeholder="Your friend, coworker?" id = "address-type" class="form-control m-0 p-0 pt-0">
                        </div>
                        <div class="form-group ml-2 mr-2">       
                            <label class="form-control-label">Receiver's name</label>
                            <input type="text" placeholder="his/her full name" id = "receivers-name" class="form-control m-0 p-0 pt-0">
                        </div>

                        <div class="form-group ml-2 mr-2">       
                                     <div class = "form-inline">
                                        <select class = "mr-2 countryCode" id = "countryCode">
                                        </select>
                                        <input type="text" id = "phone-number" placeholder="phone number" class="form-control m-0 p-0 pt-0">
                                     </div>
                                </div>
                        
                        <label class = "ml-2 mb-1">Country</label>
						<select class = "ml-2 country" id = "country">
                        </select>

                        <div class="form-group ml-2 mr-2 mt-1">       
                            <div class = "form-inline">
                                <input type="text" id = "city" placeholder="city" class="form-control mr-3 mb-0">
                                <input type="text" id = "zipcode" placeholder="zipcode" class="form-control mb-0">
                            </div>
                        </div>
                        

                        <div class = "form-group ml-2 mr-2 mt-0 mb-1">

                            <label> Address </label>
                            <textarea type="text" id="address" class="md-textarea p-0" style = "height: 10px;"></textarea>
                            
                        </div>

                        <div class = "form-group ml-2 mr-2 mt-2 mb-1">
                            <label> Shipping instructions </label>
                            <textarea type="text" id="shipping-instructions" class="md-textarea p-0" style = "height: 10px;"></textarea>
                        </div>
                        
                        

                            
            </div>

            <div class="modal-footer p-2">
                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary btn-add">Add</button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="editAddressModal" tabindex="-1" role="dialog" aria-labelledby="editAddressModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
	
            <span> Edit Address <i class="fa fa-address-card ml-2" aria-hidden="true"></i> </span>
			<span class = "errorMessage red-text mr-2 small"></span>
			<input type = "hidden" id = "shippingAddressId" value = "" />

            </div>

            <div class = "modal-body pb-1 small">
                
                
                        <div class="form-group ml-2 mr-2">
                            <label class="form-control-label">Address Type</label>
                            <input type="text" id = "address-type" placeholder="Your friend, coworker?" class="form-control m-0 p-0 pt-0">
                        </div>
                        <div class="form-group ml-2 mr-2">       
                            <label class="form-control-label">Receiver's name</label>
                            <input type="text" id = "receivers-name" placeholder="his/her full name" class="form-control m-0 p-0 pt-0">
                        </div>

                            <div class="form-group ml-2 mr-2">       
                                     <div class = "form-inline">
                                        <select class = "mr-2 countryCode" id = "country-code">
                                        </select>
                                        <input type="text" id = "phone-number" placeholder="phone number" class="form-control m-0 p-0 pt-0">
                                     </div>
                                </div>
                        
                        <label class = "ml-2 mb-1">Country</label>
                        <select class = "ml-2 country" id = "country">
                        </select>

                        <div class="form-group ml-2 mr-2 mt-1">       
                            <div class = "form-inline">
                                <input type="text" id = "city" placeholder="city" class="form-control mr-3 mb-0">
                                <input type="text" id = "zipcode" placeholder="zipcode" class="form-control mb-0">
                            </div>
                        </div>
                        

                        <div class = "form-group ml-2 mr-2 mt-0 mb-1">

                            <label> Address </label>
                            <textarea type="text" id="address" class="md-textarea p-0" style = "height: 10px;"></textarea>
                            
                        </div>

                        <div class = "form-group ml-2 mr-2 mt-2 mb-1">
                            <label> Shipping instructions </label>
                            <textarea type="text" id="shipping-instructions" class="md-textarea p-0" style = "height: 10px;"></textarea>
                        </div>
                            
            </div>

            <div class="modal-footer p-2">
                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary btn-edit">Edit</button>
            </div>

        </div>
    </div>
</div>