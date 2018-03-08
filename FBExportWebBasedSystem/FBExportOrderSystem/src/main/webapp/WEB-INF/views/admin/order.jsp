<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">
        <div class = "row">
            <div class = "col-lg">
                <span class="h3 no-margin-bottom mr-2">Orders</span>
                <span class = "small ml-2 float-right"> <a href = "javascript:void(0)" id = "deleteProduct" class = "text-muted" style = "cursor: not-allowed;"> Delete order <i class="fa fa-trash ml-1" aria-hidden="true"></i> </a> </span>
                <span class = "small float-right"> <a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> Filter Orders <i class="fa fa-filter ml-1" aria-hidden="true"></i> </a> </span>
            </div>
        </div>
    </div>
</header>

<section class = "no-padding-top p-0">
    <div class = "container-fluid p-0">
        <div class="collapse" id="collapseExample">

            <div class = "row">

                <div class = "col-lg-12 p-0 m-0">
                    <div class = "card m-0">
                        <div class = "card-body pt-3 pb-3">

                            <form class="form-inline ml-2 small">
                            
                                <label class="mr-sm-2" for="inlineFormCustomSelect">Status: </label>
                                
                                <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 115px;">
                                    <option selected> All </option>
                                    <option>Pending</option>
                                    <option value="1">Approved</option>
                                    <option value="2">Reject</option>
                                    <option value="3">To Ship</option>
                                    <option value="3">Received</option>
                                </select>

                                <label class="mr-sm-2" for="inlineFormCustomSelect">Shipment: </label>
                                
                                <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 135px;">
                                    <option selected> All </option>
                                    <option value="1">On Cargo Ship</option>
                                    <option value="2">On Truck</option>
                                </select>

                                <label class="mr-sm-2" for="inlineFormCustomSelect">Payment: </label>
                                
                                <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 150px;">
                                    <option selected>All</option>
                                    <option>Cash on delivery</option>
                                    <option>Paypal</option>    
                                </select>

                                <label class="mr-sm-2" for="inlineFormCustomSelect">Sort by: </label>
                                
                                <select class="custom-select mb-2 mr-sm-1 mb-sm-0" id="inlineFormCustomSelect" style = "width: 140px;">
                                    <option selected>Order No </option>
                                    <option value="1">Date ordered</option>
                                    <option value="1">Receive date</option>
                                    <option value="2">Customer</option>
                                    <option value="3">Price</option>
                                    <option value="3">Weight</option>
                                    <option value="3">Items</option>
                                </select>

                                <select class="custom-select mb-2 mb-sm-0" id="inlineFormCustomSelect" style = "width: 120px;">
                                    <option selected>Unsorted </option>
                                    <option>Ascending </option>
                                    <option value="1">Descending</option>
                                </select>
                            

                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class = "row">
            <div class = "col-lg">
                <div class = "card mb-0">
                    <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">
                        <table id="orderTable" class="table table-sm" cellspacing="0" width="100%" style = "border-bottom: 1px solid #E9ECEF;">
                            <thead>
                                <tr>
                                    <th> <input type="checkbox" value="" class="checkbox-template checkbox-delete" id = "checkbox-all"> </th>
                                    <th> </th>
                                    <th> Order <i class="fa fa-list-alt ml-1" aria-hidden="true"></i></th>
                                    <th> Status <i class="fa fa-tasks ml-1" aria-hidden="true"></i> </th>
                                    <th> Shipping Address <i class="fa fa-address-card ml-1" aria-hidden="true"></i></th>
                                    <th> Total <i class="fa fa-box ml-1" aria-hidden="true"></i></th>
                                    <th> Date <i class="fa fa-calendar-alt" aria-hidden="true"></i></th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th> </th>
                                    <th> Order <i class="fa fa-list-alt ml-1" aria-hidden="true"></i></th>
                                    <th> Status <i class="fa fa-tasks ml-1" aria-hidden="true"></i> </th>
                                    <th> Shipping Address <i class="fa fa-address-card ml-1" aria-hidden="true"></i></th>
                                    <th> Total <i class="fa fa-box ml-1" aria-hidden="true"></i></th>
                                    <th> Date <i class="fa fa-calendar-alt" aria-hidden="true"></i></th>
                                </tr>
                            </tfoot>
                            <tbody>
                            	
                            	<c:forEach var = "order" items = "${orderList}">
	                                <tr>
	
	                                    <td></td>
	                                    <td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>
	                                    <td>
	                                        <h3> 
	                                        	<span class="badge badge-success p-1">Order# <span id = "orderId">${order.orderId}</span> </span> 
	                                        	<input id = "orderId-${order.orderId}" type = "hidden" />
	                                        	</h3>
	                                        <span style = "font-size: 13px;">
	                                            <strong> by: </strong> <strong> <a href = "#"> ${order.customer.firstname} ${order.customer.middlename} ${order.customer.lastname} </a> </strong>
	                                            <br />
	                                            <strong> Payment: </strong> ${ (order.paymentMethod eq 'CASH_ON_DELIVERY') ? 'Cash on delivery <i class="fa fa-truck ml-1" aria-hidden="true"></i>' :
	                                            																			 'Paypal <i class="fa fa-paypal ml-1" aria-hidden="true"></i>'}
	                                        </span>
	                                    </td>
	                                    <td> 
	
	                                        <div style = "font-size: 13px;">
	                                            <strong> Order: </strong> 
	                                        
	                                            <h6>                                             
	                                                <div class="btn-group dropdown-select">
	                                                    <button type="button" 
	                                                    		style = "background-color: ${orderStatusColorMap[order.orderStatus]};" 
	                                                    		class="btn btn-sm text-white dropdown-toggle" 
	                                                    		data-toggle="dropdown" 
	                                                    		aria-haspopup="true" 
	                                                    		aria-expanded="false">
	                                                    		${orderStatusMessageMap[order.orderStatus]}
	                                                    </button>
	                                                    <div class="dropdown-menu">
	                                                    <h6 class="dropdown-header">Mark as</h6>
	                                                    
	                                                    </div>
	                                                </div>
	                                            </h6>
	
	
	                                            <strong> Shipment: </strong> <br />
	                                            <c:choose>
	                                            	<c:when test = "${not empty order.shipping}">
	                                            		<c:choose>
	                                            			<c:when test = "${order.shipping.shipmentStatus eq 'ON_CARGO_SHIP'}">
	                                            				<span id = "shipmentStatus">On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i></span>
	                                            			</c:when>
	                                            			<c:when test = "${order.shipping.shipmentStatus eq 'ON_TRUCK'}">
	                                            				<span id = "shipmentStatus">On Truck <i class="fa fa-truck ml-1" aria-hidden="true"></i></span>
	                                            			</c:when>
	                                            		</c:choose>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<span id = "shipmentStatus">Shipment status not defined.</span>
	                                            	</c:otherwise>
												</c:choose>
												
	                                        </div>
	
	                                    </td>
	                                    <td style = "max-width: 250px;">
	                                        <span style = "font-size: 14px;">
	                                            <strong> Receiver's name: </strong> 
	
	                                            <span style = "font-size: 12px;">
	                                            	${order.shippingAddress.receiverFullName}
	                                            </span>
	                                            <br/>
	                                            
	                                            <strong> Phone number: </strong> 
	                                            
	                                            <span style = "font-size: 12px;">
	                                            	(+${order.shippingAddress.contact.countryCode}) ${order.shippingAddress.contact.phoneNumber}
	                                            </span>
	                                            
	                                            <br/>
	                                            
	                                            <strong> Address <span style = "font-size: 12px;"> (${order.shippingAddress.addressType}) </span>:  
	                                            </strong> <br />
	                                            
	                                            <span style = "font-size: 12px;">
	                                            	${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}
	                                            </span>
	                                            
	                                            <br />
	                                            
	                                            <strong> Country <span style = "font-size: 12px;"> (City) </span>:  </strong> <br />
	                                            <span style = "font-size: 12px;">
	                                               	${order.shippingAddress.address.country}(${order.shippingAddress.address.city})
	                                            </span>
	                                        </span>
	
	                                        <br />
	                                    </td>
	                                    <td>
	
	                                        <span style = "font-size: 13px;"> 
	                                            <strong> Items: </strong> <br />
	                                                <span style = "font-size: 12px;">
	                                                	${order.totalItems} items
	                                                </span>
	                                            <br />
	
	                                            <strong> Weight: </strong> <br />
	                                            <span style = "font-size: 12px;">
	                                            	<fmt:formatNumber value = "${order.totalWeight}" maxFractionDigits="1" /> KILO 
	                                            </span> <br />
	
	                                            <strong> Price: </strong> <br />
	                                            <span style = "font-size: 12px;">
	                                            	<fmt:formatNumber value = "${order.totalPrice}" type = "currency" currencyCode="PHP" /> 
	                                            </span>
	                                        </span>
	
	                                    </td>
	
	                                    <td>
	
	                                        <span style = "font-size: 13px;"> 
	
	                                            <strong> Ordered: </strong> <br />
	                                            <span style = "font-size: 12px;">
	                                                <fmt:formatDate value = "${order.dateOrdered}" dateStyle = "LONG" type = "date" />
	                                            </span>
	                                            <br />
	
	                                            <strong> Expected: </strong> <br />
	                                            <span style = "font-size: 12px;">
	                                                <c:choose>
	                                                	<c:when test = "${not empty order.shipping}">
	                                                		<fmt:formatDate value="${order.shipping.expectedDate}" dateStyle="LONG" type="date"/>
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                		None
	                                                	</c:otherwise>
	                                                </c:choose>
	                                            </span>
	                                            <br />
	
	                                        </span>
	                                    
	                                    </td>
	                                    
	                                    
	                                
	                                    
	                                </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>  

