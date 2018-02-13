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
                    <strong> Add To Cart (<span>Puffer Fish</span>) </strong>
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
                                <span id = "addToCartModalOrigin" style = "position: absolute; color: white; top: 270px; max-width: 280px; height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
                                    Laguna oh laguna laguna baldeeee
                                </span>
                            <img class = "border border-primary rounded" id = "addToCartProductImage" alt = "Puffer fish yaay" src = "puffer-fish.jpg" width = "300" height = "300" />
                        </div>

                        <div class = "col-md-7">
                            <h4 class = "mt-1" id = "addToCartProductName"> Puffer Fish </h4>
                            <hr class = "m-0"/>

                            <p class = "mt-2 mb-0"> <strong>Price:</strong> <span id = "priceAddToCartModal">200.00 php</span> / Per <span id = "massDefTypeAddToCart"> kilograms </span> </p>
                            <p class = "mb-0"> <strong>Available stocks:</strong> <span> 200 kilograms </span> </p>
                            <p class = "mb-0"> <strong>Fresh until:</strong> <span class = "red-text" id = "addToCartModalExpirationDate"> Nov 28 1998 </span> </p>


                            <h6 class = "mt-2 pb-2 pt-2" style = "border-width: 1px 0px 1px 0px; border-style: solid; border-color: #E5E5E5; width: 150px;"> <strong>Product Description: </strong> </h6>



                            <div class = "mt-2" style = "height: 70px; overflow-y: auto;">

                                <span class = "text-left" id = "addToCartModalProductDescription">
                                    Some quick example text to build on the card title and make up the bulk of the card's content.
                                    Some quick example text to build on the card title and make up the bulk of the card's content.
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
                                                        <option value="kilogram" selected>Kilograms</option>
                                                        <option value="ton">Tons</option>
                                                        <option value="lb">Pounds</option>
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
                                            <input type="text" id="totalPrice" value = "2000000.00 php" style = "width: 120px;  text-align: center;" readonly />
                                        </div>
                                        <div class = "col-md-6">
                                            <label for = "totalMass"  class = "black-text"> <strong> Total weight: </strong> </label>
                                            <input type="text" id="totalMass" value = "200 kilograms" style = "width: 120px; text-align: center;" readonly />
                                        </div>
                                    </div>

                        </div>

                        <div class = "col-md-2">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        </div>

                        <div class = "col-md-2">
                            <button type="button" class="btn btn-primary" id = "btnAddToCart">Add <i class="fa fa-plus-circle ml-1" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

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
            <div class="modal-body" style = "overflow-x: auto;">

            <div class = "d-none" id = "productCartEmptyMessage">
                <p class="text-center p-5"> No products added. </p>
            </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Product name</th>
                            <th>Price</th>
                            <th>Mass </th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>

            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                <button class="btn btn-primary">Place Order</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="addAddressModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

            <span> Add Address <i class="fa fa-address-card ml-2" aria-hidden="true"></i> </span>

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
                                            <option value = "+63"> (+63 PH) </option>
                                        </select>
                                        <input type="text" id = "phone-number" placeholder="phone number" class="form-control m-0 p-0 pt-0">
                                     </div>
                                </div>
                        
                        <label class = "ml-2 mb-1">Country</label>
						<select class = "ml-2 country" id = "country">
                        	<option value = "Phillipines"> Phillipines </option>
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
                                            <option value = "+63"> (+63 PH) </option>
                                        </select>
                                        <input type="text" id = "phone-number" placeholder="phone number" class="form-control m-0 p-0 pt-0">
                                     </div>
                                </div>
                        
                        <label class = "ml-2 mb-1">Country</label>
                        <select class = "ml-2 country" id = "country">
                        	<option value = "Phillipines"> Phillipines </option>
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