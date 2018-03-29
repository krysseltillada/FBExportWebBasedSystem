<%@ include file = "../../lib/tags/tag-libraries.jsp" %>



<script id = "notificationSeeMoreLoaderTemplate" type = "text/template">
    <span id = "notificationSeeMoreLoader" class = "mx-auto mt-2" href="#">
        <img src = "<c:url value = '/resources/admin/img/loader.gif' />" width = "35" height = "35" />
    </span>
</script>

<script id = "notificationModalListItem" type = "text/template">
    <span class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1"> {{=header}} {{=icon}} </h5>
        <small>{{=dateAgo}}</small>
        </div>
        <p class="mb-1">{{=description}}.</p>
    </span>
</script>

<script id = "notificationListItem" type = "text/template">
    <li>
        <a rel="nofollow" style = "pointer: none;" class="dropdown-item">
            <div class="notification">
                <div class="notification-content">
                
                    {{=icon}}
                    {{=header}}
                    
                </div>
                <div class="notification-time ml-2"><small>{{=dateAgo}}</small></div>
                <input type = "hidden" id = "isSeen" value = "{{=isSeen}}" />
            </div>
        </a>
    </li>
</script>

<script id = "orderRowDiv" type = "text/template">
    <tr>
        <td></td>
        <td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>
        <td>
            <h3> 
                <span class="badge badge-success p-1">Order# <span id = "orderId">{{=order.orderId}}</span> </span> 
                <input id = "orderId-{{=order.orderId}}" type = "hidden" />
                </h3>
            <span style = "font-size: 13px;">
                <strong> by: </strong> <strong> <a href = "#"> {{=order.customer.firstname}} {{=order.customer.middlename}} {{=order.customer.lastname}} </a> </strong>
                <br />
                <strong> Payment: </strong> 
                
                {{ if (order.paymentMethod == 'CASH_ON_DELIVERY') { }}
                    Cash on delivery <i class="fa fa-truck ml-1" aria-hidden="true"></i>
                {{ } else { }}
                    Paypal <i class="fa fa-paypal ml-1" aria-hidden="true"></i>
                {{ } }}

            </span>
        </td>
        <td> 

            <div style = "font-size: 13px;">
                <strong> Order: </strong> 

                {{ if (order.orderStatus == 'CANCELLED' || order.orderStatus == 'RETURNED' || order.orderStatus == 'REFUND') { }}

                    <small> <a class = "btn-view-reason"
                                href = "javascript:void(0)"
                                data-value = "{{=order.reason}}"> (view reason) </a> </small>

                {{ } }}

            
                
                {{ var orderStatusColor = (order.orderStatus == 'TO_SHIP') ? "#796AEE" : 
                                          (order.orderStatus == 'RECEIVED') ? "#0275D8" :
                                          (order.orderStatus == 'REJECTED') ? "#D9534F" : 
                                          (order.orderStatus == 'APPROVED') ? "#5CB85C" :
                                          (order.orderStatus == 'PENDING') ? "#FFC107" :
                                          (order.orderStatus == 'CANCELLED') ? "#D9534F" :
                                          (order.orderStatus == 'PAID') ? "#91C361" : 
                                          (order.orderStatus == 'REFUND') ? "#EA1E63" : "#795548"; }}

                {{ var orderStatusLabel = (order.orderStatus == 'TO_SHIP') ? "To ship" :
                                          (order.orderStatus == 'RECEIVED') ? "Received" :
                                          (order.orderStatus == 'REJECTED') ? "Rejected" :
                                          (order.orderStatus == 'APPROVED') ? "Approved" :
                                          (order.orderStatus == 'PENDING') ? "Pending" :
                                          (order.orderStatus == 'CANCELLED') ? "Cancelled" :
                                          (order.orderStatus == 'PAID') ? "Paid" :
                                          (order.orderStatus == 'REFUND') ? "Refund" : "Returned"; }}
            
                <h6>                                             
                    <div class="btn-group dropdown-select">
                        <button type="button" 
                                style = "background-color: {{=orderStatusColor}};" 
                                class="btn btn-sm text-white dropdown-toggle" 
                                data-toggle="dropdown" 
                                aria-haspopup="true" 
                                aria-expanded="false">
                                {{=orderStatusLabel}}
                        </button>
                        <div class="dropdown-menu">
                        <h6 class="dropdown-header">Mark as</h6>
                        
                        </div>
                    </div>
                </h6>


                <strong> Shipment: </strong> <br />

                {{ if (order.shipping) { }}

                    {{ if (order.shipping.shipmentStatus == 'ON_CARGO_SHIP') { }}
                        <span id = "shipmentStatus">On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i></span>
                    {{ } else if (order.shipping.shipmentStatus == 'ON_TRUCK') { }}
                        <span id = "shipmentStatus">On Truck <i class="fa fa-truck ml-1" aria-hidden="true"></i></span>
                    {{ } }}

                {{ } else { }}
                    <span id = "shipmentStatus">Shipment status not defined.</span>
                {{ } }}
  
            </div>

        </td>
        <td style = "max-width: 250px;">
            <span style = "font-size: 14px;">
                <strong> Receiver's name: </strong> 

                <span style = "font-size: 12px;">
                    {{=order.shippingAddress.receiverFullName}}
                </span>
                <br/>
                
                <strong> Phone number: </strong> 
                
                <span style = "font-size: 12px;">
                    (+{{=order.shippingAddress.contact.countryCode}}) {{=order.shippingAddress.contact.phoneNumber}}
                </span>
                
                <br/>
                
                <strong> Address <span style = "font-size: 12px;"> ({{=order.shippingAddress.addressType}}) </span>:  
                </strong> <br />
                
                <span style = "font-size: 12px;">
                    {{=order.shippingAddress.address.zipCode}} {{=order.shippingAddress.address.address}}
                </span>
                
                <br />
                
                <strong> Country <span style = "font-size: 12px;"> (City) </span>:  </strong> <br />
                <span style = "font-size: 12px;">
                    {{=order.shippingAddress.address.country}}({{=order.shippingAddress.address.city}})
                </span>
            </span>

            <br />
        </td>
        <td>

            <span style = "font-size: 13px;"> 
                <strong> Items: </strong> <br />
                    <span style = "font-size: 12px;">
                        {{=order.totalItems}} items
                    </span>
                <br />

                <strong> Weight: </strong> <br />
                <span style = "font-size: 12px;">
                    {{=order.totalWeight}} KILO 
                </span> <br />

                <strong> Price: </strong> <br />
                <span style = "font-size: 12px;">
                    {{=order.totalPrice}}
                </span>
            </span>

        </td>

        <td>

            <span style = "font-size: 13px;"> 

                <strong> Ordered: </strong> <br />
                <span style = "font-size: 12px;">
                    {{=order.dateOrdered}}
                </span>
                <br />

                <strong> Expected: </strong> <br />
                <span style = "font-size: 12px;">

                    {{ if (order.shipping) { }}
                        {{=order.shipping.expectedDate}}
                    {{ } else { }}
                        None
                    {{ } }}
                  
                </span>
                <br />

            </span>
        
        </td>
        
    </tr>
