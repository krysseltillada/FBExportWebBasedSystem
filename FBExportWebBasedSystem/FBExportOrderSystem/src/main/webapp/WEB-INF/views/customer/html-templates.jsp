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

	<span href="#" class="list-group-item list-group-item-action flex-column align-items-start">
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