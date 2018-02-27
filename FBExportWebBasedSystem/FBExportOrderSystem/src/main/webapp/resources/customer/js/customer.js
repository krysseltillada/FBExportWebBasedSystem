// Configure Underscore.js template syntax to avoid conflict with JSP syntax.
//
// Use templates like:
//
//      {{= value }}
//   or {{ statement }}
//   or {{- HTML-escaped text }}
//

var currentCurrency = "";

$(function () {
  _.templateSettings.interpolate = /\{\{=([^-][\S\s]+?)\}\}/g;
  _.templateSettings.evaluate = /\{\{([^-=][\S\s]+?)\}\}/g;
  _.templateSettings.escape = /\{\{-([^=][\S\s]+?)\}\}/g;
});

$(function () {
    toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "6000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
});

(function($){

    $.fn.outside = function(ename, cb){
        return this.each(function(){
            var $this = $(this),
                self = this;

            $(document).bind(ename, function tempo(e){
                if(e.target !== self && !$.contains(self, e.target)){
                    cb.apply(self, [e]);
                    if(!self.parentNode) $(document.body).unbind(ename, tempo);
                }
            });
        });
    };

    $.fn.outerHTML = function(s) {
        return (s)
        ? this.before(s).remove()
        : jQuery("<p>").append(this.eq(0).clone()).html();
    }

}(jQuery));