</script>

<script id = "collapsingOrderDiv" type = "text/template"> 
      <div class = "row slider pt-2 pb-2 pl-1 pr-1">
        
        <div class = "col-lg-12">

          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#items-order-tab-id-{{=order.orderId}}" role="tab">Items</a>
            </li>

            {{ if (order.shipping) { }}
                <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#shipping-order-tab-id-{{=order.orderId}}" role="tab">Shipping</a>
                </li>
            {{ } }}

            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#shipping-instructions-tab-id-{{=order.orderId}}" role="tab">Shipping instructions</a>
            </li>
          </ul>

          <div class="tab-content" style = "border-bottom: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD;">
            <div class="tab-pane active" id="items-order-tab-id-{{=order.orderId}}" role="tabpanel">
             
              <div class = "p-3">
                <h5> {{=order.cart.itemCount}} Items ordered </h5>
                <table class="table" style = "border-bottom: 1px solid #E9ECEF; border-left: 1px solid #E9ECEF; border-right: 1px solid #E9ECEF;">

                            <thead>
                              <tr>
                                <th></th>
                                <th></th>
                                <th>Item Name</th>
                                <th>Weight</th>
                                <th>Price </th>
                              </tr>
                            </thead>
                            <tfoot>
                              <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>Total: {{=order.totalWeight.toFixed(1)}} KILO</th>
                                <th>Total: {{=order.totalPrice.toFixed(2)}} PHP </th>
                              </tr>
                            </tfoot>
                            <tbody>

                                {{ for (var cartItemIndex = 0; cartItemIndex != cartItems.length; ++cartItemIndex ) { }}

                                    {{ var item = cartItems[cartItemIndex]; }}

                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            <img src = "/FBExportSystem/{{=item.product.productImageLink}}" width = "40" height = "40" />
                                        </td>
                                        <td>
                                            {{=item.product.name}} <br />
                                            {{=item.product.price.toFixed(2)}} PHP PER KILO
                                        </td>
                                    
                                        <td>
                                            <input class = "text-center" type="text" value = "{{=item.weight.weight.toFixed(1)}} {{=item.weight.weightType}}" style = "width: 90px;" readonly>
                                        </td>
                                        <td>{{=item.price.toFixed(2)}} PHP</td>
                                    </tr>
                                {{ } }}
                             
                            </tbody>
                </table>
              </div>
            </div>

            {{ if (order.shipping) { }}

                <div class="tab-pane" id="shipping-order-tab-id-{{=order.orderId}}" role="tabpanel">
                    <div class = "p-4">

                        <div>
                            <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                                data-toggle="collapse" href="#shippingInformationCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="shippingInformationCollapseItem-id-{{=order.orderId}}" style = "cursor: pointer;"></i>
                            <span class = "h5-responsive"> <strong> Shipping information </strong> </span>
                            <span class = "float-right"> 
                                <a class = "blue-text" data-toggle="collapse" href="#updateShipping-id-{{=order.orderId}}" 
                                   role="button" aria-expanded="false" aria-controls="updateShipping-id-{{=order.orderId}}"> Update Shipping </a> 
                                <i class="fa fa-refresh ml-1" aria-hidden="true"></i>
                            </span>
                        </div>

                        <hr class = "mt-1" />

                        
                        <div class="collapse.show multi-collapse" id="shippingInformationCollapseItem-id-{{=order.orderId}}">

                            <div class="collapse" id="updateShipping-id-{{=order.orderId}}" style="">
                            
                                <p class="mb-1"> <strong> Update shipping information<i class="fa fa-refresh ml-1" aria-hidden="true"></i> </strong> 
                                <strong> <span id="errorMessage" class="float-right text-red" style="display: none;"> *error</span> </strong> </p>
                            
                                <hr class="mt-1">

                                <div class="form-group">
                                    <label>Shipment status: </label>
                                    <select id="shipmentStatusComboBox" class="form-control">
                                        <option disabled="" selected=""> shipment status </option> 
                                        <option value="On Cargo Ship">On Cargo Ship</option>
                                        <option value="On Truck">On Truck</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    
                                    <div class="form-group">
                                    <label>Expected Date: </label>
                                    <input id="expectedDatePicker" type="text" placeholder="Expected date" class="mr-2 form-control flatpickr-input" readonly="readonly">
                                    </div>
                                    
                                </div>

                                <div class="form-group">       

                                    <label>Departure and arrival date: </label>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <input id="departureDatePicker" type="text" placeholder="Departure date" class="mr-2 form-control flatpickr-input" readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <input id="arrivalDatePicker" type="text" placeholder="Arrival date" class="form-control flatpickr-input" readonly="readonly">
                                        </div>
                                    </div>
                                    
                                </div>
            
                                <div class="collapse" id="vesselStatusCollapseDiv-id-{{=order.orderId}}">
                                
                                    <h5> Vessel status </h5>
                                    <hr class="mt-2">
                        
                                    <div class="form-horizontal">
                                        <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Vessel name</label>
                                        <div class="col-sm-9 pl-0">
                                            <input id="vessel-name" type="text" placeholder="vessel name" class="form-control form-control-success">
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">MMSI Number</label>
                                        <div class="col-sm-9 pl-0">
                                            <input id="mmsi-number" type="text" placeholder="mmsi number" class="form-control form-control-warning">
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">IMO Number</label>
                                        <div class="col-sm-9 pl-0">
                                            <input id="imo-number" type="text" placeholder="imo number" class="form-control form-control-warning">
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Destination</label>
                                        <div class="col-sm-9 pl-0">
                                            <input id="destination" type="text" placeholder="destination" class="form-control form-control-warning">
                                        </div>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
    
                                <hr>
        
                                <div class="form-group row">       
                                    <div class="col-sm-9 offset-sm-3">
                                        <button id="btn-update-shipping-info" class="btn btn-primary float-right ml-2" > Update </button>
                                        <button id="btn-cancel-shipping-info" class="btn btn-primary float-right" data-toggle="collapse" href="#updateShipping-id-{{=order.orderId}}" 
                                                role="button" aria-expanded="false" aria-controls="updateShipping-id-{{=order.orderId}}"> Cancel </button>
                                    </div>
                                </div>
    
    		                    <hr>
    				
                        </div>


                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> Address <i class="fa fa-address-book-o" aria-hidden="true"></i> </strong> :  {{=order.shippingAddress.address.address}}
                            </div>
                            <div class = "col-4">
                                <strong> Zipcode <i class="fa fa-home" aria-hidden="true"></i>: </strong>  {{=order.shippingAddress.address.zipCode}}
                            </div>
                        </div>
                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> Country <i class="fa fa-globe" aria-hidden="true"></i> : </strong> {{=order.shippingAddress.address.country}}
                            </div>
                            <div class = "col-4">
                                <strong> City <i class="fa fa-map" aria-hidden="true"></i> : </strong> {{=order.shippingAddress.address.city}} 
                            </div>
                        </div>
                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> Shipment status : </strong> 
                                {{ if (order.shipping.shipmentStatus == 'ON_CARGO_SHIP') { }}
                                    <span id = "shipmentStatus">On Cargo Ship <i class="fa fa-ship" aria-hidden="true"></i></span>
                                {{  } else if (order.shipping.shipmentStatus == 'ON_TRUCK') { }}
                                    <span id = "shipmentStatus">On Truck <i class="fa fa-truck" aria-hidden="true"></i></span>
                                {{ } }}
                            </div>
                            <div class = "col-4">
                                <strong> Your Phone number <i class="fa fa-mobile-phone" aria-hidden="true"></i> : </strong> (+{{=order.shippingAddress.contact.countryCode}}) {{=order.shippingAddress.contact.phoneNumber}}  
                            </div>
                        </div>
                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> Departure : </strong> <span id = "departureDate">{{=order.shipping.departureDate}}</span>
                            </div>
                            <div class = "col-4">
                                <strong> Arrival : </strong> <span id = "arrivalDate">{{=order.shipping.arrivalDate}}</span>
                            </div>
                        </div>

                        <br />

                        {{ if (order.shipping.shipmentStatus == 'ON_CARGO_SHIP') { }}

                            <div>
                                <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                                    data-toggle="collapse" href="#vesselStatusCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="vesselStatusCollapseItem-id-{{=order.orderId}}" style = "cursor: pointer;"></i>
                                <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
                                <span class = "float-right" style = "font-size: 14px;">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
                                </span>
                            </div>

                            <hr class = "mt-1" />

                            <div class="collapse" id="vesselStatusCollapseItem-id-{{=order.orderId}}">

                                <div class = "row no-gutters">
                                    <div class = "col-8">
                                        <strong> Vessel name: </strong> <span id = "vesselName">{{=order.shipping.vesselStatus.vesselName}}</span> 
                                    </div>
                                    <div class = "col-4">
                                        <strong> IMO Number: </strong> <span id = "imoNumber">{{=order.shipping.vesselStatus.imoNumber}}</span>
                                    </div>
                                </div>

                                <div class = "row no-gutters">
                                    <div class = "col-8">
                                        <strong> MMSI Number: </strong> <span id = "mmsiNumber">{{=order.shipping.vesselStatus.mmsiNumber}}</span> 
                                    </div>
                                        <div class = "col-4">
                                        <strong> Destination: </strong> <span id = "destination">{{=order.shipping.vesselStatus.destination}}</span> 
                                    </div>
                                    
                                </div>

                                <hr class = "mt-1" />

                                <div class = "row">

                                    <div class = "col shipTrackingMap">

                                    </div>


                                </div>

                            </div>

                        {{ } }}

                        </div>

                        <div>
                            <i class="fa fa-chevron-circle-down fa-lg mr-1 collapsed" aria-hidden="true" data-toggle="collapse" href="#shippingLogCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="shippingLogCollapseItem-id-{{=order.orderId}}" style="cursor: pointer;"></i>
                            <span class="h5-responsive"> <strong> Shipping Log </strong> </span>
                            <span class = "float-right" style = "font-size: 14px;">
                               
                                <a class = "blue-text" id = "updateShippingLog"
                                   data-toggle="collapse" href="#addShippingLog-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="addShippingLog-id-{{=order.orderId}}"> Update Shipping Log </a>
                                <i class="fa fa-refresh ml-1" aria-hidden="true"></i>
                            </span>
                        </div>

                        <hr class="mt-1">

                        <div class="collapse.show multi-collapse collapse" id="shippingLogCollapseItem-id-{{=order.orderId}}" style="">

                            <div class="collapse" id="addShippingLog-id-{{=order.orderId}}" style="">
                                <p class="mb-1"> <strong> Update shipping log  <i class="fa fa-refresh ml-1" aria-hidden="true"></i> </strong> 
                                <strong> <span id = "errorMessage" class="float-right text-red" style = "display: none;"> *error</span> </strong> </p>
                                
                                <hr class="mt-1">
                                
                                <div class="form-horizontal">
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label"> Header:</label>
                                        <div class="col-sm-10">
                                            <input id="shippingLogHeader" type="text" placeholder="Header" class="form-control form-control-success">
                                        </div>
                                    </div>
                                
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label"> Description:</label>
                                        <div class="col-sm-10">
                                            <textarea id="shippingLogDescription" class="form-control" rows="3" cols="103" placeholder="Description"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label"> Address:</label>
                                        <div class="col-sm-10">
                                            <textarea id="shippingLogAddress" class="form-control" rows="3" cols="103" placeholder="Address"></textarea>
                                        </div>
                                    </div>
                                
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label"> Date:</label>
                                        <div class="col-sm-10">
                                            <input id="shippingLogDatePicker" type="text" placeholder = "Date" class="form-control form-control-success">
                                        </div>
                                    </div>
                                                
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label"> Time:</label>
                                        <div class="col-sm-10">
                                            <input id="shippingLogTimePicker" type="text" placeholder = "Time" class="form-control form-control-success">
                                        </div>
                                    </div>
                                
                                    <hr class="mt-1">
                                
                                    <div class="form-group row">       
                                        <div class="col-sm-9 offset-sm-3">
                                            <button id = "btn-update-shipping-log" class="btn btn-primary float-right ml-2"> Update </button>
                                            <button id = "btn-cancel-shipping-log" class="btn btn-primary float-right"> Cancel </button>
                                        </div>
                                    </div>

                                    <hr class="mt-1">
                                
                                </div>
    
                            </div>

                            <div class="list-group" style = "max-height: 286px; overflow-y: auto;">

                                {{ if (order.shipping.shippingLog.length > 0) { }}

                                    {{ for (var i = order.shipping.shippingLog.length - 1; i >= 0; --i) { }}
                            
                                        <span class="list-group-item list-group-item-action flex-column align-items-start">
                                            
                                            <div class="d-flex w-100 justify-content-between">
                                            <input type = "hidden" value = "{{=order.shipping.shippingLog[i].shippingLogId}}" id = "shippingDeleteId" />
                                            <h5 class="mb-1">{{=order.shipping.shippingLog[i].header}} <small> ({{=order.shipping.shippingLog[i].date}} - {{=order.shipping.shippingLog[i].time}})</small></h5>
                                            <button type="button" class="close delete-shipping-log" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                    </button>
                                            </div>
                                            <p class="mb-1">{{=order.shipping.shippingLog[i].description}}</p>
                                            <small>{{=order.shipping.shippingLog[i].address}}</small>
                                        </span>

                                    {{ } }}

                                {{ } else { }}

                                    <div class="row">
                                        <div class="mx-auto mt-2">
                                            <h5> No shipping logs here </h5>
                                        </div>
                                    </div>

                                {{ } }}
                            </div>
                        </div>



                        
                    </div>
                </div>
            {{ } }}

            <div class = "tab-pane" id = "shipping-instructions-tab-id-{{=order.orderId}}" role="tabpanel">
              <div class = "p-4">
                <h5> Shipping instructions: </h5>
                <hr class="mt-1">
                <span> 
                  {{=order.shippingAddress.shippingInstructions}}
                </span>
              </div>
            </div>
            
          
          </div>

          
        </div>
       
      </div> 
