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
    

	$( "#expiredDatePicker" ).flatpickr();
    $( "#deliveryDatePicker" ).flatpickr();

});