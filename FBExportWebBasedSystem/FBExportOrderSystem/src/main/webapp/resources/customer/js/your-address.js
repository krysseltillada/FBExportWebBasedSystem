$(document).ready(function () {

    var yourAddressModalProgressBarConfig = {
            template : 3
    };


    var resetAddAddressModal = function ($addAddressModal) {

        $addAddressModal.find("#address-type").val("");
        $addAddressModal.find("#receivers-name").val("");
        $addAddressModal.find("#phone-number").val("");
        $addAddressModal.find("#city").val("");
        $addAddressModal.find("#zipcode").val("");
        $addAddressModal.find("#address").val("");
        $addAddressModal.find("#shipping-instructions").val("");
        $addAddressModal.find(".country").find("option:selected").prop("selected", false);
        $addAddressModal.find(".countryCode").find("option:selected").prop("selected", false);
        $addAddressModal.find(".country").find("option:first").prop("selected", true);
        $addAddressModal.find(".countryCode").find("option:first").prop("selected", true);

        $addAddressModal.find(".errorMessage").html("");

    };

    var resetEditAddressModal = function ($editAddressModal) {

        $editAddressModal.find("#address-type").val("");
        $editAddressModal.find("#receivers-name").val("");
        $editAddressModal.find("#phone-number").val("");
        $editAddressModal.find("#city").val("");
        $editAddressModal.find("#zipcode").val("");
        $editAddressModal.find("#address").val("");
        $editAddressModal.find("#shipping-instructions").val("");
        $editAddressModal.find(".country").find("option:selected").prop("selected", false);
        $editAddressModal.find(".countryCode").find("option:selected").prop("selected", false);
        $editAddressModal.find(".country").find("option:first").prop("selected", true);
        $editAddressModal.find(".countryCode").find("option:first").prop("selected", true);

        $editAddressModal.find(".errorMessage").html("");

    };

    var changeShippingAddressCardDetails = function (shippingAddress, shippingAddressCardId) {
        var $shippingAddresssCardDetails = $("div.card[id=" + shippingAddressCardId + "]");

        console.log(shippingAddress);

        var $list = $shippingAddresssCardDetails.find("ul.list-unstyled>li");
        
        $shippingAddresssCardDetails.find("div.card-header>span").html(shippingAddress.addressType);

        $list.eq(0).find("strong").html(shippingAddress.receiverFullName);
        
        var $span = $list.eq(1).find("span");

        $span.eq(0).html(shippingAddress.zipcode);
        
        $span.eq(1).html(shippingAddress.address);
        $span.eq(2).html(shippingAddress.city);

        $list.eq(2).html(shippingAddress.country);
        $list.eq(3).find("span").eq(0).html(shippingAddress.countryCode);
        $list.eq(3).find("span").eq(1).html(shippingAddress.phoneNumber);

        $shippingAddresssCardDetails.find("input[type=hidden]").val(shippingAddress.shippingInstructions);

    };
    
    var showEditAddressModal = function (shippingAddress) {

        console.log(shippingAddress);

        var $editAddressModal = $("#editAddressModal");

        $editAddressModal.find("#shippingAddressId").val(shippingAddress.shippingAddressId);
        $editAddressModal.find("#address-type").val(shippingAddress.addressType);
        
        if (shippingAddress.addressType == "User Account") {
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

        console.log(shippingAddress.countryCode + " country code");

        
        console.log(shippingAddress.country + " country");

        $editAddressModal.find('.countryCode option:selected').prop('selected', false);
        $editAddressModal.find('.country option:selected').prop('selected', false);

        $editAddressModal.find('.countryCode option[value~="' + shippingAddress.countryCode + '"]').prop('selected', true);
        $editAddressModal.find('.country option[value*="' + shippingAddress.country + '"]').prop('selected', true);
       
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
            shippingAddressId : $card.attr("id"),
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

        var $newDefaultAddressBtn = $(this);
        var $prevDefaultAddressBtn = $("#addressList").find("a.disabled");

        var newId = $newDefaultAddressBtn.closest("div.card").attr("id");
        var prevId = $prevDefaultAddressBtn.closest("div.card").attr("id");

        alertify.okBtn("Confirm")
                .cancelBtn("Cancel")
                .confirm("Set this as default shipping address?", function () {
                
                    $.post("/FBExportSystem/set-default-shipping-address", {
                        prevDefaultShippingAddressId : prevId,
                        newDefaultShippingAddressId : newId
                    }, function () {
                        
                        $newDefaultAddressBtn.addClass("disabled").addClass("grey-text").removeClass("set-default-shipping-address").off("click");
                    
                        $prevDefaultAddressBtn.addClass("blue-text")
                                            .removeClass("grey-text")
                                            .removeClass("disabled")
                                            .addClass("set-default-shipping-address").click(setDefaultShippingAddress);

                        toastr.success('default shipping address set');

                    });
                  

                });

    };

    var deleteAddress = function () {
        
       var id = $(this).closest("div.card").attr("id");

       var $deletedAddressItem = $(this).closest("div.col-md-4");

        alertify.okBtn("Delete")
                .cancelBtn("Cancel")
                .confirm("Delete this shipping address?", function () {
                    console.log("tae");

                    $.post("/FBExportSystem/delete-address", {
                         deleteId : id
                    }, function (response) {

                        if (response == "success") {
                         $deletedAddressItem.remove();
                         toastr.success('shipping address deleted');
                        } else {
                            alertify.reset()
                                    .alert("cannot delete shipping address this is already a default one");
                        }

                    });

                });

    };

    $(".set-default-shipping-address").click(setDefaultShippingAddress);

    $(".delete-address").click (deleteAddress);


    $("#add-address").click(function () {
        $("#addAddressModal").modal("toggle");
    });

    $(".btn-add").click(function () {
    
        var $addAddressModal = $("#addAddressModal");

        var $btnAdd = $(this);

        $btnAdd.addClass("disabled");

        var shippingAddress = {
            addressType : $addAddressModal.find("#address-type").val(),
            receiverFullName : $addAddressModal.find("#receivers-name").val(),
            phoneNumber : $addAddressModal.find("#phone-number").val(),
            city : $addAddressModal.find("#city").val(),
            zipcode : $addAddressModal.find("#zipcode").val(),
            address : $addAddressModal.find("#address").val(),
            shippingInstructions : $addAddressModal.find("#shipping-instructions").val(),
            country : $addAddressModal.find(".country").find("option:selected").val(),
            countryCode : $addAddressModal.find(".countryCode").find("option:selected").val()
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

        yourAddressModalProgressBarConfig.parent = '#addAddressModal .modal-content';

        var addAddressModalProgressBar = new Mprogress(yourAddressModalProgressBarConfig);

        addAddressModalProgressBar.start();

        setTimeout(function () {
              $.post("/FBExportSystem/add-address", {
                shippingAddressJSON : JSON.stringify(shippingAddress)
                }, 
                function (response) {

                    if (response.status != "error") {
                        
                        var shippingAddressTemplate = _.template($("#shippingAddressTemplate").html());
                        
                        shippingAddress.shippingAddressId = response.id;

                        var shippingAddressItem = shippingAddressTemplate(shippingAddress);

                        $("#addressList").append(shippingAddressItem);

                        $("#addressList div.card:last .edit-address").click(editAddress);
                        $("#addressList div.card:last .delete-address").click(deleteAddress);
                        $("#addressList div.card:last .set-default-shipping-address").click(setDefaultShippingAddress);

                        console.log(shippingAddressItem);
                    
                        resetAddAddressModal($addAddressModal);
                
                        $("#addAddressModal").modal("toggle");

                        toastr.success('shipping address added');

                    } else {

                        

                        $addAddressModal.addClass('animated');
                        $addAddressModal.addClass('shake');

                        $addAddressModal.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                            $addAddressModal.removeClass('animated');
                            $addAddressModal.removeClass('shake');
                        });

                        
                        $addAddressModal.find(".errorMessage").html("*" + response.message);
                    }

                    addAddressModalProgressBar.end();
                    $btnAdd.removeClass("disabled");
                    
                }, "json");
        }, 1000);

      

    });

    $(".btn-edit").click(function () {

        var $editAddressModal = $("#editAddressModal");

        var $btnEdit = $(this);

        $btnEdit.addClass("disabled");

        var shippingAddress = {
            addressTo : $editAddressModal.find("#address-type").val(),
            shippingAddressId : parseInt($editAddressModal.find("#shippingAddressId").val()),
            addressType : $editAddressModal.find("#address-type").val(),
            receiverFullName : $editAddressModal.find("#receivers-name").val(),
            phoneNumber : $editAddressModal.find("#phone-number").val(),
            city : $editAddressModal.find("#city").val(),
            zipcode : $editAddressModal.find("#zipcode").val(),
            address : $editAddressModal.find("#address").val(),
            shippingInstructions : $editAddressModal.find("#shipping-instructions").val(),
            country : $editAddressModal.find(".country").find("option:selected").val(),
            countryCode : $editAddressModal.find(".countryCode").find("option:selected").val()
        };

        console.log(shippingAddress);

        yourAddressModalProgressBarConfig.parent = '#editAddressModal .modal-content';

        var editAddressModalProgressBar = new Mprogress(yourAddressModalProgressBarConfig);

        editAddressModalProgressBar.start();

        setTimeout(function () {
            $.post("/FBExportSystem/edit-address", {
                shippingAddressJSON : JSON.stringify(shippingAddress)
                },
                function (response) {
                    if (response.status != "error") {

                        changeShippingAddressCardDetails(shippingAddress, 
                                                        shippingAddress.shippingAddressId);

                        $editAddressModal.modal("toggle");

                        $editAddressModal.find(".errorMessage").html("");

                        toastr.success('shipping address edited');

                        
                        $btnEdit.removeClass("disabled");


                    } else {


                        $editAddressModal.addClass('animated');
                        $editAddressModal.addClass('shake');

                        $editAddressModal.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                            $editAddressModal.removeClass('animated');
                            $editAddressModal.removeClass('shake');
                        });

                        $btnEdit.removeClass("disabled");

                    
                        $editAddressModal.find(".errorMessage").html("*" + response.message);
                    }

                    editAddressModalProgressBar.end();
                },
                "json"
            );

        }, 1500);
       
    });

    $("#addAddressModal").on("hidden.bs.modal", function () {
        resetAddAddressModal($(this));
    });

    $("#editAddressModal").on("hidden.bs.modal", function () {
        resetEditAddressModal($(this));
    });

    $(".edit-address").click(editAddress);




});