$(document).ready(function () {

    var updateHomePositioning = function () {

        var screenWidth = $(document).width();

        if (screenWidth <= 800) {
            $("#popularProductsCarousel").removeClass("pl-5").removeClass("pr-5");
            $("#popularProductsCarousel div.carousel-item>div.view").css("height", "auto");
        } else {
            console.log("taeee");
            $("#popularProductsCarousel").addClass("pl-5").addClass("pr-5");
            $("#popularProductsCarousel div.carousel-item>div.view").removeAttr("style");
            $("#popularProductsCarousel div.carousel-item>div.view").css("height", "350px");
            
        }
    };


    $(window).resize(function () {
        updateHomePositioning();
        console.log("tae");
    });

    updateHomePositioning();


});