</script>

<script id = "shippingDivOrderTemplate" type = "text/template">

    <div class="tab-pane" id="shipping-order-tab-id-{{=order.orderId}}" role="tabpanel">
        <div class = "p-4">

            <div>
                <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                    data-toggle="collapse" href="#shippingInformationCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="shippingInformationCollapseItem-id-{{=order.orderId}}" style = "cursor: pointer;"></i>
                <span class = "h5-responsive"> <strong> Shipping information </strong> </span>
                <span class = "float-right"> 
                    <a class = "blue-text" data-toggle="collapse" href="#updateShipping-id-{{=order.orderId}}" 
                        role="button" aria-expanded="false" aria-controls="updateShipping-id-{{=order.orderId}}"> Update Shipping </a> 
                    <i class="fa fa-refresh ml-1" aria-hidden="true"></i>
                </span>
            </div>

            <hr class = "mt-1" />

            

            <div class="collapse.show multi-collapse" id="shippingInformationCollapseItem-id-{{=order.orderId}}">

                    <div class="collapse" id="updateShipping-id-{{=order.orderId}}" style="">
                                
                        <p class="mb-1"> <strong> Update shipping information<i class="fa fa-refresh ml-1" aria-hidden="true"></i> </strong> 
                        <strong> <span id="errorMessage" class="float-right text-red" style="display: none;"> *error</span> </strong> </p>
                    
                        <hr class="mt-1">

                        <div class="form-group">
                            <label>Shipment status: </label>
                            <select id="shipmentStatusComboBox" class="form-control">
                                <option disabled="" selected=""> shipment status </option> 
                                <option value="On Cargo Ship">On Cargo Ship</option>
                                <option value="On Truck">On Truck</option>
                            </select>
                        </div>

                        <div class="form-group">
                            
                            <div class="form-group">
                            <label>Expected Date: </label>
                            <input id="expectedDatePicker" type="text" placeholder="Expected date" class="mr-2 form-control flatpickr-input" readonly="readonly">
                            </div>
                            
                        </div>

                        <div class="form-group">       

                            <label>Departure and arrival date: </label>
                            <div class="form-inline">
                                <div class="form-group">
                                    <input id="departureDatePicker" type="text" placeholder="Departure date" class="mr-2 form-control flatpickr-input" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <input id="arrivalDatePicker" type="text" placeholder="Arrival date" class="form-control flatpickr-input" readonly="readonly">
                                </div>
                            </div>
                            
                        </div>

                        <div class="collapse" id="vesselStatusCollapseDiv-id-{{=order.orderId}}">
                        
                            <h5> Vessel status </h5>
                            <hr class="mt-2">
                
                            <div class="form-horizontal">
                                <div class="form-group row">
                                <label class="col-sm-3 form-control-label">Vessel name</label>
                                <div class="col-sm-9 pl-0">
                                    <input id="vessel-name" type="text" placeholder="vessel name" class="form-control form-control-success">
                                </div>
                                </div>
                                <div class="form-group row">
                                <label class="col-sm-3 form-control-label">MMSI Number</label>
                                <div class="col-sm-9 pl-0">
                                    <input id="mmsi-number" type="text" placeholder="mmsi number" class="form-control form-control-warning">
                                </div>
                                </div>
                                <div class="form-group row">
                                <label class="col-sm-3 form-control-label">IMO Number</label>
                                <div class="col-sm-9 pl-0">
                                    <input id="imo-number" type="text" placeholder="imo number" class="form-control form-control-warning">
                                </div>
                                </div>
                                <div class="form-group row">
                                <label class="col-sm-3 form-control-label">Destination</label>
                                <div class="col-sm-9 pl-0">
                                    <input id="destination" type="text" placeholder="destination" class="form-control form-control-warning">
                                </div>
                                </div>
                                
                            </div>
                            
                        </div>

                        <hr>

                        <div class="form-group row">       
                            <div class="col-sm-9 offset-sm-3">
                                <button id="btn-update-shipping-info" class="btn btn-primary float-right ml-2"> Update </button>
                                <button id="btn-cancel-shipping-info" class="btn btn-primary float-right" data-toggle="collapse" href="#updateShipping-id-{{=order.orderId}}" 
                                        role="button" aria-expanded="false" aria-controls="updateShipping-id-{{=order.orderId}}"> Cancel </button>
                            </div>
                        </div>

                        <hr>
            
                </div>


                <div class = "row no-gutters">
                    <div class = "col-8">
                        <strong> Address <i class="fa fa-address-book-o" aria-hidden="true"></i> </strong> :  {{=order.shippingAddress.address.address}} 
                    </div>
                    <div class = "col-4">
                        <strong> Zipcode <i class="fa fa-home" aria-hidden="true"></i>: </strong>  {{=order.shippingAddress.address.zipCode}} 
                    </div>
                </div>
                <div class = "row no-gutters">
                    <div class = "col-8">
                        <strong> Country <i class="fa fa-globe" aria-hidden="true"></i> : </strong> {{=order.shippingAddress.address.country}}
                    </div>
                    <div class = "col-4">
                        <strong> City <i class="fa fa-map" aria-hidden="true"></i> : </strong> {{=order.shippingAddress.address.city}}
                    </div>
                </div>
                <div class = "row no-gutters">
                    <div class = "col-8">
                        <strong> Shipment status : </strong>  
                        
                        {{ if (order.shipping.shipmentStatus == 'ON_CARGO_SHIP') { }}
                            <span id = "shipmentStatus">On Cargo Ship <i class="fa fa-ship" aria-hidden="true"></i></span>
                        {{  } else if (order.shipping.shipmentStatus == 'ON_TRUCK') { }}
                            <span id = "shipmentStatus">On Truck <i class="fa fa-truck" aria-hidden="true"></i></span>
                        {{ } }}
                    </div>
                    <div class = "col-4">
                        <strong> Your Phone number <i class="fa fa-mobile-phone" aria-hidden="true"></i> :</strong>  (+{{=order.shippingAddress.contact.countryCode}}) {{=order.shippingAddress.contact.phoneNumber}} 
                    </div>
                </div>
                <div class = "row no-gutters">
                    <div class = "col-8">
                        <strong> Departure : </strong>  <span id = "departureDate">{{=order.shipping.departureDate}}</span>
                    </div>
                    <div class = "col-4">
                        <strong> Arrival : </strong> <span id = "arrivalDate">{{=order.shipping.arrivalDate}}</span>
                    </div>
                </div>

                <br />

                {{ if (order.shipping.shipmentStatus == 'ON_CARGO_SHIP') { }}

                    <div>
                        <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                            data-toggle="collapse" href="#vesselStatusCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="{{=order.orderId}}" style = "cursor: pointer;"></i>
                        <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
                        <span class = "float-right" style = "font-size: 14px;">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
                        </span>
                    </div>

                    <hr class = "mt-1" />

                    <div class="collapse" id="vesselStatusCollapseItem-id-{{=order.orderId}}">

                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> Vessel name: </strong> <span id = "vesselName">{{=order.shipping.vesselStatus.vesselName}}</span> 
                            </div>
                            <div class = "col-4">
                                <strong> IMO Number: </strong> <span id = "imoNumber">{{=order.shipping.vesselStatus.imoNumber}}</span>
                            </div>
                        </div>

                        <div class = "row no-gutters">
                            <div class = "col-8">
                                <strong> MMSI Number: </strong> <span id = "mmsiNumber">{{=order.shipping.vesselStatus.mmsiNumber}}</span> 
                            </div>
                                <div class = "col-4">
                                <strong> Destination: </strong> <span id = "destination">{{=order.shipping.vesselStatus.destination}}</span>
                            </div>
                            
                        </div>

                        

                        <hr class = "mt-1" />

                        <div class = "row">

                            <div class = "col shipTrackingMap">

                            </div>


                        </div>

                    </div>

                {{ } }}

            </div>

            <div>
                <i class="fa fa-chevron-circle-down fa-lg mr-1 collapsed" aria-hidden="true" data-toggle="collapse" href="#shippingLogCollapseItem-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="shippingLogCollapseItem-id-{{=order.orderId}}" style="cursor: pointer;"></i>
                <span class="h5-responsive"> <strong> Shipping Log </strong> </span>
                <span class = "float-right" style = "font-size: 14px;">
                    
                    <a class = "blue-text" id = "updateShippingLog"
                        data-toggle="collapse" href="#addShippingLog-id-{{=order.orderId}}" role="button" aria-expanded="false" aria-controls="addShippingLog-id-{{=order.orderId}}"> Update Shipping Log </a>
                    <i class="fa fa-refresh ml-1" aria-hidden="true"></i>
                </span>
            </div>

            <hr class="mt-1">

            <div class="collapse.show multi-collapse collapse" id="shippingLogCollapseItem-id-{{=order.orderId}}" style="">

                <div class="collapse" id="addShippingLog-id-{{=order.orderId}}" style="">
                    <p class="mb-1"> <strong> Update shipping log  <i class="fa fa-refresh ml-1" aria-hidden="true"></i> </strong> 
                    <strong> <span id = "errorMessage" class="float-right text-red" style = "display: none;"> *error</span> </strong> </p>
                    
                    <hr class="mt-1">
                    
                    <div class="form-horizontal">
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label"> Header:</label>
                            <div class="col-sm-10">
                                <input id="shippingLogHeader" type="text" placeholder="Header" class="form-control form-control-success">
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label"> Description:</label>
                            <div class="col-sm-10">
                                <textarea id="shippingLogDescription" class="form-control" rows="3" cols="103" placeholder="Description"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label"> Address:</label>
                            <div class="col-sm-10">
                                <textarea id="shippingLogAddress" class="form-control" rows="3" cols="103" placeholder="Address"></textarea>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label"> Date:</label>
                            <div class="col-sm-10">
                                <input id="shippingLogDatePicker" type="text" placeholder = "Date" class="form-control form-control-success">
                            </div>
                        </div>
                                    
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label"> Time:</label>
                            <div class="col-sm-10">
                                <input id="shippingLogTimePicker" type="text" placeholder = "Time" class="form-control form-control-success">
                            </div>
                        </div>
                    
                        <hr class="mt-1">
                    
                        <div class="form-group row">       
                            <div class="col-sm-9 offset-sm-3">
                                <button id = "btn-update-shipping-log" class="btn btn-primary float-right ml-2"> Update </button>
                                <button id = "btn-cancel-shipping-log" class="btn btn-primary float-right"> Cancel </button>
                            </div>
                        </div>

                        <hr class="mt-1">
                    
                    </div>

                </div>

                <div class="list-group" style = "max-height: 286px; overflow-y: auto;">

                    <div class="row">
                        <div class="mx-auto mt-2">
                            <h5> No shipping logs here </h5>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div>