$(document).ready(function () {

    var updateCartPositioning = function () {
        var screenWidth = $(document).width();
        console.log(screenWidth);

        if (screenWidth <= 800) {
            console.log(true);

            var shoppingCartButton = $("div#navbarSupportedContent a#cart").detach();


            shoppingCartButton.css("font-size", "11px");
            shoppingCartButton.css("display", "inline");
            shoppingCartButton.appendTo($("#nav-bar-brand-mobile-header"));


            $("#desktopWebsiteHeader").hide();
            $("#nav-bar-brand-mobile-header").removeClass("d-none");
            $(".productGridList").removeAttr("style");

            $(".shopping-cart-box").css("left", "10px");


        } else {

            var shoppingCartButton = $("#nav-bar-brand-mobile-header a#cart").detach();

            shoppingCartButton.css("font-size", "15px");
            shoppingCartButton.css("display", "inline-block");
            shoppingCartButton.appendTo($("div#navbarSupportedContent ul:eq(1)>li:eq(1)"));

            console.log("false");


            $("#nav-bar-brand-mobile-header").addClass("d-none");
            $(".productGridList").attr("style", "padding-left: 60px; padding-right: 60px;");
            $("#desktopWebsiteHeader").show();
            $(".shopping-cart-box").css("left", "140px");

        }
    };


    var updateProductCartInfo = function () {

        var $productCartItemLists = $("div#shoppingModalCart div.modal-body>table>tbody");
        var $productCartTotal = $("div.shopping-cart-total").children().eq(1);
        var itemCount = $productCartItemLists.children().length;

        if (itemCount > 0) {
            $productCartItemLists.parent().removeClass("d-none");
            $("#productCartEmptyMessage").addClass("d-none");
            $("div#shoppingModalCart div.modal-footer>button:eq(1)").removeClass("disabled");
        } else {
            $productCartItemLists.parent().addClass("d-none");
            $("#productCartEmptyMessage").removeClass("d-none");
            $("div#shoppingModalCart div.modal-footer>button:eq(1)").addClass("disabled");
        }

        var totalPrice = 0;

        _.each($productCartItemLists.children(), function (productCartItem, i) {

            var $productCartItem = $(productCartItem).children().eq(2);
            totalPrice += accounting.unformat($productCartItem.text());

        });


        $productCartTotal.text(formatMoney(totalPrice, currentCurrency, "%s%v"));

        
        if (itemCount > 0) {
            $(".productCartHeaderItemCount").text(itemCount);
            $(".productCartHeaderItemCount").show();
        } else
            $(".productCartHeaderItemCount").hide();

    };

    var addToCart = function (cartItem) {

        var $productCart = $("div#shoppingModalCart .modal-body>table>tbody");

        var cartItemTemplate = $("#cartItemTemplate").html();

        var cartTemplate = _.template(cartItemTemplate);

        console.log(cartItem);

        $productCart.append(cartTemplate({
            productImage : cartItem.productImage,
            productName : cartItem.productName,
            totalPrice : cartItem.totalPrice,
            totalWeight : cartItem.totalWeight,
            weightType : cartItem.weightType,
            itemId : cartItem.itemId
        }));

        $productCart.find("tr:last>td:last>a.delete-cart-item")
                    .click(function () {

                        var $btnDelete = $(this); 

                        $.post("/FBExportSystem/remove-to-cart", {
                            itemId : $btnDelete.closest("tr").find("#item-id").val()
                        }, function () {
                            $btnDelete.parent().parent().fadeOut("slow", function () {
                                $(this).remove();
                                updateProductCartInfo();
                            });
                        });
                    });

        updateProductCartInfo();

    };

    $("a.delete-cart-item").click(function () {

        var $btnDelete = $(this); 

        $.post("/FBExportSystem/remove-to-cart", {
            itemId : $btnDelete.closest("tr").find("#item-id").val()
        }, function () {
            $btnDelete.parent().parent().fadeOut("slow", function () {
                $(this).remove();
                updateProductCartInfo();
            });
        });
        
    });

 

    $("#massType").change(function () {

        var massType = $(this).val(),
            quantity = $("#quantity").val();

        updatePriceMass(massType, quantity, currentCurrency);
    });

    var $quantitySpinner = $("#quantity").spinner({
        spin: function (event, ui) {
            // updatePriceMass();
            console.log(ui.value);

            var massType = $("#massType").val(),
                quantity = ui.value;

            updatePriceMass(massType, quantity, currentCurrency);
        },
        min : 1,
        max : 9999999999

    });

    $quantitySpinner.parent().css("position", "relative");
    $quantitySpinner.parent().css("top", "-5px");


    $quantitySpinner.keypress(function (event) {

        var keyCode = event.keyCode;


        if ( keyCode < 48 || keyCode > 57 )
            return false;


    });

    $quantitySpinner.keyup(function (event) {

        var massType = $("#massType").val(),
            quantity = $("#quantity").val();

        updatePriceMass(massType, quantity, currentCurrency);
    });

    $quantitySpinner.val(1);

    $("#btnAddToCart").click(function () {

        var $addToCartModal = $(this).closest("div#addToCartModal");

        if (accounting.unformat($("#totalPrice").val()) == 0) {
            $("#quantity").tooltip("show");

            setTimeout(function () {
                    $("#quantity").tooltip("hide");
            }, 2000)

            return;

        }

        var realTotalPriceApprox = $addToCartModal.find("#total-real-price-approx").val();

        var fromCurrentPriceToPhpPrice = fx(realTotalPriceApprox).from(currentCurrency).to("PHP");
                                                
        console.log(fromCurrentPriceToPhpPrice  + " php price usd price " + accounting.unformat($addToCartModal.find("#totalPrice").val()) );

        var item = {
            totalPrice : String(fromCurrentPriceToPhpPrice),
            totalWeight : $addToCartModal.find("#totalWeight").val().substring(0, $addToCartModal.find("#totalWeight").val().indexOf(" ")),
            weightType : $addToCartModal.find("#massType>option:selected").html(),
            productId : $addToCartModal.find("#product-id").val()
        }

        console.log(item);

        $.post("/FBExportSystem/add-to-cart", {
            customerCartJSON : JSON.stringify(item)
        }, function (response) {
            console.log(response);

            addToCart({
                productName : $addToCartModal.find("#addToCartProductName").text(),
                totalPrice : accounting.unformat($addToCartModal.find("#totalPrice").val()),
                totalWeight : parseFloat($addToCartModal.find("#totalWeight").val().substring(0, $addToCartModal.find("#totalWeight").val().indexOf(" "))).toFixed(1),
                weightType : $addToCartModal.find("#massType>option:selected").html(),
                productImage : $addToCartModal.find("#addToCartProductImage").attr("src"),
                itemId : response.itemId
            });

            $("#addToCartModal").modal("hide");

        }, "json");

       
    });

    $("#quantity").tooltip({
        trigger : 'manual',
        offset : '0px 9px'
    });

    $( "#slider" ).slider({
        range: true
    });

    $(".btnProductItemAddToCart").click(function (event) {

        var $card = $(event.currentTarget).parent().parent().parent();
        var $cardBody = $card.find("div.card-body");

        var $spansHeaderInfo = $card.children("span");

        var currency = $card.find("span>span:eq(1)").html();

        var productItem = {
            productImage : $card.find("img").attr("src"),
            price : $spansHeaderInfo.eq(0).text(),
            massType : $spansHeaderInfo.eq(1).find("span").text(),
            origin : $spansHeaderInfo.eq(2).text(),
            name : $cardBody.find("h4.card-title a").text(),
            description : $cardBody.find("p.card-text").text(),
            productId : $cardBody.find("#product-id").val(),
            stockStatus : $cardBody.find("#product-stock-status").html(),
            datePosted : $cardBody.find("#product-date-posted").html(),
            realPriceApprox : $card.find("#real-price-approx").val()
        };

        showAddToCartModal(productItem, currency);



    });

    $('.sub-nav-date').ready(function () {

        $('.sub-nav-date').text("please wait..");

        /*
            sample country ips for currency conversion test

            singapore -> 27.34.176.0
            newyork -> 72.229.28.185
            scotland -> 92.1.194.37
            ph -> empty it
            china -> 1.0.63.255
            japan -> 1.0.31.255

        */

        $.ajax({
            url: "http://ip-api.com/json/1.0.31.255",
            jsonpCallback: "callback",
            dataType: "json",
            success: function( location ) {

                        var country = location.country.toLowerCase();

                        $.ajax({
                            url : "https://restcountries.eu/rest/v2/name/" + country,
                            success : function (responseData) {

                                    setInterval(function () {

                                        var flagImageLink = responseData[0].flag;

                                        var currentDate = moment().tz(location.timezone).format("ddd YYYY-MM-DD hh:mm:ss a");

                                        currentDate = "(" + location.timezone + " " + location.country + " <img src='" + flagImageLink + "' width = '15' height = '15' style = 'position: relative; top: -1px;'/> ) " + currentDate;

                                        var countryCity = location.timezone.split("/");

                                        var linkTimeZone = countryCity[0].toLowerCase() + "--" + countryCity[1].toLowerCase();

                                        $('.sub-nav-date').text("");
                                        $('.sub-nav-date').append(currentDate);
                                        $('.sub-nav-date').attr("href", "https://www.zeitverschiebung.net/en/timezone/" + linkTimeZone);
                                        $('.sub-nav-date').attr("target", "_blank");

                                    }, 1000);

                                    $.get("https://api.fixer.io/latest?base=PHP", function (response) {
                                        console.log(response);

                                        fx.base = "PHP";
                                        fx.rates = response.rates;

                                        for (var i = 0; i != responseData[0].currencies.length; ++i) {
                                            if (fx.rates.hasOwnProperty(responseData[0].currencies[i].code)) {
                                                currentCurrency = responseData[0].currencies[i].code;
                                                break;
                                            } else if (fx.base == responseData[0].currencies[i].code) {
                                                currentCurrency = responseData[0].currencies[i].code;
                                                break;
                                            }
                                        }

                                        console.log(currentCurrency);

                                        $(".card-product").each(function () {

                                            var $price = $(this).find("span>span:eq(0)");
                                            var $currency = $(this).find("span>span:eq(1)");
                                            var $realPriceApprox = $(this).find("#real-price-approx");

                                            var basePrice = $price.html();

                                            var basePriceToCurrent = fx(basePrice).from("PHP").to(currentCurrency);
                                            
                                            $price.html(formatMoney(basePriceToCurrent,
                                                                    currency,
                                                                    "%v"));

                                            $realPriceApprox.val(basePriceToCurrent);
                                            
                                            $currency.html(currentCurrency);
                                            
                                        });

                                        _.each($("div#shoppingModalCart div.modal-body>table>tbody").children(), function (productCartItem, i) {

                                            var $productCartItem = $(productCartItem).children().eq(2);
                                            $productCartItem.html(formatMoney(fx($productCartItem.html()).from("PHP").to(currentCurrency), "", "%v"));
                                        });

                                        updateProductCartInfo();

                                        $("#see-more-most-viewed-products").removeAttr("disabled");
                                        $("#see-more-newest-products").removeAttr("disabled");
                                        $(".btnProductItemAddToCart").removeAttr("disabled");
                                        $("#cart").css("pointer-events", "auto");

                                        
                                    }, "json");

                                    

                                    var token = $("meta[name='_csrf']").attr("content");
                                    var header = $("meta[name='_csrf_header']").attr("content");
                                    $(document).ajaxSend(function(e, xhr, options) {
                                        xhr.setRequestHeader(header, token);
                                        xhr.set
                                    });

                            }
                        });



            }
        });

    });

    $('.shopping-cart').outside('click', function() {
        $(".shopping-cart").hide();
    });

    $("#cart").on("click", function(e) {
        e.preventDefault();
        e.stopPropagation();
        console.log("tng inaaaaaaaa");
        $("#shoppingModalCart").modal('toggle');
    });

    $(".countryCode").ready(function () {
        $.ajax({
            url : "https://restcountries.eu/rest/v2/all",
            dataType : "json",
            success : function (restCountriesData) {


                for (var i = 0; i != restCountriesData.length; ++i) {
                    var countryLetterCode = restCountriesData[i].alpha2Code.trim();
                    var countryCode = restCountriesData[i].callingCodes[0].trim();

                    if (countryCode.length > 0)
                        $(".countryCode").append('<option value = "' + countryCode + '">+' + countryCode + ' (' + countryLetterCode + ') </option>');

                }


            }
        });
    });

    $('.country').ready(function () {
        $.ajax(
            {
                url : "https://restcountries.eu/rest/v2/all",
                dataType : "json",
                success : function (responseData) {

                    for (var i = 0; i != responseData.length; ++i) {

                        if (responseData[i].alpha2Code.length > 0) {
                            var country = responseData[i].name.trim();
                            var countryCode = responseData[i].alpha2Code.trim();
                            $('.country').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                        }

                    }



                }
            }
        );
    });

    $('.country').change(function () {
        
        var $cityTextBox = $('#city');

        var country = $(this).val();


        if ($cityTextBox.is(":disabled"))
            $cityTextBox.removeAttr("disabled");

    });

    $('#addToCartModal').on('hidden.bs.modal', function (e) {
        $(this).find("#quantity").val(1);
        $(this).find("#massType").val("kilogram");
    })
  

    $(window).resize(function () {
        updateCartPositioning();
    });

    updateCartPositioning();

});