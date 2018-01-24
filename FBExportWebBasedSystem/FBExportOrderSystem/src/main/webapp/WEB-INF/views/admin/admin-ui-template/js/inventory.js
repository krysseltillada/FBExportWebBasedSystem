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
		    
		    if( input.length ) {
		        input.val(log);
		    } else {
		        if( log ) alert(log);
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
                window.alert("invalid image type");
                $("input[type=text]").val("");
            }
		}

		$("#imgInp").change(function(){
		    readURL(this);
        }); 