</script>

<script id = "vesselStatusDivTemplate" type = "text/template">
    
    <div>
        <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
            data-toggle="collapse" href="#vesselStatusCollapseItem-id-{{=orderId}}" role="button" aria-expanded="false" aria-controls="vesselStatusCollapseItem-id-{{=orderId}}" style = "cursor: pointer;"></i>
        <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
        <span class = "float-right" style = "font-size: 14px;">
            <i class="fa fa-map-marker" aria-hidden="true"></i>
            <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
        </span>
    </div>

    <hr class = "mt-1" />

    <div class="collapse" id="vesselStatusCollapseItem-id-{{=orderId}}">

        <div class = "row no-gutters">
            <div class = "col-8">
                <strong> Vessel name: </strong> <span id = "vesselName">{{=vesselName}}</span> 
            </div>
            <div class = "col-4">
                <strong> IMO Number: </strong> <span id = "imoNumber">{{=imoNumber}}</span>
            </div>
        </div>

        <div class = "row no-gutters">
            <div class = "col-8">
                <strong> MMSI Number: </strong> <span id = "mmsiNumber">{{=mmsiNumber}}</span> 
            </div>
                <div class = "col-4">
                <strong> Destination: </strong> <span id = "destination">{{=destination}}</span> 
            </div>
            
        </div>

        <hr class = "mt-1" />

        <div class = "row">

            <div class = "col shipTrackingMap">

            </div>


        </div>

    </div>
