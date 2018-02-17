<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">Inventory > Add new product</h2>
    </div>
</header>

    <section class = "m-0 p-0">
    <div class = "container-fluid p-0">
    
    	<form action = "<c:url value = '/admin/add-product/add' />" method = "POST" enctype = "multipart/form-data" id = "qq-form">
	        <div class = "card mb-0">
	            <div class = "card-body p-5">
	                <div class = "row">
	                <div class = "col-4">
	
	                        <div class="form-group m-0">
	                            <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "<c:url value = '/resources/admin/upload-product-img.png' />" width = "150" height = "240" />
	                            <div class="input-group">
	                                <span class="input-group-btn rounded">
	                                    <span class="btn btn-primary btn-file">
	                                        upload
	                                        <i class="fa fa-file-image-o" aria-hidden="true"></i> <input name = "product-image" type="file" id="imgInp">
	                                    </span>
	                                </span>
	                                <input type="text" class="form-control small product-image" placeholder = "image jpeg, png" readonly>
	                            </div>
	                        </div>
	
	                </div>
	                <div class = "col-8">
	                    <div class = "row">
	                    <div class = "col-6">
	                        <div class="form-group">
	                        <label class="form-control-label">Product Name</label>
	                        <input type="text" placeholder="product name" class="form-control" name = "product-name" >
	                        </div>
	                    </div>
	                    <div class = "col-6">
	                        <div class = "form-group">
	                        <label class="form-control-label"> Origin</label>
	                        <input class = "form-control" type="text" placeholder="Origin" name = "origin" >
	                        </div>
	                    </div>
	                    </div>
	                    <div class = "row">
	                    <div class = "col-lg-4">
	                        <div class = "form-group">
	                        <label class="form-control-label">Expired Date</label>
	                        <input class = "text-center form-control" type="text" id="expiredDatePicker" placeholder="2011/04/25" name = "expired-date" >
	                        </div>
	                    </div>
	                    <div class = "col-lg-4">
	                        <div class="form-group">
	                            <label class="form-control-label">Price</label>
	                            <div class="input-group">
	                            <input type="text" class="form-control" placeholder="200.00" name = "price" ><span class="input-group-addon">PHP</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class = "col-lg-4">
	                        <div class="form-group">
	                        <label class="form-control-label">Weight</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" placeholder="400.00" name = "weight" ><span class="input-group-addon">Kilo</span>
	                        </div>
	                        </div>
	                    </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="form-control-label">Description</label>
	                        <div class="input-group">
	                            <textarea cols = "200" rows = "3" style = "resize: none; border: 1px solid #DEE2E6;" name = "description" ></textarea>
	                        </div>
	                    </div>
	
	                </div>
	                </div>
	                <div class = "row mt-2">
	                <div class = "col-lg-4">
	                    <div class="form-group">
	                    <label class="form-control-label">Supplier</label>
	                    <input type="text" placeholder="Supplier / Company" class="form-control" name = "supplier" >
	                    </div>
	                </div>
	                <div class = "col-lg-4">
	                    <div class="form-group">
	                    <label class="form-control-label">Supplier contact number</label>
	                    <input type="text" placeholder="Contact number" class="form-control" name = "supplier-contact-number" >
	                    </div>
	                </div>
	                    <div class = "col-lg-4">
	                    <div class="form-group">
	                    <label class="form-control-label">Date of Delivery</label>
	                    <input class = "text-center form-control" type="text" id="deliveryDatePicker" placeholder="2011/04/25" name = "delivery-date" >
	                    </div>
	                </div>
	                </div>
	                <div class = "row">
	                <div class = "col-lg-5">
	                    <label class = "form-control-label"> Supplier Address </label>
	                    <textarea  cols = "50" rows = "3" style = "resize: none; border: 1px solid #DEE2E6;" name = "supplier-address" ></textarea>
	                </div>
	
	                </div>
	                <div class = "row mt-2">
	                <div class = "col">
	                    <div class="form-group">
	                        <label class = "form-control-label"> Preview images </label>
	                        <div class="file-loading">
	                            <div id="file-1"> </div>
	                        </div>
	                    </div>
	                </div>
	                </div>
	
	                <br />
	
	                <div class = "row">
	                <div class = "col-lg">
	
	
	                    <input id="checkboxCustom1" type="checkbox" class="checkbox-template" name = "post-this-product">
	                    <label for="checkboxCustom1">Post this product?</label>
	
	                    <a class="btn btn-secondary float-right ml-1" href = "<c:url value = '/admin/inventory' />">Cancel</a>
	                    <input type="submit" class="btn btn-primary float-right pl-4 pr-4" value = "Add" /> 
	                </div>
	                </div>
	
	            </div>
	        </div>
	        	
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        
	      </form>
    </div>
</section> 