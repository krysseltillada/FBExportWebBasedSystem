$(document).ready(function () {
    // product add and edit code

	var allowedImageTypes = [
		'image/jpeg',
		'image/png'
	];

	$(document).on('change', '.btn-file :file', function() {
			var input = $(this),
				label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
				
			input.trigger('fileselect', [label]);
	});

	$('.btn-file :file').on('fileselect', function(event, label) {
		
		var input = $(this).parents('.input-group').find(':text'),
			log = label;
					
		if( input.length && allowedImageTypes.includes(event.target.files[0].type)) {
			input.val(log);
		} else {
			if( log ) {
				alert("invalid image type");
				input.val("");
			}
		}

	});

	function readURL(input) {

		if (input.files && input.files[0] && allowedImageTypes.includes(input.files[0].type)) {
			var reader = new FileReader();
			
			reader.onload = function (e) {  
				$('#img-upload').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		} else {
			$("#img-upload").attr('src', "/FBExportSystem/resources/admin/upload-product-img.png");
		}
	}

	$("#imgInp").change(function(){
		readURL(this);
	}); 

	
    $( "#deliveryDatePicker" ).flatpickr({
		dateFormat : "F j, Y",
		minDate : "today"
	});

	var isThreeImagesUploaded = false;

	var multiFileUploader = new qq.FineUploader({
			element: document.getElementById("file-1"),
			template : "qq-template-manual-trigger",
			validation : {
				allowedExtensions : ["jpeg", "jpg", "png"],
				itemLimit : 3
			},
			request : {
				endpoint : "/FBExportSystem/admin/add-product/add-preview-images",
				method : "POST"
			},
			deleteFile: {
				enabled: true,
				forceConfirm: true,
				endpoint: '/FBExportSystem/admin/add-product/delete-preview-images',
				method : "DELETE"
    		},
			autoUpload : false,
			debug : false,
			callbacks : {
				onComplete : function (id, name, responseJSON, maybeXhr) {
					console.log(responseJSON);
					$("#" + id).val(responseJSON.productImageLink);
				},
				onCancel : function (id, name) {
					console.log("cancel");
					$("#" + id).remove();
				},
				onError : function (id, name, reason, maybeXhrOrXdr) {

				},
				onAllComplete : function (successfull, failed) {
					// window.location.replace("http://localhost:" + window.location.port + "/FBExportSystem/admin/inventory");

						if (failed.length <= 0) {
				
							$("#upload-message").removeClass("text-danger");
							$("#upload-message").addClass("text-success");
							$("#upload-message").html("<strong> *upload successful </strong>");
							$("#upload-message").css("display", "inline");

							isThreeImagesUploaded = true;

						} else {
							$("#upload-message").removeClass("text-success");
							$("#upload-message").addClass("text-danger");
							$("#upload-message").html("<strong> *upload failed </strong>");
							$("#upload-message").css("display", "inline");

							isThreeImagesUploaded = true;
						}


				},
				onSubmitted : function (id, name) {
					$(".qq-uploader-selector").append("<input type = 'hidden' id = '" + id + "' name = 'profileImageLinks[]' value = '' />");
				},
				onUpload (id, name) {
					console.log(name + " before uploading");
				},
				
				 onSubmitDelete: function(id) {
					this.setDeleteFileParams({filename: this.getName(id)}, id)
				},
				onDeleteComplete : function (id) {
					$("#" + id).remove();
				}
			}
		});

		qq(document.getElementById("trigger-upload")).attach("click", function() {
            multiFileUploader.uploadStoredFiles();
        });

		$("#btn-add-product").click(function (event) {
			
			event.preventDefault();

				var product = {
					isImageEmpty : ($("input[name='product-image']")[0].files.length == 0 ? "true" : "false"),
					name : $("input[name='product-name']").val(),
					origin : $("input[name='origin']").val(),
					deliveryDate : $("input[name='delivery-date']").val(),
					price : $("input[name='price']").val(),
					weight : $("input[name='weight']").val(),
					description : $("textarea[name='description']").val(),
					supplier : $("input[name='supplier']").val(),
					supplierContactNumber : $("input[name='supplier-contact-number']").val(),
					supplierAddress : $("textarea[name='supplier-address']").val()
					
				};

				console.log(product);

				$.post("/FBExportSystem/admin/add-product/validate", 
					{
						productJSONString : JSON.stringify(product)
					},function (response) {

							if (response.status == "success") {
								var imageUploadCount = $("body input[name='profileImageLinks[]']").length;

								if (imageUploadCount >= 3 && isThreeImagesUploaded)  {
									console.log("form submit!!");
									$("form[action]").submit();
								} else {
									$("#upload-message").addClass("text-danger");
									$("#upload-message").html("<strong> *required to upload 3 images </strong>");
									$("#upload-message").css("display", "inline");
								}

							} else {
								$("html, body").animate({ scrollTop: 0 }, 
														"fast", function () {
															$("span.errorMessage").html("*" + response.message);

															$("#errorMessage").removeClass("animated");
															$("#errorMessage").removeClass("shake");

															var prevClassVal = $("#errorMessage").attr("class");

															console.log(prevClassVal);

															$("#errorMessage").removeAttr("class");
															
															$("#errorMessage").css("display", "inline");
															
															$("#errorMessage").addClass(prevClassVal);
															$("#errorMessage").addClass("animated shake");
														
														});

							}

				}, "json");

		});
		

	// $("#file-1").fileinput({ 
    //     theme : "fa",
    //     uploadUrl: '#', 
    //     allowedFileExtensions: ['jpg', 'png'],
    //     overwriteInitial: false,
    //     maxFileSize: 10024,
    //     maxFileCount: 3,
    //     showUpload: false,
    //     showClose : false,
    //     showRemove : true,
	// 	browseOnZoneClick : true,
	// 	dropZoneEnabled : false,
    //     dropZoneTitle : "Drag and drop images here maxinum of 3",
    //     dropZoneClickTitle : "<br /> or click to browse images",
    //     previewSettings : {
    //       image: {width: "250px", height: "250px"}
    //     }

	// });

	// $("#file-1").on("change", function (event) {
	// 	console.log(event.target.files);
	// });
	
	
});