</script>

<script id = "shipMapTrackingTemplate" type = "text/template">
    <iframe name="marinetraffic" id="marinetraffic" width="100%" height="450" scrolling="no" frameborder="0"
            src="http://www.marinetraffic.com/en/ais/embed/zoom:5/centery:37.446/centerx:24.9467/maptype:1/shownames:true/mmsi:{{=mmsi}}/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false">
            Browser does not support embedded objects.&lt;br/&gt;Visit directly &lt;a href="http://www.marinetraffic.com/"&gt;www.marinetraffic.com&lt;/a&gt;
    </iframe> 
</script>

<script id = "shippingLogItemTemplate" type = "text/template">
    <span class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <input type="hidden" value="{{=shippingLogId}}" id="shippingDeleteId">
        <h5 class="mb-1">{{=header}}<small> ({{=date}} - {{=time}})</small></h5>
        <button type="button" class="close delete-shipping-log" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                </button>
        </div>
        <p class="mb-1">{{=description}}</p>
        <small>{{=address}}</small>
    </span>
</script>

<script id = "collapsingInventoryProductTemplate" type = "text/template"> 
    <div class = "row slider pt-2 pb-2 pl-1 pr-1">
            <div class = "col-lg-4">


            <div class="tab-content">
                <div class="tab-pane active" id="img{{=productImageId1}}" role="tabpanel">
                    <img src = "/FBExportSystem{{=productImageLink1}}" width = "290" height = "200" />
                </div>
                <div class="tab-pane" id="img{{=productImageId2}}" role="tabpanel">
                    <img src = "/FBExportSystem{{=productImageLink2}}" width = "290" height = "200" />
                </div>
                <div class="tab-pane" id="img{{=productImageId3}}" role="tabpanel">
                    <img src = "/FBExportSystem{{=productImageLink3}}" width = "290" height = "200" />
                </div>
                <div class="tab-pane" id="img{{=productImageId4}}" role="tabpanel">
                    <img src = "/FBExportSystem{{=productImageLink4}}" width = "290" height = "200" />
                </div>
            </div>

            <ul class="nav mt-1" role="tablist">
                <li class="nav-item">
                    <a class="active pr-1" data-toggle="tab" href="#img{{=productImageId1}}" role="tab">
                        <img src = "/FBExportSystem{{=productImageLink1}}" width = "70" height = "70" />
                    </a>
                </li>
                <li class="nav-item">
                    <a class="pr-1" data-toggle="tab" href="#img{{=productImageId2}}" role="tab">
                        <img src =  "/FBExportSystem{{=productImageLink2}}" width = "70" height = "70" />
                </a>
                </li>
                <li class="nav-item">
                    <a class="pr-1" data-toggle="tab" href="#img{{=productImageId3}}" role="tab">
                        <img src = "/FBExportSystem{{=productImageLink3}}" width = "70" height = "70" />
                    </a>
                </li>
                <li class="nav-item">
                    <a data-toggle="tab" href="#img{{=productImageId4}}" role="tab">
                        <img src = "/FBExportSystem{{=productImageLink4}}" width = "70" height = "70" />
                    </a>
                </li>

            </ul>
        </div>

        <div class = "col-lg-8">
            <h5>
                Description: {{=name}}
                <span class = "float-right"> Origin: {{=origin}} </span>
            </h5>
            <hr class = "mt-0 mb-2" />

            <p class = "text-justify">
            - {{=productDescription}}
            </p>

            <hr class = "mt-0 mb-2"/>

            <ul class = "list-unstyled">
                <li class = "mb-1"> <strong> Supplier: </strong> {{=supplier}} </li>
                <li class = "mb-1"> <strong> Supplier Contact number: </strong> {{=supplierContactNumber}} </li>
                <li class = "mb-1"> <strong> Supplier Address: </strong> {{=supplierAddress}} </li>
                <li class = "mb-1"> <strong> Date of delivery: </strong> {{=dateOfDelivery}}  </li>
            </ul>

            <br />
            
            {{ if (status == "POSTED" || status == 'OUT_OF_STOCK') { }}
                <button type="button" class="btn bg-dark text-white float-right mr-1 btn-post-unpost">Unpost <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>
            {{ } else if (status == "UNPOSTED") { }}
                <button type="button" class="btn bg-green float-right mr-1 btn-post-unpost">Post <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>	
            {{ } }}

            <a class="btn bg-blue float-right mr-1" href = "{{=editAddressLink}}">Edit <i class="fa fa-pencil" aria-hidden="true"></i> </a>
            <button type="button" class="btn bg-red float-right mr-1 btn-delete">Delete <i class="fa fa-trash" aria-hidden="true"></i> </button>
        </div>
    </div>
