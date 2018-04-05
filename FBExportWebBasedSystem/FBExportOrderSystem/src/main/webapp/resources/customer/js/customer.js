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
                "onclick": function () {
                    window.location.href = window.location.origin + "/FBExportSystem/order-list";
                },
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

        var uniqueProductId = new Set();

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
        
            uniqueProductId.add($(productCartItem).find(".product-id").val());

            var $productCartItem = $(productCartItem).children().eq(2);
            totalPrice += accounting.unformat($productCartItem.text());

        });

        uniqueProductId.forEach(function (val) {

            console.log($("div#shoppingModalCart div.modal-body>table").find(".product-id[value="+ val +"]").closest("tr").html());

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
        
        var foundItem = false;
        $('div#shoppingModalCart .modal-body>table>tbody>tr').each(function() {
        	if(cartItem.productId == $(this).find(".product-id").val()){
        		var arr = $(this).find(".productPriceCart").html().split(" ");
        		var cartPrice = cartItem.totalPrice.split(" ");
        		
        		$(this).find(".productPriceCart").html(Number(arr[0]) + Number(cartPrice[0]) + " " + cartPrice[1]);
        		$(this).find(".productWeightCart").html(Number($(this).find(".productWeightCart").html()) + Number(cartItem.totalWeight));
        		$(this).find(".productWeightType").html(cartItem.weightType);
        		foundItem = true;
        	}
        });
        
        if(!foundItem){
	        $productCart.append(cartTemplate({
	            productImage : cartItem.productImage,
	            productName : cartItem.productName,
	            totalPrice : cartItem.totalPrice,
	            totalWeight : cartItem.totalWeight,
	            weightType : cartItem.weightType,
	            itemId : cartItem.itemId,
	            productId : cartItem.productId
	        }));
        }
        
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
            quantity = $("#quantity").val(),
            currentWeight = $("#fullWeight").val(),
            massTypeChange = $("#changeMassType").html();
        
        var convertedWeight = convertMass($("#changeMassType").html() == "Kg" ? "kilogram" : massTypeChange, massType, Number(currentWeight));
        $("#fullWeight").val(convertedWeight);
        $("#availableWeight").html(Number($("#fullWeight").val()).toFixed(2));
       
        $("#changeMassType").html(massType == "kilogram" ? "Kg" : massType);
       
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
        var val = $(this).parent().parent().find("#product-id").val();
        var rowCart = $("div#shoppingModalCart div.modal-body>table").find(".product-id[value="+ val +"]").closest("tr").html();
         
        var orderMassType = $(rowCart).find(".productWeightType").html();
        
        if(jQuery.type(orderMassType) !== "undefined"){
        	if( orderMassType != $("#massType option:selected").text()){
            	toastr.warning("Your order should be in " + orderMassType , 'Warning!');
            	return;
            }
        }
        
        var addedQuantity = Number($(rowCart).find(".productWeightCart").html()) + Number($("#quantity").val());
       
        if(Number($("#availableWeight").text()) < Number($("#quantity").val()) || Number(addedQuantity) > Number($("#availableWeight").text())){
        	toastr.warning('Your order exceeds available stocks', 'Warning!');
        	return;
        }
        
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

        $.post("/FBExportSystem/add-to-cart", {
            customerCartJSON : JSON.stringify(item)
        }, function (response) {
            console.log("RESPONSE " + response);
            
            addToCart({
                productName : $addToCartModal.find("#addToCartProductName").text(),
                totalPrice : formatMoney(accounting.unformat($addToCartModal.find("#totalPrice").val()), currentCurrency, "%v %s"),
                totalWeight : parseFloat($addToCartModal.find("#totalWeight").val().substring(0, $addToCartModal.find("#totalWeight").val().indexOf(" "))).toFixed(1),
                weightType : $addToCartModal.find("#massType>option:selected").html(),
                productImage : $addToCartModal.find("#addToCartProductImage").attr("src"),
                itemId : response.itemId,
                productId : response.productId
            });

            $("#addToCartModal").modal("hide");

        }, "json");

       
    });

    $(".btn-place-order").click(function () {
    
        location.href = "/FBExportSystem/place-order";

    });

    $("#quantity").tooltip({
        trigger : 'manual',
        offset : '0px 9px'
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
            vietnam -> 1.52.0.0 -> no currency rate
        */

        $.ajax({
            url: "http://ip-api.com/json/72.229.28.185",
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

                                        console.log(responseData);

                                        fx.base = "PHP";
                                        fx.rates = response.rates;

                                        if (location.country != "Philippines") 
                                            currentCurrency = "USD";
                                        else
                                            currentCurrency = fx.base;

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
                                        
                                        $(".carousel-item").each(function () {

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

                                        var subTotal = 0;

                                        $("#cartItemTable>tbody>tr").each(function () {

                                            var $priceRow = $(this).find("td:eq(1)");

                                            var phpPriceToCurrentPrice = formatMoney(fx($priceRow.html()).from("PHP").to(currentCurrency), currentCurrency, "%v %s");
                                            subTotal += Number(accounting.unformat(phpPriceToCurrentPrice));

                                            $priceRow.html(phpPriceToCurrentPrice);

                                        });

                                        $("#receiptOrderTable>tbody>tr").each(function () {

                                            var $priceRow = $(this).find("td:eq(3)");

                                            console.log($priceRow.html() + " price row");

                                            var phpPriceToCurrentPrice = formatMoney(fx($priceRow.html()).from("PHP").to(currentCurrency), currentCurrency, "%v %s");
                                            subTotal += Number(accounting.unformat(phpPriceToCurrentPrice));

                                            $priceRow.html(phpPriceToCurrentPrice);

                                        });


                                        var shippingFee = Number(accounting.unformat(formatMoney(fx($(".shippingFee").html()).from("PHP").to(currentCurrency), "", "%v")));
                                        var taxPaid = Number(accounting.unformat(formatMoney(fx($(".taxPaid").html()).from("PHP").to(currentCurrency), "", "%v")));
                                        var totalDue = subTotal + shippingFee + taxPaid;

                                        $(".subTotal").html(formatMoney(subTotal, currentCurrency, "%v %s"));
                                        $(".shippingFee").html(formatMoney(shippingFee, currentCurrency, "%v %s"));
                                        $(".taxPaid").html(formatMoney(taxPaid, currentCurrency, "%v %s"));
                                        $(".totalDue").html(formatMoney(totalDue, currentCurrency, "%v %s"));
                                      
                                        _.each($("div#shoppingModalCart div.modal-body>table>tbody").children(), function (productCartItem, i) {

                                            var $productCartItem = $(productCartItem).children().eq(2);
                                            $productCartItem.html(formatMoney(fx($productCartItem.html()).from("PHP").to(currentCurrency), currentCurrency, "%v %s"));
                                        });

                                        $(".price").each(function () {
                                            $(this).html(formatMoney(fx($(this).html()).from("PHP").to(currentCurrency), "", "%v"))
                                            $(this).next().html(currentCurrency);
                                        });

                                        $( "#slider" ).slider({
                                            range: true,
                                            min: 1,
                                            max: Number($("#max-price").html()) * 2,
                                            values: [0, Number($("#max-price").html()) / 2],
                                            slide: function( event, ui ) {
                                                
                                                $( "#min-price" ).html(formatMoney(ui.values[0], "", "%v"));
                                                $( "#max-price" ).html(formatMoney(ui.values[1], "", "%v"));
                                                
                                                var minPriceOnPHP = formatMoney(fx(ui.values[0]).from(currentCurrency).to("PHP"), "", "%v");
                                                var maxPriceOnPHP = formatMoney(fx(ui.values[1]).from(currentCurrency).to("PHP"), "", "%v");

                                                $("#price-range").val(minPriceOnPHP + "," + maxPriceOnPHP);
                                            },
                                            create : function (event, ui) {

                                                var minPriceOnPHP = formatMoney(fx($("#min-price").html()).from(currentCurrency).to("PHP"), "", "%v");
                                                var maxPriceOnPHP = formatMoney(fx(Number($("#max-price").html()) / 2).from(currentCurrency).to("PHP"), "", "%v");
                                                
                                                $( "#min-price" ).html(formatMoney(1, "", "%v"));
                                                $( "#max-price" ).html(formatMoney((Number($("#max-price").html()) / 2), "", "%v"));

                                                $("#price-range").val(minPriceOnPHP + "," + maxPriceOnPHP);

                                            }
                                        });

                                        $(".paypal-button").each(function (ind, elem) {

                                            var $divOrderCollapse = $(this).closest("div.multi-collapse");
                                            
                                            var country = $divOrderCollapse.find("#country").html();

                                            $.ajax({

                                                url : "https://restcountries.eu/rest/v2/name/" + country,
                                                success : function (responseData) {

                                                    var $orderItemDiv = $divOrderCollapse.prev();

                                                    var subTotalPrice = 0;
                                                    var oid = $orderItemDiv.find("#orderId").html();

                                                    var $itemsOrderedTable = $divOrderCollapse.find("table");

                                                    var itemsOrdered = [];
                                                
                                                    $itemsOrderedTable.find("tbody").find("tr").each(function (ind, elem) {
                                                        
                                                        var itemOrdered = {
                                                            name : $(elem).find("td:eq(0)").html().trim() + " (" + $(elem).find("td:eq(1)").html() + ")",
                                                            price : $(elem).find("td:eq(2)>span.price").html(),
                                                            currency : currentCurrency,
                                                            quantity : "1"
                                                        }

                                                        itemsOrdered.push(itemOrdered);
                                                        
                                                    });

                                                    $itemsOrderedTable.find("tfoot tr .price").each(function (ind, elem) {
                                                        subTotalPrice += Number(accounting.unformat($(elem).html()));
                                                    });

                                                    var taxPaid = Number(accounting.unformat(formatMoney(fx($itemsOrderedTable.find("tfoot #estimatedTax").val()).from("PHP").to(currentCurrency), currentCurrency, "%v")));
                                                    var shippingFee = Number(accounting.unformat(formatMoney(fx(1000).from("PHP").to(currentCurrency), currentCurrency, "%v")));
                                                    var totalPrice = subTotalPrice + shippingFee + taxPaid;

                                                    console.log("taxpaid: " + taxPaid);
                                                    
                                                    console.log("shipping fee: " + shippingFee);
                                                    

                                                    console.log(totalPrice + " total price");

                                                    $orderItemDiv.find(".price").html(formatMoney(totalPrice, "", "%v"));

                                                    paypal.Button.render({
                                                        env: 'sandbox', // Or 'sandbox',

                                                        style: {
                                                            color: 'blue',
                                                            size: 'small',
                                                            shape : 'rect',
                                                            size : 'small',
                                                            label : 'pay'
                                                        },
                                                        
                                                        commit : true,
                                                        
                                                        client: {
                                                            sandbox:    'AQNTbQBVVlGXxzbWa9o9poVa187KefuAwZ3EuUxn7uH2cCUxXkUCqhIPW2f0Eh6FW6_MSNGxwlIv3bSD'
                                                        },

                                                        payment: function(data, actions) {

                                                        return actions.payment.create({
                                                            payment: {
                                                                intent : "sale",
                                                                transactions: [
                                                                    {
                                                                        amount: { 
                                                                            total: formatMoney(totalPrice, "", "%v"), 
                                                                            currency: currentCurrency,
                                                                            details : {
                                                                                subtotal : formatMoney(subTotalPrice, "", "%v"),
                                                                                shipping : formatMoney(shippingFee, "", "%v"),
                                                                                tax : formatMoney(taxPaid, "", "%v")
                                                                            }
                                                                        },
                                                                        

                                                                        item_list : {	
                                                                            items : itemsOrdered
                                                                        }
                                                                        
                                                                    }
                                                                ],
                                                                note_to_payer: "Contact us on any regardings on your payment",
                                                            },
                                                            experience : {
                                                                input_fields : {
                                                                    no_shipping : 1
                                                                },
                                                                presentation : {
                                                                    brand_name : "Fong Bros International Corp"
                                                                }
                                                            }
                                                        });
                                                        },

                                                        onAuthorize: function(data, actions) {
                                                            return actions.payment.execute().then(function(payment) {
  
                                                                $.post("/FBExportSystem/order-list/markPaid", {
                                                                    orderId : oid
                                                                }, function () {
                                                                    window.location = "/FBExportSystem/payment-receipt?orderId=" + oid;
                                                                });
                                                            });
                                                        },

                                                        onCancel: function(data, actions) {
                                                        /* 
                                                            * Buyer cancelled the payment 
                                                            */
                                                        },

                                                        onError: function(err) {

                                                            console.log(err);
                                                        /* 
                                                            * An error occurred during the transaction 
                                                            */
                                                        }
                                                    }, elem);
                                            }});

                                        });


                                        updateProductCartInfo();

                                        $("#see-more-most-viewed-products").removeAttr("disabled");
                                        $("#see-more-newest-products").removeAttr("disabled");
                                        $(".btnProductItemAddToCart").removeAttr("disabled");
                                        $("#cart").css("pointer-events", "auto");

                                        var token = $("meta[name='_csrf']").attr("content");
                                        var header = $("meta[name='_csrf_header']").attr("content");
                                        $(document).ajaxSend(function(e, xhr, options) {
                                            xhr.setRequestHeader(header, token);
                                        });

                                        $("#notificationListItem").removeClass("d-none");

                                        if ($("div.notifications").length > 0) {

                                            var seenItemId = [];

                                            $("div.notifications>.list-group>span").each(function (i, elem) {
                                                seenItemId.push($(this).find("#notificationId").val());
                                            });

                                            $.post("/FBExportSystem/seen-notification", {
                                                seenNotificationIdRawJSON : JSON.stringify(seenItemId)
                                            }, function () {
                                                
                                                $("#dropDownNotification").find("span").html("");
                                                $("#notificationListGroup input[value='false']").val("true");

                                                $("div.notifications>.list-group>span").each(function () {

                                                    var $dateAgo = $(this).find("small");

                                                    console.log($dateAgo.html());

                                                    $dateAgo.html(timeago().format($dateAgo.html()));
                                                });

                                                $("div.notificationsLoadingDisplay").addClass("d-none");
                                                $("div.notifications").removeClass("d-none");

                                                $("#btnClearNotifications").removeClass("d-none");
                                                $("#btnSeeMoreNotifications").removeClass("d-none");

                                            });

                                        }
  
                                    }, "json");

                                   

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


/*Floating Action Button*/
//Select all links with hashes
$('a[href*="#"]')
// Remove links that don't actually link to anything
.not('[href="#"]')
.not('[href="#0"]')
.click(function(event) {
  // On-page links
  if (
    location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
    &&
    location.hostname == this.hostname
  ) {
    // Figure out element to scroll to
    var target = $(this.hash);
    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
    // Does a scroll target exist?
    if (target.length) {
      // Only prevent default if animation is actually gonna happen
      event.preventDefault();
      $('html, body').animate({
        scrollTop: target.offset().top
      }, 1000, function() {
        // Callback after animation
        // Must change focus!
        var $target = $(target);
        $target.focus();
        if ($target.is(":focus")) { // Checking if the target was focused
          return false;
        } else {
          $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
          $target.focus(); // Set focus again
        };
      });
    }
  }
});
/*Floating Action Button*/