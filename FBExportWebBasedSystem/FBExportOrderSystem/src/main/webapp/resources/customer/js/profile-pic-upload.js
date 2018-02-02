$(document).ready(function () { 

    /*Profile Picture*/

    $('input[type=radio][name=gender]').change(function(){
        var gender = $('input[type=radio][name=gender]:checked').val();
        if(gender == "Male"){
        $("#img-upload").attr("src", "resources/customer/img/profile-male.jpg");
        }

        if(gender == "Female"){
        $("#img-upload").attr("src", "resources/customer/img/profile-female.jpg");
        }
    });

    function filePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-upload").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#file").change(function () {
        filePreview(this);
    });


    /*Profile Picture*/

});