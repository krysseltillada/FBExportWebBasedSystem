<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2">Inventory</span>
            <span class = "small mr-2"> <a href = "<c:url value = '/admin/add-product' />"> Add new Product <i class="fa fa-plus-square ml-1" aria-hidden="true"></i> </a> </span>
            <span class = "small mr-2"> <a href = "javascript:void(0)" id = "delete-selected-product" class = "text-muted disabled" style = "pointer-events: none; cursor: not-allowed;"> Delete Product <i class="fa fa-trash ml-1" aria-hidden="true"></i> </a> </span>
            <span class = "small float-right"> <a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> Filter product <i class="fa fa-filter ml-1" aria-hidden="true"></i> </a> </span>
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
                <div class = "card-body pt-2 small">
                    <form class="form-inline ml-2">

                    <label class = "mr-2"> Date: </label>
                    <input class = "text-center mr-2 p-0 form-control form-control-sm" style = "width: 150px;" type="text" id="minDatePicker">
                    <span class = "mr-2"> to </span>
                    <input class = "text-center mr-2 p-0 form-control form-control-sm" style = "width: 150px;" type="text" id="maxDatePicker">
                    <select class = "custom-select mt-2 mr-3 form-control-sm" id = "dateFilterType" style = "width: 170px;">
                        <option value = "DateRegistered">Date Registered</option>
                        <option value = "DateExpired">Date Expired</option>
                        <option value = "DateOfDelivery">Date Of Delivery</option>
                    </select>
                    <label class = "mr-2">
                        Status:
                    </label>

                    <div class="btn-group" data-toggle="buttons">

                    	<label class="btn btn-success btn-sm p-0 pl-3 pr-3">
                        <input type="radio" name="status" autocomplete="off" value = "Posted"> Posted
                        </label>
                        <label class="btn btn-warning text-white btn-sm p-0 pl-3 pr-3">
                        <input type="radio" name="status" autocomplete="off" value = "Unposted"> Unposted
                        </label>
                        <label class="btn btn-danger text-white btn-sm p-0 pl-3 pr-3">
                        <input type="radio" name="status" autocomplete="off" value = "Expired"> Expired
                        </label>
                        <label class="btn btn-primary text-white btn-sm p-0 pl-3 pr-3 active">
                        <input type="radio" name="status" autocomplete="off" value = "All" checked> All
                        </label>
                        
                    </div>


                    </form>
                    <form class="form-inline ml-2 mt-1">
                    <label class = "mr-2"> Price: </label>
                    <input class = "text-center mr-2 p-0 form-control form-control-sm" id = "minPrice" style = "width: 150px;" type = "text" placeholder="0">
                    <span class = "mr-2"> to </span>
                    <input class = "text-center mr-3 p-0 form-control form-control-sm" id = "maxPrice" style = "width: 150px;" type = "text" placeholder="1000">

                    <label class = "mr-2"> Weight: </label>
                    <input class = "text-center mr-2 p-0 form-control form-control-sm" id = "minWeight" style = "width: 150px;" type = "text" placeholder="0">
                    <span class = "mr-2"> to </span>
                    <input class = "text-center mr-2 p-0 form-control form-control-sm" id = "maxWeight" style = "width: 150px;" type = "text" placeholder="100">

                    <button type="button" class="btn btn-primary btn-sm pl-4 pr-4 pt-0 pb-0 mr-1 btn-filter">Filter</button>
                    <button type="button" class="btn btn-secondary btn-sm pl-4 pr-4 pt-0 pb-0" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Close</button>

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
                <table id="inventoryTable" class="table table-sm" cellspacing="0" width="100%" style = "border-bottom: 1px solid #E9ECEF;">
                    <thead>
                        <tr>
                            <th> <input type="checkbox" value="" class="checkbox-template" id = "checkbox-all"> </th>
                            <th> </th>
                            <th> Product id </th>
                            <th> Product </th>
                            <th> Origin </th>
                            <th> Supplier </th>
                            <th> Price </th>
                            <th> Weight </th>
                            <th> Date Registered </th>
                            <th>Expired Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th> </th>
                            <th> Product id </th>
                            <th> Product </th>
                            <th> Origin </th>
                            <th> Supplier </th>
                            <th> Price </th>
                            <th> Weight </th>
                            <th> Date Registered  </th>
                            <th>Expired Date</th>
                            <th>Status</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	
                    	<c:forEach var = "product" items = "${productList}"> 
                    
	                        <tr>
	
	                            <td></td>
	                            <td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>
	                            <td>${product.productId}</td>
	                            <td>${product.name}</td>
	                            <td>${product.origin}</td>
	                            <td>${product.supplier}</td>
	                            <td>${product.price}</td>
	                            <td>${product.weight}</td>
	                            <td>${product.dateRegistered}</td>
	                            <td>${product.expiredDate}</td>
	                            <td>${( product.status eq 'POSTED' ? "Posted" : "Unposted")  }</td>
	
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

<c:if test = "${not empty param.successMessage}">
	<script>
	
		document.addEventListener("DOMContentLoaded", function(event) { 
			iziToast.success({
				message : "${param.successMessage}",
				timeout : 1000,
				position :"bottomRight"
			});
		});
	
	</script>
</c:if>