</script>

<script id = "collapsingInventoryProductTemplatePosted" type = "text/template"> 
    <div class = "row slider pt-2 pb-2 pl-1 pr-1">
    <div class = "col-lg-4">


        <div class="tab-content">
        <div class="tab-pane active" id="img1" role="tabpanel">
            <img src = "img/bg.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img2" role="tabpanel">
            <img src = "img/project-1.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img3" role="tabpanel">
                <img src = "img/project-2.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img4" role="tabpanel">
            <img src = "img/project-3.jpg" width = "290" height = "200" />
        </div>
        </div>

        <ul class="nav mt-1" role="tablist">
        <li class="nav-item">
            <a class="active pr-1" data-toggle="tab" href="#img1" role="tab">
            <img src = "img/bg.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img2" role="tab">
                <img src =  "img/project-1.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img3" role="tab">
                <img src = "img/project-2.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a data-toggle="tab" href="#img4" role="tab">
                <img src = "img/project-3.jpg" width = "70" height = "70" />
            </a>
        </li>

        </ul>
    </div>
    <div class = "col-lg-8">
        <h5>
        Description: Lapu Lapu
        <span class = "float-right"> Origin: Leyte </span>
        </h5>
        <hr class = "mt-0 mb-2" />

        <p class = "text-justify">
        - In JSP, java code can be written inside the jsp page using the scriptlet tag. Let's see what are the scripting elements first.
        </p>

        <hr class = "mt-0 mb-2"/>

        <ul class = "list-unstyled">
        <li class = "mb-1"> <strong> Supplier: </strong> Harmonyssss </li>
        <li class = "mb-1"> <strong> Supplier Contact number: </strong> 09151828105 </li>
        <li class = "mb-1"> <strong> Supplier Address: </strong> 1700 blk 7 saint joseph subd pulanglupa 2 las pinas city </li>
        <li class = "mb-1"> <strong> Date of delivery: </strong> May 12 1988  </li>
        </ul>

        <br />

        <button type="button" class="btn bg-green float-right mr-1">Post <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>
        <button type="button" class="btn bg-blue float-right mr-1">Edit <i class="fa fa-pencil" aria-hidden="true"></i> </button>
        <button type="button" class="btn bg-red float-right mr-1">Delete <i class="fa fa-trash" aria-hidden="true"></i> </button>
    </div>
    </div>
