$(document).ready(function () {

    $(".btnProductItemAddToCart").click(function (event) {
        var $card = $(event.currentTarget).parent().parent().parent();
        var $cardBody = $card.find("div.card-body");

        var $spansHeaderInfo = $card.find("div div div span");

        console.log($spansHeaderInfo.html());

        var productItem = {
            productImage : $card.find("img").attr("src"),
            price : $spansHeaderInfo.eq(0).text(),
            massType : $spansHeaderInfo.eq(1).find("span").text(),
            origin : $spansHeaderInfo.eq(3).text(),
            name : $cardBody.find("h4.card-title a").text(),
            description : $cardBody.find("p.card-text").text(),
            expirationDate : $cardBody.find("span span.red-text").text()
        };

        showAddToCartModal(productItem);



    });

});