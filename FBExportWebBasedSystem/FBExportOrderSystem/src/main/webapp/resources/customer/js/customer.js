// Configure Underscore.js template syntax to avoid conflict with JSP syntax.
//
// Use templates like:
//
//      {{= value }}
//   or {{ statement }}
//   or {{- HTML-escaped text }}
//
$(function () {
  _.templateSettings.interpolate = /\{\{=([^-][\S\s]+?)\}\}/g;
  _.templateSettings.evaluate = /\{\{([^-=][\S\s]+?)\}\}/g;
  _.templateSettings.escape = /\{\{-([^=][\S\s]+?)\}\}/g;
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

        var $productCartItem = $(productCartItem).children().eq(3);

        console.log("item price: " + $productCartItem.text());
        totalPrice += accounting.unformat($productCartItem.text());
        console.log(totalPrice);


    });


    $productCartTotal.text(formatMoney(totalPrice, "₱", "%s%v"));

    $(".productCartHeaderItemCount").text(itemCount);


};

var addToCart = function (cartItem) {

    var $productCart = $("div#shoppingModalCart .modal-body>table>tbody");

    var cartItemTemplate = $("#cartItemTemplate").html();

    var cartTemplate = _.template(cartItemTemplate);

    $productCart.append(cartTemplate({
        productImage : cartItem.productImage,
        productName : cartItem.productName,
        totalPrice : cartItem.totalPrice,
        totalMass : cartItem.totalMass
    }));

    $productCart.find("tr:last>td:last>a")
                .click(function () {
                    $(this).parent().parent().fadeOut("slow", function () {
                        $(this).remove();
                        updateProductCartInfo();
                    });
                });

    updateProductCartInfo();

};

var updatePriceMass = function (massType, quantity) {

    // todo not done yet need to convert the money depends on the country

    var productPrice = $("span#priceAddToCartModal").text();
    var baseMassType = $("span#massDefTypeAddToCart").text();

    var convertedMass = convertMass(massType, baseMassType, quantity);
    var totalPrice = convertedMass * accounting.unformat(productPrice);

    try {

        var formattedPrice = formatMoney(totalPrice,
                                        "PHP",
                                        "%v %s");

        if (formattedPrice == "NaN.undefined") throw "Price exceeded";

        console.log(convertedMass + " quantity: " + quantity);
        console.log("price: " + totalPrice);

        $("#totalMass").val( ((quantity <= 0) ? 0 : quantity) + " " +  massType);
        $("#totalPrice").val(formattedPrice);

    } catch (err) {
        $("#totalPrice").val(err);
    }

};

var resetAddToCartValues = function () {

    /// not done yet

    $("#massType").val("kilogram");
    $("#quantity").val(1);
    $("#totalPrice").val("200.00 PHP");
    $("#totalMass").val("1 kilogram");

};

$("#massType").change(function () {

    var massType = $(this).val(),
        quantity = $("#quantity").val();

    updatePriceMass(massType, quantity);
});

 var $quantitySpinner = $("#quantity").spinner({
    spin: function (event, ui) {
        // updatePriceMass();
        console.log(ui.value);

        var massType = $("#massType").val(),
            quantity = ui.value;

        updatePriceMass(massType, quantity);
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

    updatePriceMass(massType, quantity);
});

$quantitySpinner.val(1);

$("#btnAddToCart").click(function () {

    if (accounting.unformat($("#totalPrice").val()) == 0) {
        $("#quantity").tooltip("show");

        setTimeout(function () {
                $("#quantity").tooltip("hide");
        }, 2000)

        return;

    }

    addToCart({
        productName : $("#addToCartProductName").text(),
        totalPrice : $("#totalPrice").val(),
        totalMass : $("#totalMass").val(),
        productImage : $("#addToCartProductImage").attr("src")
    });

    $("#addToCartModal").modal("hide");
});

$("#addToCartModal").on("hidden.bs.modal", function (event) {
        resetAddToCartValues();
});

var showAddToCartModal = function (productItem) {
    var $addToCartModal = $("#addToCartModal");
    var $addToCartModalBody = $addToCartModal.find("div.modal-body");

    $addToCartModal.find("h5.modal-title strong span").text(productItem.name);
    $addToCartModal.find("h4#addToCartProductName").text(productItem.name);
    $addToCartModalBody.find("span#addToCartModalExpirationDate").text(productItem.expirationDate);
    $addToCartModalBody.find("span#addToCartModalProductDescription").text(productItem.description);
    $addToCartModal.find("span#addToCartModalOrigin").text(productItem.origin);
    $addToCartModal.find("img#addToCartProductImage").attr("src", productItem.productImage);
    $addToCartModalBody.find("span#priceAddToCartModal").text(productItem.price);

    var massType = $("#massType").val(),
    quantity = $("#quantity").val();

    updatePriceMass(massType, quantity);

    $addToCartModal.modal("show");


};

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

    console.log($card.html());

    var productItem = {
        productImage : $card.find("img").attr("src"),
        price : $spansHeaderInfo.eq(0).text(),
        massType : $spansHeaderInfo.eq(1).find("span").text(),
        origin : $spansHeaderInfo.eq(2).text(),
        name : $cardBody.find("h4.card-title a").text(),
        description : $cardBody.find("p.card-text").text(),
        expirationDate : $cardBody.find("div.mt-1 span span.red-text").text()
    };

    showAddToCartModal(productItem);



});

$('.sub-nav-date').ready(function () {

    $('.sub-nav-date').text("please wait..");

    $.ajax({
        url: "http://ip-api.com/json",
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

$(window).resize(function () {
    updateCartPositioning();
});

updateCartPositioning();
updateProductCartInfo();

