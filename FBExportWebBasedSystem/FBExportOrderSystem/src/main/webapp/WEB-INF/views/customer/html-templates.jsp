 <script id = "cartItemTemplate" type = "text/template">

    <tr>
        <th scope="row">1</th>
        <td><img src="{{=productImage}}" width="50" height="50" class="float-left" alt="placeholder"></td>
        <td>{{=productName}}</td>
        <td>{{=totalPrice}}</td>
        <td>{{=totalMass}}</td>
        <td class="text-center"><a><i class="fa fa-remove text"></i></a></td>
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
						<li> <strong> {{=receiverFullName}}  </strong> </li>
						<li> 
							<span> {{=zipcode}} </span>
							<span> {{=address}} </span>
							<span> {{=city}} </span>
						</li>
						<li> {{=country}} </li>
						<li> Phone number: (+<span>{{=countryCode}}</span>) <span> {{=phoneNumber}} </span> </li>
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