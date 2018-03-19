<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container mt-4">
    <div class = "row">
        <div class = "col">
            <h4>
                Hi ${order.customer.firstname}! Thank you Your order has been placed
                <i class="fa fa-check ml-2" aria-hidden="true"></i>
            </h4>
            <hr />
        </div>
    </div>

    <div class = "row">

        <div class = "col-md-4">

            <div class = "row" style = "border: 1px solid #E5E5E5;">

                <h6 class = "pt-3 pl-3 pb-2 font-weight-bold">
                    Order Summary <i class="fa fa-shopping-cart mr-2" aria-hidden="true"></i> (${fn:length(order.cart.items)} items)
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
                        
                        	<c:forEach var = "cartItem" items = "${order.cart.items}">
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
								<span> Sub total: <span class="subTotal">${subTotal}</span> <span class="subTotalCurrency">PHP</span> </span> <br />
								<span> Taxable: ${taxable} </span> <br />
							</div>
							<div class = "col-md-6">
								<span> Tax Rate: ${taxRate}% </span> <br />
								<span> Shipping fee: <span class = "shippingFee">${shippingFee}</span> <span class="shippingFeeCurrency">PHP</span> </span> <br />
			                    <span> Total Due: <span class="totalDue">${totalDue}</span> <span class="totalDueCurrency">PHP</span> </span>
		                    </div>
	                    </div>
	                </div>

                </div>

            </div>

        </div>
        
        <div class = "col-md-8 order-md-first">
            
            <h5> <strong> Your order # is: ${order.orderId} </strong> </h5>
            
            <p class = "small"> Your order has been placed in your <a href = "<c:url value = '/order-list' />"> order lists </a> page. see your <a href = "<c:url value = '/order-list' />"> order lists </a> <br /> page to check your order status. thank you for ordering. </p>

            <h5> <strong> This order will be shipped to <i class="fa fa-truck ml-2" aria-hidden="true"></i> </strong> </h5>

            <ul class="list-unstyled small">
                
                <li>${order.shippingAddress.receiverFullName} (${order.shippingAddress.addressType}'s address)</li>
                <li>${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address}</li>
                <li>${order.shippingAddress.address.city}, ${order.shippingAddress.address.country}</li>
                <li>(+${order.shippingAddress.contact.countryCode}) ${order.shippingAddress.contact.phoneNumber} </li>
                
            </ul>

            <h5> <strong> Date ordered <i class="fa fa-calendar ml-2" aria-hidden="true"></i> </strong> </h5>
            <p> <fmt:formatDate value = "${order.dateOrdered}" dateStyle = "LONG" type = "date" /> </p>

            <h5> <strong> Payment method <i class="fa fa-money ml-2" aria-hidden="true"></i> </strong> </h5>
            <p> ${ (order.paymentMethod eq 'CASH_ON_DELIVERY') ? 'Cash on delivery <i class="fa fa-truck" aria-hidden="true"></i>' :
            													 'Paypal <i class="fa fa-paypal" aria-hidden="true"></i>' } </p>

            <a href = "<c:url value = '/' />" class="btn btn-primary float-right"> Continue </a>
            
        </div>

    </div>
    <hr />
</div>  