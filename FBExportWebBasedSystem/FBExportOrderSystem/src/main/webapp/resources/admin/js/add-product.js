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

	$( "#expiredDatePicker" ).flatpickr({
		minDate : "today"
	});

    $( "#deliveryDatePicker" ).flatpickr({
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
			debug : true,
			callbacks : {
				onComplete : function (id, name, responseJSON, maybeXhr) {
	
				},
				onCancel : function (id, name) {

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
					console.log(name + " uploading");
				},
				onUpload (id, name) {
					console.log(name + " before uploading");
				},
				
				 onSubmitDelete: function(id) {
					this.setDeleteFileParams({filename: this.getName(id)}, id)
				}
			}
		});

		qq(document.getElementById("trigger-upload")).attach("click", function() {
            multiFileUploader.uploadStoredFiles();
        });

		$("#btn-add-product").click(function (event) {
			
			event.preventDefault();

			$.post("/FBExportSystem/admin/add-product/validate", 
				   {
					product : "{'tng ina' : 'tae'}"
				   },function (response) {

						console.log(response);

						if (response.status == "success") {

						} else {

					}

			}, "json");

			var imageUploadCount = $("body ul.qq-upload-list li[qq-file-id]").children().length / 6;
			
			if (imageUploadCount >= 3 && isThreeImagesUploaded)  {
				console.log("form submit!!");
				$("form[action]").submit();
			}
			else {

				$("#upload-message").addClass("text-danger");
				$("#upload-message").html("<strong> *required to upload 3 images </strong>");
				$("#upload-message").css("display", "inline");
				

			}

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