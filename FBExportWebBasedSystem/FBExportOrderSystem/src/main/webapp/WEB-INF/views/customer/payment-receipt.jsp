<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

 <div class="container mt-4 wow fadeIn" id="printButton">
 			<a href="<c:url value = '/order-list' />" class = "float-left" onclick="printlayer()"><i class="fa fa-arrow-left ml-2" aria-hidden="true"></i> Back to order list</a>
            <a href="javascript:void(0)" class = "float-right" onclick="printlayer()"><i class="fa fa-print ml-2" aria-hidden="true"></i> Print Receipt</a>
 </div>
 
 <br />

        <div id="printableArea" style="margin-bottom: 100px;">

            <div class = "container">
            
            	<hr>

                <h5 class = "h5-responsive mt-4 wow fadeIn"> <strong> Payment Receipt </strong></h5>

                <hr>

                <div class="row justify-content-between">
                    <div class="col-md-4">
                        <h4 class = "h4-responsive wow fadeIn"> Fong Bros International Corporation </h4>
                        <h6 class = "h6-responsive wow fadeIn"> 9474 A Alejandro St Paranaque City <br> Metro Manila, Philippines </h6>
                    </div>
                    <div class="col-md-4">
                        <h6 class = "h6-responsive  wow fadeIn ">
                          <b>Date:</b> <fmt:formatDate value = "${order.datePaid}" type = "date" dateStyle = "LONG" /> <br>
                          <b>Order id: </b> ${order.orderId} 
                        </h6>
                    </div>
                </div>

                <hr>
                <h6 class = "h6-responsive">
                  <b>Bill To: ${order.customer.firstname} ${order.customer.middlename} ${order.customer.lastname}</b> 
                </h6>
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
                            Total Due
                          </th>
                          <td>
                            ${order.totalPrice} PHP<br>
                            0<br>
                            0%<br>
                            ${order.totalPrice} PHP
                          </td>
                        </tr>

                    </tbody>
                    <!--Table body-->
                </table>
                <!--Table-->
                
                <hr>

              </div>
            </div>