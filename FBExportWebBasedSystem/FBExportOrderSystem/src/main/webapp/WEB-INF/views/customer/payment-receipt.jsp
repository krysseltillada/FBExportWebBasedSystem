<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

 <div class="container mt-4 wow fadeIn" id="printButton" style = "padding-left: 15%; padding-right: 15%;">
 			<a href="<c:url value = '/order-list' />" class = "float-left" onclick="printlayer()"><i class="fa fa-arrow-left ml-2" aria-hidden="true"></i> Back to order list</a>
            <a href="javascript:void(0)" class = "float-right" onclick="printlayer()"><i class="fa fa-print ml-2" aria-hidden="true"></i> Print Receipt</a>
 </div>
 
 <br />

        <div id="printableArea" style="margin-bottom: 100px;">

            <div class = "container mt-4" style = "padding-left: 15%; padding-right: 15%;">
            
            	<hr>

                <h5 class = "h5-responsive mt-4 wow fadeIn"> <strong> Payment Receipt </strong></h5>

                <hr>

                <div class="row justify-content-between">
                    <div class="col-md-6">
                        <h5 class = "h5-responsive wow fadeIn"> 
                        <img class="mr-1" src="/FBExportSystem/resources/company-logo.png" width="30" height="30">
                        Fong Bros International Corporation </h5>
                        <h6 class = "h6-responsive wow fadeIn"> 9474 A Alejandro St Paranaque City <br> Metro Manila, Philippines </h6>
                    </div>
                    <div class="col-md-5">
                        <ul class="list-unstyled">
		                    <li> <b>Transaction Date:</b> <fmt:formatDate value = "${order.datePaid}" type = "date" dateStyle = "LONG" /> </li>
							<li><b>Order#: </b> ${order.orderId}  </li>
						</ul>
                    </div>
                </div>

                <hr>
                
                <div class="row justify-content-between">
                    <div class="col-md-5">

	                    <ul class="list-unstyled">
		                    <li> <b>Bill To </b> </li>
							<li> ${order.customer.firstname} ${order.customer.middlename} ${order.customer.lastname} </li>
							<li> ${billToShippingAddress.address.zipCode} ${billToShippingAddress.address.address} ${billToShippingAddress.address.city} ${billToShippingAddress.address.country}</li>
						</ul>
						
						
                    
                    </div>
                    <div class = "col-md-5">
                    	 <ul class="list-unstyled">
		                    <li> <b>Shipping To </b> </li>
							<li> ${order.shippingAddress.receiverFullName} </li>
							<li> ${order.shippingAddress.address.zipCode} ${order.shippingAddress.address.address} ${order.shippingAddress.address.city} ${order.shippingAddress.address.country}</li>
						</ul>
                    </div>
                  
                </div>
                <hr>


                <!--Table-->
                <table class="table wow fadeIn">

                    <!--Table head-->
                    <thead class="blue-grey lighten-4">
                        <tr>
                            <th>#</th>
                            <th>Product</th>
                            <th>Weight</th>
                            <th>Weight type </th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <!--Table head-->

                    <!--Table body-->
                    <tbody>
                    
                    	<c:forEach var = "item" items = "${order.cart.items}">
	                        <tr>
	                            <th scope="row">1</th>
	                            <td>${item.product.name} <img class = "ml-2" src = "<c:url value = '${item.product.productImageLink}' />" width = "30" height = "30"/></td>
	                            <td><fmt:formatNumber value = "${item.weight.weight}" maxFractionDigits = "2" /></td>
	                            <td>${item.weight.weightType}</td>
	                            <td>${item.price} PHP</td>
	                        </tr>
                        </c:forEach>

                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <th>
                            SubTotal<br>
                            Taxable<br>
                            Tax Rate<br>
                            Shipping fee <br>
                            Total Due
                          </th>
                          <td>
                            ${subTotal} PHP<br>
                            0<br>
                            0%<br>
                            1000 PHP <br>
                            ${order.totalPrice} PHP
                          </td>
                        </tr>

                    </tbody>
                    <!--Table body-->
                </table>
                <!--Table-->
                
                <hr>
                
		                  <small>Contact Info <br />  
		                  Tel. no: + 01 234 567 89 <br />
		                  Email: fongbrosinc@gmail.com </small>
              </div>
            </div>