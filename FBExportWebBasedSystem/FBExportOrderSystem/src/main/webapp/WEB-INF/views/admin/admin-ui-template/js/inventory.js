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
        $("#img-upload").attr('src', "upload-product-img.png");
    }
}

$("#imgInp").change(function(){
    readURL(this);
}); 