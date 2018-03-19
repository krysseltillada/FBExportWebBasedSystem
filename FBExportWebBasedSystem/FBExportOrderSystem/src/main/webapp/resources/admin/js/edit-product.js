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


                $(input).parent().parent().parent().parent().find("#img-upload").attr('src', e.target.result);
				
			}
			
			reader.readAsDataURL(input.files[0]);
		} else {
			 $(input).parent().parent().parent().parent().find("#img-upload").attr('src', e.target.result);
		}
	}

	$("#mainProductImage").change(function(){
		readURL(this);
    }); 
    
    $("#previewProductImage1").change(function(){
		readURL(this);
    }); 
    
    $("#previewProductImage2").change(function(){
		readURL(this);
    }); 
    
    $("#previewProductImage3").change(function(){
		readURL(this);
    }); 
    

	$( "#deliveryDatePicker" ).flatpickr({
		dateFormat : "F j, Y",
		onReady : function () {
			$("#deliveryDatePicker").val(flatpickr.formatDate($("#deliveryDatePicker").val(), "F j, Y"));
		}
	});
	
	$("input[type=submit]").click(function (event) {
		event.preventDefault();

		var product = {
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

		$.post("/FBExportSystem/admin/edit-product/validate", {
			productJSONString : JSON.stringify(product)
		}, function (response) {

			if (response.status == "success") {
				console.log("success");
				$("form[action]").submit();
			
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

});