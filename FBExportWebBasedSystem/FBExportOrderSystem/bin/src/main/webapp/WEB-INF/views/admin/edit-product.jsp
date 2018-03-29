<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class = "page-header">
    <div class="container-fluid">
        <h2 class="no-margin-bottom">
	        <span>Inventory > Edit product</span>
	        <span id = "errorMessage" class="text-red small float-right errorMessage" style = "display : none;"></span>
        </h2>
    </div>
    </header>

    <section class = "m-0 p-0">
    <div class = "container-fluid p-0">
    	<form action = "<c:url value = '/admin/inventory/edit-product/${product.productId}/edit' />"  method = "POST" enctype = "multipart/form-data">
        <div class = "card mb-0">
            <div class = "card-body p-5">
                <div class = "row">
                <div class = "col-4">

                        <div class="form-group m-0">
                            <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "<c:url value = '${product.productImageLink}' />" width = "150" height = "240" />
                            <div class="input-group">
                                <span class="input-group-btn rounded">
                                    <span class="btn btn-primary btn-file">
                                        change
                                        <i class="fa fa-file-image-o" aria-hidden="true"></i> <input type="file" name = "product-image" id="mainProductImage">
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
                        <input type="text" name = "product-name" value = "${product.name}" placeholder="product name" class="form-control" required>
                        </div>
                    </div>
                    <div class = "col-6">
                        <div class = "form-group">
                        <label class="form-control-label"> Origin</label>
                        <input type="text" name = "origin" value = "${product.name}" class = "form-control" placeholder="Origin" required>
                        </div>
                    </div>
                    </div>
                    <div class = "row">
                    <div class = "col-lg-4">
                        <div class="form-group">
                            <label class="form-control-label">Price</label>
                            <div class="input-group">
                            <input type="text" name = "price" value = "${product.price}" class="form-control" placeholder="200.00" required><span class="input-group-addon">PHP</span>
                            </div>
                        </div>
                    </div>
                    <div class = "col-lg-4">
                        <div class="form-group">
                        <label class="form-control-label">Weight</label>
                        <div class="input-group">
                            <input type="text" name = "weight" value = "${product.weight}" class="form-control" placeholder="400.00" required><span class="input-group-addon">Kilo</span>
                        </div>
                        </div>
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Description</label>
                        <div class="input-group">
                            <textarea cols = "200" rows = "3" name = "description" style = "resize: none; border: 1px solid #DEE2E6;" required>${product.description}</textarea>
                        </div>
                    </div>

                </div>
                </div>
                <div class = "row mt-2">
                <div class = "col-lg-4">
                    <div class="form-group">
                    <label class="form-control-label">Supplier</label>
                    <input type="text" name = "supplier" value = "${product.supplier}" placeholder="Supplier / Company" class="form-control" required>
                    </div>
                </div>
                <div class = "col-lg-4">
                    <div class="form-group">
                    <label class="form-control-label">Supplier contact number</label>
                    <input type="text" name = "supplier-contact-number" value = "${product.supplierContactNumber}" placeholder="Contact number" class="form-control" required>
                    </div>
                </div>
                    <div class = "col-lg-4">
                    <div class="form-group">
                    <label class="form-control-label">Date of Delivery</label>
                    <input type="text" name = "delivery-date" value = "<fmt:formatDate value = '${product.dateOfDelivery}' type = 'date' dateStyle = 'LONG' />" class = "text-center form-control" id="deliveryDatePicker" placeholder="2011/04/25" required>
                    </div>
                </div>
                </div>
                <div class = "row">
                <div class = "col-lg-5">
                    <label class = "form-control-label"> Supplier Address </label>
                    <textarea  cols = "50" rows = "3" name = "supplier-address" style = "resize: none; border: 1px solid #DEE2E6;" required>${product.supplierAddress}</textarea>
                </div>

                </div>
                <div class = "row mt-2">
                <div class = "col">
                    <div class="form-group">
                        <label class = "form-control-label"> Preview images </label>

                        <hr class = "mt-0"/>

                        <div class = "row">
                        <div class = "col-lg-4">
                            <div class="form-group m-0">
                                <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "<c:url value ='${product.previewImageLinks[0]}' />" width = "100" height = "220" />
                                    <div class="input-group">
                                        <span class="input-group-btn rounded">
                                            <span class="btn btn-primary btn-file">
                                                change
                                                <i class="fa fa-file-image-o" aria-hidden="true"></i> <input type="file" id="previewProductImage1" name = "profileImageLinks">
                                            </span>
                                        </span>
                                        <input type="text" class="form-control small product-image" placeholder = "image jpeg, png" readonly>
                                    </div>
                            </div>
                        </div>
                        <div class = "col-lg-4">
                            <div class="form-group m-0">
                                <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "<c:url value ='${product.previewImageLinks[1]}' />" width = "100" height = "220" />
                                <div class="input-group">
                                    <span class="input-group-btn rounded">
                                        <span class="btn btn-primary btn-file">
                                            change
                                            <i class="fa fa-file-image-o" aria-hidden="true"></i> <input type="file" id="previewProductImage2" name = "profileImageLinks">
                                        </span>
                                    </span>
                                    <input type="text" class="form-control small product-image" placeholder = "image jpeg, png" readonly>
                                </div>
                            </div>
                        </div>
                        <div class = "col-lg-4">
                            <div class="form-group m-0">
                                <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "<c:url value ='${product.previewImageLinks[2]}' />" width = "100" height = "220" />
                                <div class="input-group">
                                    <span class="input-group-btn rounded">
                                        <span class="btn btn-primary btn-file">
                                            change
                                            <i class="fa fa-file-image-o" aria-hidden="true"></i> <input type="file" id="previewProductImage3" name = "profileImageLinks">
                                        </span>
                                    </span>
                                    <input type="text" class="form-control small product-image" placeholder = "image jpeg, png" readonly>
                                </div>
                            </div>
                        </div>
                        </div>

                        <hr />

                    </div>
                </div>
                </div>

                <div class = "row">
                <div class = "col-lg">
                    <a class="btn btn-secondary float-right ml-1" href = "<c:url value = '/admin/inventory' />">Cancel</a>
                    <input type="submit" class="btn btn-primary float-right pl-4 pr-4" value = "Edit" />
                </div>
                </div>

            </div>
        </div>
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        
        </form>
    </div>
</section>   