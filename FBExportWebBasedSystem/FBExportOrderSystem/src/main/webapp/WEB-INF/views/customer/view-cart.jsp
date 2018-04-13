<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<div class = "container" style="margin-top: 40px;">
	<div class = "col">
            <header style = "margin-bottom: 10px;">
                <h1> <img class = "mr-1" src="<c:url value = '/resources/company-logo.png' />" width="50" height="50">
                 Shopping Cart </h1>
                <hr />
            </header>
        </div>
        
    <div class = "row mx-auto">

    <hr>

    <div id="shoppingModalCart-view-cart" tabindex="-1" role="dialog" aria-labelledby="shoppingCartModal" aria-hidden="true" style="width: 100%;">
	    <div>
	        <div class="modal-content">
	            <form action="<c:url value = '/update-view-cart' />" method="post" id="updateCart">
	            <div class="modal-header">
	            <div class="shopping-cart-header" style="margin-left:40px;">
	                <i class="fa fa-shopping-cart cart-icon"></i><span class="badge productCartHeaderItemCount-view-cart">0</span>
	            </div>
	
	            <div class="shopping-cart-total-view-cart" style="margin-right:40px;">
	                <span class="lighter-text">Total:</span>
	                <span class="main-color-text">0.00 PHP</span>
	            </div>
	
	            </div>
	           
	            <div class="modal-body" style = "max-height: 400px; overflow-y: auto; overflow-x: auto;">
	
	            <div class = "d-none" id = "productCartEmptyMessage-view-cart">
	                <p class="text-center p-5"> No products added. </p>
	            </div>
	            
	              <sql:query var="cartItems" 
	                            		   dataSource = "${dataSource}">
	                           	SELECT p.product_image_link, p.product_id, i.item_id, p.name, i.price, i.weight, i.weight_type FROM 
	                           		   (((Customer c INNER JOIN cart_items ci ON c.cart_cart_id = ci.cart_cart_id) 
	                           		   				 INNER JOIN item i ON ci.items_item_id = i.item_id) 
	                           		   				 INNER JOIN product p ON p.product_id = i.product_product_id) WHERE c.id = ${sessionScope.customerId}
				  </sql:query>
	                <table class="table table-hover" id="view-cart-table">
	                
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
	                    			<td><span class="productPriceCart">${cartItem.price}</span></td>
	                    			<td><input class = "productWeightType" name="weight_${cartItem.item_id}_${cartItem.product_id}" maxlength="10" style = "width: 50px;" data-toggle="tooltip" data-placement="top" title="Invalid value" value="${cartItem.weight}" type="number" min="0">  <span class="">${cartItem.weight_type}</span> </td>
	                    			<td class="text-center"><a class = "delete-cart-item"><i class="fa fa-remove text"></i></a></td>
									<input type = "hidden" id = "item-id" name="itemId_${cartItem.item_id}" value = "${cartItem.item_id}" />
									<input type = "hidden" class = "product-id" name="productId_${cartItem.product_id}" value = "${cartItem.product_id}" />
									<input type="hidden" id="actualPrice" value="${cartItem.price div cartItem.weight} ">
	                    		</tr>
	                    		
	                    		
	                    	</c:forEach>
	                    	
	                    </tbody>
	                </table>
	
	            </div>
	            <!--Footer-->
	            <div class="modal-footer">
	                <input type="submit" class="btn btn-primary btn-update-cart" value="Update Cart" />
	            </div>
	            </form>
	        </div>
	    </div>
	</div>


    </div>
    

	

</div>