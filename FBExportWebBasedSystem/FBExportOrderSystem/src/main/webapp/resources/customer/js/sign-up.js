$(document).ready(function () {
	
	$("#showPassword").click(function(){
		if($("#password").attr("type") == "password")
			$("#password").attr("type", "text");
		else
			$("#password").attr("type", "password");
	});
	
	$("#signup-form").submit(function(e){

        if ($(".sign-up-loader").css("display") != "block") {
            
            var form = $("#signup-form")[0];
            var data = new FormData(form);
            
            e.preventDefault();
            
            $.ajax({
                type : "POST",
                enctype : "multipart/form-data",
                url : "/FBExportSystem/register/validate",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function (data) {

                    
                    $("#errorMessageDiv").find("span").remove();
                    $("#errorMessageDiv").find("br").remove();

                    if (data.length <= 0) {

                        if (!$("#errorMessageDiv").hasClass("d-none"))
                            $("#errorMessageDiv").addClass("d-none");

                        $(".sign-up-loader").css("display", "block");
                        $("#submit-signup").hide();
                        $("#signup-form").submit();

                    } else {

                        grecaptcha.reset();
                        $("#errorMessageDiv").removeClass("d-none");

                        for (var i = data.length - 1; 0 <= i; --i) {
                            $("#errorMessageDiv").find("hr").after('<span class = "red-text"> *' + data[i] + ' </span> <br />');
                        }

                        $('html, body').animate({
                            scrollTop: $("body").offset().top
                        }, 700);
                    }
                }
            });
        
        } 
	});

     var updateSignUpFormPositioning = function () {

        var screenWidth = $(document).width();
        console.log(screenWidth);

        if (screenWidth <= 700) {

            $("#country").parent().parent().parent().css("height", "auto").removeClass("mt-3").addClass("mt-2");
            $("#country").css("width", "250px");
            $("#city").parent().css("top", "0px");
            $("#city").parent().parent().addClass("mt-4");
            $("#zipcode").parent().css("margin-top", "0px");
            $("#address").parent().removeClass("mt-3").addClass("mt-2");
            $("#age").parent().parent().parent().removeClass("mt-3");
            $("#countryCode").parent().removeClass("mt-4").addClass("mt-3");
            $("#phonenumber").parent().parent().removeClass("mt-1").addClass("mt-4");

        } else {

            $("#country").parent().parent().parent().css("height", "50px").removeClass("mt-2").addClass("mt-3");
            $("#country").css("width", "auto");
            $("#city").parent().css("top", "-20px");
            $("#city").parent().parent().removeClass("mt-4");
            $("#zipcode").parent().css("margin-top", "75px");
            $("#address").parent().removeClass("mt-2").addClass("mt-3");
            $("#age").parent().parent().parent().addClass("mt-3");
            $("#countryCode").parent().removeClass("mt-3").addClass("mt-4");
            $("#phonenumber").parent().parent().removeClass("mt-4").addClass("mt-1");

        }

    };

    $(window).resize(function () {
        updateSignUpFormPositioning();
    });

    updateSignUpFormPositioning();
    
    /*Profile Picture */

    $('input[type=radio][name=gender]').change(function(){
      var gender = $('input[type=radio][name=gender]:checked').val();
      if(gender == "Male"){
        if($("#profile-image").get(0).files.length == 0){
          $("#img-uploadProfile").attr("src", "resources/customer/img/profile-male.jpg");
        }
      }

      if(gender == "Female"){
        if($("#profile-image").get(0).files.length == 0){
          $("#img-uploadProfile").attr("src", "resources/customer/img/profile-female.jpg");
        }
        
      }
    });

    function filePreviewAdd(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $("#img-uploadProfile").attr("src", e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
    }

    $("#profile-image").change(function () {
        filePreviewAdd(this);
    });


    /*Profile Picture*/

});