<div id="toShipInformationModal" tabindex="-1" role="dialog" aria-labelledby="toShipInformationModalLabel" aria-hidden="true" class="modal fade text-left">
    <input type = "hidden" id = "orderModalId" value = "" />
    <div role="document" class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 id="toShipInformationModalLabel" class="modal-title">Ship to status information <i class="fa fa-ship ml-2" aria-hidden="true"></i> </h5>
            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">x</span></button>
        </div>
        <div class="modal-body">

            <h5> Shipping information </h5>
            <hr class = "mt-2" />

            <div class="form-group">
                <label>Shipment status: </label>
                <select id = "shipmentStatusComboBox" class="form-control">
	                <option disabled selected> shipment status </option> 
	                <option value = "On Cargo Ship">On Cargo Ship</option>
	                <option value = "On Truck">On Truck</option>
                </select>
                
            </div>
            <div class="form-group">
                
                <div class="form-group">
                   <label>Expected Date: </label>
                   <input id="expectedDatePicker" type="text" placeholder="Expected date" class="mr-2 form-control">
                </div>
                
            </div>
            <div class="form-group">       

				<label>Departure and arrival date: </label>
                <div class = "form-inline">
                    <div class="form-group">
                    	<input id="departureDatePicker" type="text" placeholder="Departure date" class="mr-2 form-control">
                    </div>
                    <div class="form-group">
                    	<input id="arrivalDatePicker" type="text" placeholder="Arrival date" class="form-control">
                    </div>
                </div>
                
            </div>
            
            <div class="collapse" id="vesselStatusCollapseDiv">
            
            	<h5> Vessel status </h5>
	            <hr class = "mt-2" />
	
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

        </div>
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
            <button type="button" class="btn btn-primary btn-save-to-ship-information">Save</button>
        </div>
        </div>
    </div>
</div>