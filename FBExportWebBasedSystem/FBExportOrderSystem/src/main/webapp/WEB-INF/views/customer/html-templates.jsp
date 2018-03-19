<script id = "cartItemTemplate" type = "text/template">

    <tr>
        <td><img src="{{=productImage}}" width="50" height="50" class="float-left"></td>
        <td>{{=productName}}</td>
        <td>{{=totalPrice}}</td>
		<td>{{=totalWeight}} {{=weightType}}</td>
		<td class="text-center"><a class = "delete-cart-item"><i class="fa fa-remove text"></i></a></td>
		
		<input type = "hidden" id = "item-id" value = "{{=itemId}}" />
    </tr>

</script>

<script id = "activityItemTemplate" type = "text/template">

	<span id="{{=activityId}}" class="list-group-item list-group-item-action flex-column align-items-start">
		<div class="d-flex w-100 justify-content-between">
			<h5 class="mb-1">{{=activityHeader}}</h5>
			<button type="button" class="close delete-activity" aria-label="Close">
					<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<p class="mb-1">{{=activityDescription}}</p>
		<small> {{=activityDate}} </small>
	</span>

</script>

<script id = "shippingAddressTemplate" type = "text/template">
	<div class = "col-md-4">
		<div class="card border-light mb-3" style="max-width: 17rem; height: 12rem;" id = "{{=shippingAddressId}}">
			<div class="card-header pt-2 pb-2" style = "font-size: 14px;">
				<span>{{=addressType}}</span>'s Address 
			</div>
			
			<div class="card-body pt-3 pr-2">
		
				<div class = "card-text">
					<ul class="list-unstyled mb-2" style = "font-size: 12px; height: 6rem; max-height: 6rem; overflow-y: auto;">
						<li> <strong>{{=receiverFullName}}</strong> </li>
						<li> 
							<span>{{=zipcode}}</span>
							<span>{{=address}}</span>
							<span>{{=city}}</span>
						</li>
						<li>{{=country}}</li>
						<li> Phone number: (+<span>{{=countryCode}}</span>) <span>{{=phoneNumber}}</span> </li>
					</ul>
					
					<input type = "hidden" value = "{{=shippingInstructions}}" />
					
						
					<ul class="list-inline" style="font-size: 12px;">
						<li class="list-inline-item mr-1"> <a class="blue-text edit-address" href="javascript:void(0)"> Edit </a> </li>
						<li class="list-inline-item mr-1"> | </li>
						<li class="list-inline-item mr-1"> <a class="blue-text delete-address" href="javascript:void(0)"> Delete </a> </li>
						<li class="list-inline-item mr-1"> | </li>
						
						<a class = "blue-text set-default-shipping-address" href = "javascript:void(0)"> Set default shipping address</a>
					
					</ul>
					

				</div>

			</div>
		</div>
	</div>
</script>

<script id = "productCardTemplate" type = "text/template">

	<div class = "col-md-4">
		<div class="card card-product hoverable">

			<span style = "position: absolute; color: white; left: 180px; width: 40%; overflow: hidden; padding: 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
					<span id = "price">{{=price}}</span>  <span id = "currency">PHP</span>
			</span>

			<span style = "position: absolute; color: white; left: 180px; top: 36px; width: 40%; padding: 3px 5px 3px 5px; text-align: center; border-width: 0px 1px 1px 1px; border-color: white; border-style: solid;" class = "rgba-black-strong">
					Per <span> Kilograms </span>
			</span>

			<span style = "position: absolute; color: white;  top: 170px;  max-width: 200px; max-height: 30px; padding: 3px 5px 3px 5px; text-align: center; border: 1px solid white;" class = "rgba-black-strong">
					{{=origin}}
			</span>

			<img src="/FBExportSystem{{=productImageLink}}" alt="{{=name}}" height = "200" />


			<div class="card-body">


				<h4 class="card-title"> <a href = "/FBExportSystem/view-product/{{=productId}}" class = "black-text"> {{=name}} </a> </h4>

				<hr class = "m-0"/>

				<p class="card-text mt-2" style = "height: 63px; max-height: 63px; overflow-y: auto;">{{=description}}</p>

				<hr class = "m-0"/>

				<div class = "mt-1">

					{{ if (!isCustomerLoggedIn) { }}
					<a href="/FBExportSystem/login" class="btn btn-primary" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
			                            <i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
			                            Login to add</a>

					{{  } else {  }}
						<button type = "button" href="#" class="btn btn-primary btnProductItemAddToCart" style = "position: relative; left: -8px; top: -4px; padding: 8px 10px 8px 10px;">
						<i class="fa fa-cart-plus mr-1 mb-1" aria-hidden="true"></i>
						Add to cart</button>
					{{ } }}


					<span style = "font-size: 12px; position: absolute; top: 155px;" class = "black-text"> Stocks: <span id = "product-stock-status">{{=stockStatus}} </span> </span>
	                <span style = "font-size: 12px; position: absolute; top: 174px;" class = "black-text"> Posted on: <span id = "product-date-posted">{{=postedDate}}</span> </span>

					<input type = "hidden" value = "{{=productId}}" id = "product-id" />
				</div>
			</div>

		</div>
	</div>

</script>

<script id = "shippingAddressPlaceOrderTemplate" type = "text/template">

	<span class="flex-column align-items-start">
		<div class="z-depth-1 border-light mb-2 waves-effect shipping-address-radio-button" style=" height: 10rem;">
			<div class="card-header pt-2 pb-2" style="font-size: 14px;">
				<strong> {{=addressType}}'s Address </strong>
				<input class="float-right mt-1" type="radio" name = "shipping-address" value="{{=shippingAddressId}}" required>
			</div>

			<div class="card-body pt-3">

				<div class="card-text">
					<ul class="list-unstyled" style="font-size: 14px;">
						<li> <strong> {{=receiverFullName}} </strong> </li>
						<li> {{=zipcode}} {{=address}} {{=city}} </li>
						<li> {{=country}} </li>
						<li> Phone number: (+{{=countryCode}}) {{=phoneNumber}} </li>
					</ul>

				</div>

			</div>
		</div>
	</span>

</script>