</script>

<script id = "collapsingInventoryProductTemplateUnposted" type = "text/template">
    <div class = "row slider pt-2 pb-2 pl-1 pr-1">
    <div class = "col-lg-4">


        <div class="tab-content">
        <div class="tab-pane active" id="img1" role="tabpanel">
            <img src = "/FBExportSystem/resources/admin/img/bg.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img2" role="tabpanel">
            <img src = "/FBExportSystem/resources/admin/img/project-1.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img3" role="tabpanel">
                <img src = "/FBExportSystem/resources/admin/img/project-2.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img4" role="tabpanel">
            <img src = "/FBExportSystem/resources/admin/img/project-3.jpg" width = "290" height = "200" />
        </div>
        </div>

        <ul class="nav mt-1" role="tablist">
        <li class="nav-item">
            <a class="active pr-1" data-toggle="tab" href="#img1" role="tab">
            <img src = "/FBExportSystem/resources/admin/img/bg.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img2" role="tab">
                <img src =  "/FBExportSystem/resources/admin/img/project-1.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img3" role="tab">
                <img src = "/FBExportSystem/resources/admin/img/project-2.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a data-toggle="tab" href="#img4" role="tab">
                <img src = "/FBExportSystem/resources/admin/img/project-3.jpg" width = "70" height = "70" />
            </a>
        </li>

        </ul>
    </div>
    <div class = "col-lg-8">
        <h5>
        Description: Lapu Lapu
        <span class = "float-right"> Origin: Leyte </span>
        </h5>
        <hr class = "mt-0 mb-2" />

        <p class = "text-justify">
        - In JSP, java code can be written inside the jsp page using the scriptlet tag. Let's see what are the scripting elements first.
        </p>

        <hr class = "mt-0 mb-2"/>

        <ul class = "list-unstyled">
        <li class = "mb-1"> <strong> Supplier: </strong> Harmonyssss </li>
        <li class = "mb-1"> <strong> Supplier Contact number: </strong> 09151828105 </li>
        <li class = "mb-1"> <strong> Supplier Address: </strong> 1700 blk 7 saint joseph subd pulanglupa 2 las pinas city </li>
        <li class = "mb-1"> <strong> Date of delivery: </strong> May 12 1988  </li>
        </ul>

        <br />

        <button type="button" class="btn bg-dark text-white float-right mr-1">Unpost <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>
        <button type="button" class="btn bg-blue float-right mr-1">Edit <i class="fa fa-pencil" aria-hidden="true"></i> </button>
        <button type="button" class="btn bg-red float-right mr-1">Delete <i class="fa fa-trash" aria-hidden="true"></i> </button>
    </div>
    </div>
