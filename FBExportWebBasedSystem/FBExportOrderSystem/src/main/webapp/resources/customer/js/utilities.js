
var convertMass = function (from, to, value) {
                return math.unit(value, from).toNumber(to);
            };

var formatMoney = function (val, sign, formatValue) {
    return accounting.formatMoney(val,
                                    {
                                        symbol : sign,
                                        format : formatValue
                                    });
};

var showAddToCartModal = function (productItem, currency) {
        var $addToCartModal = $("#addToCartModal");
        var $addToCartModalBody = $addToCartModal.find("div.modal-body");

        $addToCartModal.find("h5.modal-title strong span").text(productItem.name);
        $addToCartModal.find("h4#addToCartProductName").text(productItem.name);
        $addToCartModal.find("#priceAddToCartModalRealApprox").val(productItem.realPriceApprox);
        $addToCartModalBody.find("span#productOrigin").text(productItem.origin);
        $addToCartModalBody.find("span#productDescription").text(productItem.description);
        $addToCartModal.find("span#addToCartModalAvailableWeight span").text(productItem.availableWeight);
        $addToCartModal.find("img#addToCartProductImage").attr("src", productItem.productImage);
        $addToCartModalBody.find("span#priceAddToCartModal").text(productItem.price);
        $addToCartModal.find("#product-id").val(productItem.productId);
        $addToCartModalBody.find("#product-stock-status").text(productItem.stockStatus);
        $addToCartModalBody.find("#date-posted").text(productItem.datePosted);

        var massType = $("#massType").val(),
        quantity = $("#quantity").val();


        updatePriceMass(massType, quantity, currency);

        $addToCartModal.modal("show");


};

var updatePriceMass = function (massType, quantity, currency) {

    console.log(currency);


        var productPrice = $("span#priceAddToCartModal").text();
        var baseMassType = $("span#massDefTypeAddToCart").text();

        var realProductPrice = $("#priceAddToCartModalRealApprox").val();

        var convertedMass = convertMass(massType, baseMassType, quantity);
        var totalPrice = convertedMass * accounting.unformat(productPrice);

        var totalRealPrice = convertedMass * realProductPrice;

        try {

            var formattedPrice = formatMoney(totalPrice,
                                             currency,
                                            "%v %s");

            if (formattedPrice == "NaN.undefined") throw "Price exceeded";

            console.log(convertedMass + " quantity: " + quantity);
            console.log("price: " + totalPrice);

            $("#totalWeight").val( ((quantity <= 0) ? 0 : quantity) + " " +  massType);
            $("#totalPrice").val(formattedPrice);
            $("#total-real-price-approx").val(totalRealPrice);

        } catch (err) {
            $("#totalPrice").val(err);
        }

    };