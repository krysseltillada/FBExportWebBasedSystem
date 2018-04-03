$(document).ready(function () {
   
    var updateHomePositioning = function () {

        var screenWidth = $(document).width();

        if (screenWidth <= 800) {
            $("#popularProductsCarousel").removeClass("pl-5").removeClass("pr-5");
            $("#popularProductsCarousel div.carousel-item>div.view").css("height", "auto");
        } else {
            $("#popularProductsCarousel").addClass("pl-5").addClass("pr-5");
            $("#popularProductsCarousel div.carousel-item>div.view").removeAttr("style");
            $("#popularProductsCarousel div.carousel-item>div.view").css("height", "350px");
            
        }
    };

     $("#see-more-most-viewed-products").click(function () {
        
        var currentPageCount = $(".productGridList:eq(0)").children().length;

        console.log(currentPageCount);

        $("#see-more-most-viewed-products").hide();
        $(".see-more-most-view-loader").css("display", "block");

        setTimeout(function () {
            $.get("/FBExportSystem/see-more-most-viewed-products", {
                pageCount : currentPageCount 
            }, function (response) {
                
                var productCardRawTemplate = $("#productCardTemplate").html();
                var productCardTemplate =  _.template(productCardRawTemplate);

                if (response.length > 0) {

                        for (var i = 0; i != response.length; ++i) {

                            var productItem =  productCardTemplate({
                                productImageLink : response[i].productImageLink,
                                price : response[i].price,
                                weight : response[i].weight,
                                origin : response[i].origin,
                                name : response[i].name,
                                description : response[i].description,
                                stockStatus : response[i].status,
                                postedDate : moment(response[i].datePosted).format("MMMM D, YYYY"),
                                productId : response[i].productId,
                                isCustomerLoggedIn : $("#customer-id").val()
                            });
                            
                            $(".productGridList:eq(0)").append(productItem);

                            var basePrice = $(".productGridList:eq(0) .card:last #price").html();

                            var basePriceToCurrentPrice = fx(basePrice).from("PHP").to(currentCurrency);

                            $(".productGridList:eq(0) .card:last #price").html(formatMoney(basePriceToCurrentPrice, "", "%v"));
                            $(".productGridList:eq(0) .card:last #currency").html(currentCurrency);
                            
                            $(".productGridList:eq(0) .card:last").fadeIn("slow");
                            $(".productGridList:eq(0) .card:last .btnProductItemAddToCart").click(function () {
                            	
                                    var $card = $(event.currentTarget).parent().parent().parent();
                                    
                                    $card.find("#real-price-approx").val(basePriceToCurrentPrice);
                                    
                                    var $cardBody = $card.find("div.card-body");

                                    var $spansHeaderInfo = $card.children("span");

                                    var currency = $card.find("span>span:eq(1)").html();
                                   
                                    var productItem = {
                                        productImage : $card.find("img").attr("src"),
                                        price : $spansHeaderInfo.eq(0).text(),
                                        massType : $spansHeaderInfo.eq(1).find("span").text(),
                                        availableWeight : $spansHeaderInfo.eq(2).find("span").html(),
                                        name : $cardBody.find("h4.card-title a").text(),
                                        origin : $cardBody.find("p.card-text span").html(),
                                        description : $cardBody.find("p.card-text span").next().next().html(),
                                        productId : $cardBody.find("#product-id").val(),
                                        stockStatus : $cardBody.find("#product-stock-status").html(),
                                        datePosted : $cardBody.find("#product-date-posted").html(),
                                        realPriceApprox : $card.find("#real-price-approx").val()
                                    };

                                    showAddToCartModal(productItem, currency);
                            });

                        }

                        $("#see-more-most-viewed-products").show();
                        $(".see-more-most-view-loader").css("display", "none");

                    } else {

                        $("#see-more-most-viewed-products").hide();
                        $(".see-more-most-view-loader").css("display", "none");
                    }

                

            }, "json");
        }, 1000);

    });

    $("#see-more-newest-products").click(function () {
        
        var currentPageCount = $(".productGridList:eq(1)").children().length;

        console.log(currentPageCount);

        $("#see-more-newest-products").hide();
        $(".see-more-newest-loader").css("display", "block");

        setTimeout(function () {
            $.get("/FBExportSystem/see-more-newest-products", {
                pageCount : currentPageCount 
            }, function (response) {
                
                var productCardRawTemplate = $("#productCardTemplate").html();
                var productCardTemplate =  _.template(productCardRawTemplate);

                if (response.length > 0) {

                        for (var i = 0; i != response.length; ++i) {

                            var productItem =  productCardTemplate({
                                productImageLink : response[i].productImageLink,
                                price : response[i].price,
                                weight : response[i].weight,
                                origin : response[i].origin,
                                name : response[i].name,
                                description : response[i].description,
                                stockStatus : response[i].status,
                                postedDate : moment(response[i].datePosted).format("MMMM D, YYYY"),
                                productId : response[i].productId,
                                isCustomerLoggedIn : $("#customer-id").val()
                            });

                            console.log(response[i]);

                            $(".productGridList:eq(1)").append(productItem);
                            
                            $(".productGridList:eq(1) .card:last").fadeIn("slow");

                            var basePrice = $(".productGridList:eq(1) .card:last #price").html();

                            var basePriceToCurrentPrice = fx(basePrice).from("PHP").to(currentCurrency);

                            $(".productGridList:eq(1) .card:last #price").html(formatMoney(basePriceToCurrentPrice, "", "%v"));
                            $(".productGridList:eq(1) .card:last #currency").html(currentCurrency);

                            $(".productGridList:eq(1) .card:last .btnProductItemAddToCart").click(function () {
                                var $card = $(event.currentTarget).parent().parent().parent();
                                var $cardBody = $card.find("div.card-body");

                                var $spansHeaderInfo = $card.children("span");

                                var currency = $card.find("span>span:eq(1)").html();
                                
                                var productItem = {
                                    productImage : $card.find("img").attr("src"),
                                    price : $spansHeaderInfo.eq(0).text(),
                                    massType : $spansHeaderInfo.eq(1).find("span").text(),
                                    availableWeight : $spansHeaderInfo.eq(2).find("span").html(),
                                    name : $cardBody.find("h4.card-title a").text(),
                                    origin : $cardBody.find("p.card-text span").html(),
                                    description : $cardBody.find("p.card-text span").next().next().html(),
                                    productId : $cardBody.find("#product-id").val(),
                                    stockStatus : $cardBody.find("#product-stock-status").html(),
                                    datePosted : $cardBody.find("#product-date-posted").html(),
                                    realPriceApprox : $card.find("#real-price-approx").val()
                                };

                                showAddToCartModal(productItem, currency);
                            });

                        }

                        $("#see-more-newest-products").show();
                        $(".see-more-newest-loader").css("display", "none");

                    } else {

                        $("#see-more-newest-products").hide();
                        $(".see-more-newest-loader").css("display", "none");
                    }

                

            }, "json");
        }, 1000);

    });




    $(window).resize(function () {
        updateHomePositioning();
    });

    updateHomePositioning();


});