$(window).ready(function () {

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

});