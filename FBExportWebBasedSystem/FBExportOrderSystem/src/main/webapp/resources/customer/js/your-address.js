$(document).ready(function () {
    
    var showEditAddressModal = function (shippingAddress) {

        var $editAddressModal = $("#editAddressModal");

        $editAddressModal.find("#address-type").val(shippingAddress.addressType);
        
        if (shippingAddress.addressType == "User Account Address") {
            console.log("tae");
            $editAddressModal.find("#address-type").attr("readonly", "readonly");
        } else {
            $editAddressModal.find("#address-type").removeAttr("readonly");
        }

        $editAddressModal.find("#receivers-name").val(shippingAddress.receiversFullName);
        
        
        $editAddressModal.find("#phone-number").val(shippingAddress.phonenumber);

        $editAddressModal.find("#city").val(shippingAddress.city);
        $editAddressModal.find("#zipcode").val(shippingAddress.zipcode);
        $editAddressModal.find("#address").val(shippingAddress.address);
        $editAddressModal.find("#shipping-instructions").val(shippingAddress.shippingInstructions);

       
        $editAddressModal.modal("toggle");
    };

    var editAddress = function () {
        var $card = $(this).closest(".card");

        var $list = $card.find("ul.list-unstyled>li");
        console.log($card.find("div.card-header").html().trim());
        console.log($list.eq(0).find("strong").html());
        
        var $span = $list.eq(1).find("span");

        console.log($span.eq(0).html());
        
        console.log($span.eq(1).html());
        console.log($span.eq(2).html());

        console.log($list.eq(2).html());
        console.log($list.eq(3).find("span").html());

        console.log($card.find("input[type=hidden]").val());

        showEditAddressModal({
            addressType : $card.find("div.card-header").find("span").html().trim(),
            receiversFullName : $list.eq(0).find("strong").html(),
            zipcode : $span.eq(0).html(),
            address : $span.eq(1).html(),
            city : $span.eq(2).html(),
            country : $list.eq(2).html(),
            countryCode : $list.eq(3).find("span").eq(0).html(),
            phonenumber : $list.eq(3).find("span").eq(1).html(),
            shippingInstructions : $card.find("input[type=hidden]").val()
        });
    };

    var setDefaultShippingAddress = function () {

         if (window.confirm("set default address?")) {
           
            var $newDefaultAddressBtn = $(this);
            var $prevDefaultAddressBtn = $("#addressList").find("a.disabled");

            var newId = $newDefaultAddressBtn.closest("div.card").attr("id");
            var prevId = $prevDefaultAddressBtn.closest("div.card").attr("id");


            $.post("/FBExportSystem/set-default-shipping-address", {
                prevDefaultShippingAddressId : prevId,
                newDefaultShippingAddressId : newId
            }, function () {
                
                $newDefaultAddressBtn.addClass("disabled").addClass("grey-text").removeClass("set-default-shipping-address");
              
                $prevDefaultAddressBtn.addClass("blue-text")
                                      .removeClass("grey-text")
                                      .removeClass("disabled")
                                      .addClass("set-default-shipping-address").click(setDefaultShippingAddress);


            });
        }

    };

    var deleteAddress = function () {

        if (window.confirm("delete?")) {
            var id = $(this).closest("div.card").attr("id");

            var $deletedAddressItem = $(this).closest("div.col-md-4");

            $.post("/FBExportSystem/delete-address", {
                deleteId : id
            }, function () {
                $deletedAddressItem.remove();
            });
        }

    };

    $(".set-default-shipping-address").click(setDefaultShippingAddress);

    $(".delete-address").click (deleteAddress);


    $("#add-address").click(function () {
        $("#addAddressModal").modal("toggle");
    });

    $(".btn-add").click(function () {
        
        var $addAddressModal = $("#addAddressModal");


        var shippingAddress = {
            addressType : $addAddressModal.find("#address-type").val(),
            receiverFullName : $addAddressModal.find("#receivers-name").val(),
            phoneNumber : $addAddressModal.find("#phone-number").val(),
            city : $addAddressModal.find("#city").val(),
            zipcode : $addAddressModal.find("#zipcode").val(),
            address : $addAddressModal.find("#address").val(),
            shippingInstructions : $addAddressModal.find("#shipping-instructions").val(),
            country : $addAddressModal.find("#country").find("option:first").val(),
            countryCode : $addAddressModal.find("#countryCode").find("option:first").val()
        };

        console.log(shippingAddress.addressType);
        console.log(shippingAddress.receiverFullName);
        console.log(shippingAddress.phoneNumber);
        console.log(shippingAddress.city);
        console.log(shippingAddress.zipcode);
        console.log(shippingAddress.address);
        console.log(shippingAddress.shippingInstructions);
        console.log(shippingAddress.country);
        console.log(shippingAddress.countryCode);

        $.post("/FBExportSystem/add-address", {
                shippingAddressJSON : JSON.stringify(shippingAddress)
        }, 
        function (response) {
            
            var shippingAddressTemplate = _.template($("#shippingAddressTemplate").html());
            
            shippingAddress.shippingAddressId = response;

            var shippingAddressItem = shippingAddressTemplate(shippingAddress);

            $("#addressList").append(shippingAddressItem);

            $("#addressList div.card:last .edit-address").click(editAddress);
            $("#addressList div.card:last .delete-address").click(deleteAddress);
            $("#addressList div.card:last .set-default-shipping-address").click(setDefaultShippingAddress);

            console.log(shippingAddressItem);

            $("#addAddressModal").modal("toggle");
            
        });

    });

    $(".edit-address").click(editAddress);




});