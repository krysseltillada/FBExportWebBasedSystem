$(document).ready(function () {

    var updateLoginFormPositioning = function () {
                    var screenWidth = $(document).width();
                    console.log("l");

                    if (screenWidth <= 800) {

                        $("form#loginForm>div.row:eq(3)>div").css("left", "auto");
                        $("form#loginForm>div.row:eq(2)>div>div").css("left", "auto");
                        $("form#loginForm").removeClass("mt-5").addClass("mt-4");
                        $("form#loginForm").removeClass("ml-5");

                    } else {

                        $("form#loginForm>div.row:eq(3)>div").css("left", "375px");
                        $("form#loginForm>div.row:eq(2)>div>div").css("left", "80px");
                        $("form#loginForm").removeClass("mt-4").addClass("mt-5");
                        $("form#loginForm").addClass("ml-5");

                    }

    }; 

    $(window).resize(function () {
        updateLoginFormPositioning();
    });

    updateLoginFormPositioning();

});