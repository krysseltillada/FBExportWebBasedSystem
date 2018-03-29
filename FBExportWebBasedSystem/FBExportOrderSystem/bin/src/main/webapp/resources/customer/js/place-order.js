$(document).ready(function () {

    $(".shipping-address-radio-button").click(function () {

        var $shippingAddressRadioButton = $(this).find("input[type=radio]");
        $shippingAddressRadioButton.prop("checked", true);

    });

   $("#btn-add-shipping-address").click(function () {

        var $btnAdd = $(this);

        $btnAdd.addClass("disabled");

        var shippingAddress = {
            addressType : $("#address-to").val(),
            receiverFullName : $("#full-name").val(),
            phoneNumber : $("#phone-number").val(),
            city : $("#city").val(),
            zipcode : $("#zip-code").val(),
            address : $("#address").val(),
            shippingInstructions : $("#shipping-instructions").val(),
            country : $(".country").find("option:selected").val(),
            countryCode : $(".countryCode").find("option:selected").val()
        };

        console.log(shippingAddress);

        $.post("/FBExportSystem/add-address", {
            shippingAddressJSON : JSON.stringify(shippingAddress)
        }, function (response) {

            var $shippingAddressList = $("#shippingAddressList");

            if (response.status != "error") {

                console.log($("#shippingAddressPlaceOrderTemplate").html());

                var shippingAddressTemplate = _.template($("#shippingAddressPlaceOrderTemplate").html());
                
                shippingAddress.shippingAddressId = response.id;

                $shippingAddressList.append(shippingAddressTemplate(shippingAddress));

                $shippingAddressList.find(".shipping-address-radio-button").click(function () {
                    
                    var $shippingAddressRadioButton = $(this).find("input[type=radio]");
                    $shippingAddressRadioButton.prop("checked", true);

                });

                $("#addShippingAddressForm").collapse("hide");

                $('html, body').animate({
                    scrollTop: $("#place-order-header").offset().top
                }, 500);

            } else {
                $("#errorMessage").html("*" + response.message);
                $("#errorMessage").show();
            }

            $btnAdd.removeClass("disabled");

        }, "json")

   });


    



});