</script>

<script id = "collapsingClientTableMoreInformation" type="text/template">

    <div class = "row showMoreInfoSlider pt-2 pb-2 pl-1 pr-1">
        <div class = "col-lg-4">
        <h3>Customer's Activities</h3>
        <table id="user-activity-table" class="table table-striped table-bordered" style="background-color: white;" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Customer's Activity</th>
					<th>Description</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                	<th>Customer's Activity</th>
					<th>Description</th>
                	<th>Date</th>
                </tr>
            </tfoot>
            <tbody>
				
            </tbody>
            </table>

        </div>
    </div>

    


</script>

<script id = "collapsingEmployeeTableMoreInformation" type="text/template">

    <div class = "row showMoreInfoSlider pt-2 pb-2 pl-1 pr-1">
        <div class = "col-lg-4">
        <h3>Employee's Activities</h3>
        <table id="employee-activity-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Employee's Activity</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                <th>Employee's Activity</th>
                <th>Date</th>
                <th>Time</th>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>Bought products</td>
                    <td>January 29, 2018</td>
                    <td>13:30:35</td>
                </tr>
            </tbody>
            </table>

        </div>
    </div>
    </div>

    <!--Pagination -->
    <nav class="my-4 ">
        <ul class="pagination pagination-circle pg-blue mb-0">

            <!--First-->
            <li class="page-item disabled"><a class="page-link">First</a></li>

            <!--Arrow left-->
            <li class="page-item disabled">
                <a class="page-link" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>

            <!--Numbers-->
            <li class="page-item active"><a class="page-link">1</a></li>
            <li class="page-item"><a class="page-link">2</a></li>
            <li class="page-item"><a class="page-link">3</a></li>
            <li class="page-item"><a class="page-link">4</a></li>
            <li class="page-item"><a class="page-link">5</a></li>

            <!--Arrow right-->
            <li class="page-item">
                <a class="page-link" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>

            <!--First-->
            <li class="page-item"><a class="page-link">Last</a></li>

        </ul>
    </nav>
    <!--/Pagination -->


</script>
<script type="text/template" id="qq-template">
    <div class="qq-uploader-selector qq-uploader qq-gallery" qq-drop-area-text="Drop files here">
        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
        </div>
        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span class="qq-upload-drop-area-text-selector"></span>
        </div>
        <div class="qq-upload-button-selector qq-upload-button">
            <div>Upload a file</div>
        </div>
        <span class="qq-drop-processing-selector qq-drop-processing">
            <span>Processing dropped files...</span>
            <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
        </span>
        <ul class="qq-upload-list-selector qq-upload-list" role="region" aria-live="polite" aria-relevant="additions removals">
            <li>
                <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                <div class="qq-progress-bar-container-selector qq-progress-bar-container">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>
                <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                <div class="qq-thumbnail-wrapper">
                    <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale>
                </div>
                <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
                <button type="button" class="qq-upload-retry-selector qq-upload-retry">
                    <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>
                    Retry
                </button>

                <div class="qq-file-info">
                    <div class="qq-file-name">
                        <span class="qq-upload-file-selector qq-upload-file"></span>
                        <span class="qq-edit-filename-icon-selector qq-btn qq-edit-filename-icon" aria-label="Edit filename"></span>
                    </div>
                    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">
                        <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause">
                        <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue">
                        <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
                    </button>
                </div>
            </li>
        </ul>

        <dialog class="qq-alert-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">Close</button>
            </div>
        </dialog>

        <dialog class="qq-confirm-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">No</button>
                <button type="button" class="qq-ok-button-selector">Yes</button>
            </div>
        </dialog>

        <dialog class="qq-prompt-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <input type="text">
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">Cancel</button>
                <button type="button" class="qq-ok-button-selector">Ok</button>
            </div>
        </dialog>
    </div>
</script>

<script id = "filterLoaderTemplate" type = "text/template">
	<tr class = "odd filter-loader">
		<td colspan = "11" valign="top" colspan="11" class="text-center">
			<span> Filtering </span> <img class = "ml-2" src = "/FBExportSystem/resources/admin/img/loader.gif" width = "50" height = "50" /> 
	    </td>
	</tr>
</script>

<script id = "rowProductTemplate" type = "text/template">
	 <tr>
	
	                            <td></td>
	                            <td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>
	                            <td>{{=id}}</td>
	                            <td>{{=name}}</td>
	                            <td>{{=origin}}</td>
	                            <td>{{=supplier}}</td>
	                            <td>{{=price}}</td>
	                            <td>{{=weight}}</td>
	                            <td>{{=dateRegistered}}</td>
	                            <td>{{=expiredDate}}</td>
	                            <td>{{=status}}
								</td>
	
	  </tr>
</script>

