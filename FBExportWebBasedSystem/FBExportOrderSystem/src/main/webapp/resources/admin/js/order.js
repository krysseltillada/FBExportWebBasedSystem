
$(document).ready(function () {

    var toShipInformationModalProgressBarConfig = {
            template : 3
    };

    var orderStatusColors = new Map({ 
                                    "To Ship" : "#796AEE",
                                    // "Received" : "#0275D8",
                                    "Rejected" : "#D9534F",
                                    "Approved": "#5CB85C",
                                    "Pending": "#FFC107" 
                                    });


    $("#shipmentStatusComboBox").change(function () {
        
        if ($(this).val() == "On Cargo Ship") {
            $("#vesselStatusCollapseDiv").collapse("show");
        } else {
            $("#vesselStatusCollapseDiv").collapse("hide");
        }


    });

    $("#departureDatePicker").flatpickr();
    $("#arrivalDatePicker").flatpickr();
    
    var table = $('#orderTable').DataTable( {
        "language" : {
        "emptyTable" : "No orders found",
        "zeroRecords" : "No orders found"
        },
        "aLengthMenu": [5, 10, 25],
        "iDisplayLength": 5,
    
        "columns": [
        {
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta){
                    return '<input id="checkboxCustom1" type="checkbox" value="" class="checkbox-template checkbox-delete">';
                }
        },
        {"orderable" : false},
        {"orderable" : false},
        {"orderable" : false},
        {"orderable" : false},
        {"orderable" : false},
        {"orderable" : false}
        ],
        "order" : []
    }
    );

    $("div.dropdown-select").on("hidden.bs.dropdown", function () {
        var $dropdownMenu = $(this);

        if ($dropdownMenu.find("a.dropdown-item").length > 0) 
        $dropdownMenu.find("a.dropdown-item").remove();

        table.rows().invalidate();

    });

    $(".btn-save-to-ship-information").click(function () {

        var toShipInformation = {
            shipmentStatus : $("#shipmentStatusComboBox").val(),
            departureDate : $("#departureDatePicker").val(),
            arrivalDate : $("#arrivalDatePicker").val(),
            vesselName : $("#vessel-name").val(),
            mmsiNumber : $("#mmsi-number").val(),
            imoNumber : $("#imo-number").val(),
            destination : $("#destination").val()
        };

        toShipInformationModalProgressBarConfig.parent = "#toShipInformationModal .modal-content";

        var toShipInformationModalProgressBar = new Mprogress(toShipInformationModalProgressBarConfig);

        toShipInformationModalProgressBar.start();

        setTimeout(function () {

            $.post("/FBExportSystem/admin/orders/add-to-ship-information", {
                toShipInformationJSON : JSON.stringify(toShipInformation)
                },
                function (response) {
                    if (response.status != "error") {

                        console.log("tae");

                    } else {
                    
                        $("#toShipInformationModal").css("z-index", "10");
                        $(".modal-backdrop").css("z-index", "10");
                    
                        alertify.reset()
                                .alert(response.message, function () {
                                    
                                    $("#toShipInformationModal").css("z-index", "");
                                    $(".modal-backdrop").css("z-index", "");

                                });

                        $(".alertify").css("z-index", "10");
                    }

                    toShipInformationModalProgressBar.end();

                }, "json");

            }, 1000);
    });

    $("div.dropdown-select").on("show.bs.dropdown", function () {
        
        var $dropdownMenu = $(this).find("div.dropdown-menu");
        var $dropDownSelect = $(this);

        console.log("open");

        orderStatusColors.forEach(function (color, key) {
            $dropdownMenu.find(".dropdown-header")
                        .after('<a class = "dropdown-item pointerable">' + key + '</a>')
                        .next().click(function () {

                            var orderStatus = $(this).html();
                            var $dropDownSelectButton = $(this).parent().parent().find("button");
                            var $btnOrderStatus = $dropDownSelect.find("button.dropdown-toggle");

                            alertify.okBtn("Mark it")
                                    .confirm("Mark it as " + orderStatus + "?", function (ev) {

                                var nonPromptStatus = [
                                    "Pending",
                                    "Received",
                                    "Returned",
                                    "Cancelled",
                                    "Refund",
                                    "Paid"
                                ];

                                        // PENDING, x
                                        // APPROVED,
                                        // REJECTED,
                                        // RECEIVED, x
                                        // TO_SHIP, 
                                        // PAID, x
                                        // RETURNED, x
                                        // CANCELLED x
                                        // REFUND x
                            
                                
                               
                                
                                console.log(orderStatus);

                                if (!nonPromptStatus.includes(orderStatus)) {

                                    switch (orderStatus) {
                                        case  "Approved":

                                            alertify.okBtn("save")
                                                    .defaultValue("your order has been approved")  
                                                    .prompt("provide a reminder message to the customer", function (val, event) {
                                                        
                                                        console.log(val);

                                                        console.log(orderStatusColors.get(orderStatus));

                                                        $btnOrderStatus.attr("disabled", "disabled");

                                                        iziToast.show({
                                                                message: 'approving order...',
                                                                icon : "",
                                                                timeout : false,
                                                                close : false,
                                                                onOpening : function (instance, toast) {

                                                                setTimeout(function () {

                                                                    $.post("/FBExportSystem/admin/orders/markApproved", {
                                                                        id : $btnOrderStatus.closest("tr").find("#orderId").html(),
                                                                        message : val
                                                                    }, function (response) {

                                                                        $(toast).fadeOut("slow", function () {
                                                                                $(this).remove();
                                                                        });

                                                                        iziToast.success({
                                                                                timeout : 2000,
                                                                                progressBar : false,
                                                                                message : "order is approved"
                                                                        });

                                                                        $btnOrderStatus.removeAttr("disabled");

                                                                        $dropDownSelectButton.html(orderStatus);

                                                                        $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                        $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                    });

                                                                }, 1000);

                                                        }});

                                            });

                                        break;
                                        case "Rejected":
                                            alertify.okBtn("save")
                                                    .defaultValue("your order has been rejected")  
                                                    .prompt("provide a reason for rejection to the customer", function (val, event) {

                                                        $btnOrderStatus.attr("disabled", "disabled");
                                                        
                                                        iziToast.show({
                                                                message: 'rejecting order...',
                                                                icon : "",
                                                                timeout : false,
                                                                close : false,
                                                                onOpening : function (instance, toast) {

                                                                    setTimeout(function () {

                                                                    $.post("/FBExportSystem/admin/orders/markRejected", {
                                                                            id : $btnOrderStatus.closest("tr").find("#orderId").html(),
                                                                            reason : val
                                                                        }, function (response) {

                                                                            $(toast).fadeOut("slow", function () {
                                                                                    $(this).remove();
                                                                            });

                                                                            iziToast.success({
                                                                                    timeout : 2000,
                                                                                    progressBar : false,
                                                                                    message : "order is rejected"
                                                                            });

                                                                            $btnOrderStatus.removeAttr("disabled");

                                                                            $dropDownSelectButton.html(orderStatus);

                                                                            $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                            $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                        });

                                                                    }, 1000);

                                                                }
                                                         });

                                                        console.log(val);

                                            });

                                            break;

                                        case "To Ship":

                                             $("#toShipInformationModal").modal("show");
                                            
                                        break;
                                    }

                                    $(".alertify").css("z-index", "10");


                                } else {

                                    $btnOrderStatus.attr("disabled", "disabled");

                                    iziToast.show({
                                                message: orderStatus + ' order...',
                                                icon : "",
                                                timeout : false,
                                                close : false,
                                                onOpening : function (instance, toast) {

                                                    setTimeout(function () {
                                                
                                                        $.post("/FBExportSystem/admin/orders/mark" + orderStatus, {
                                                            id : $btnOrderStatus.closest("tr").find("#orderId").html()
                                                        }, function (response) {

                                                            $(toast).fadeOut("slow", function () {
                                                                    $(this).remove();
                                                            });

                                                            iziToast.success({
                                                                    timeout : 2000,
                                                                    progressBar : false,
                                                                    message : "order is " + orderStatus
                                                            });

                                                            $btnOrderStatus.removeAttr("disabled");

                                                            $dropDownSelectButton.html(orderStatus);

                                                            $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                            $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                        });

                                                    }, 1000);

                                    }});
                                   
                                }

                            });

                            $(".alertify").css("z-index", "10");

                        });
        });

    });

    $('.fa-chevron-circle-down').click(function () {
        var parentRow = $(this).closest('tr');
        var row = table.row(parentRow);

        if (row.child.isShown()) {
            
            $(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
            
            $('div.slider', row.child()).slideUp(function () {
                row.child.hide();
            });

        } else {
        
            var rowProductRowCollapse = $("#collapsingOrderDiv").html();
            var shipTrackingMap = $("#shipMapTrackingTemplate").html();

            var orderId = $(this).closest("tr").find("#orderId").html();

            $.post("/FBExportSystem/admin/orders/get-order-details", {
                id : orderId
            }, function (response) {
                console.log(response);

                var rowProductRowCollapseTemplate = _.template(rowProductRowCollapse);

                row.child(rowProductRowCollapseTemplate({
                    order : response,
                    cartItems : response.cart.items
                }), 'no-padding').show();

                $(row.child()).find("#updateVesselStatus").click(function () {
                    var marineTrafficLiveMapFrame = $(this).parent().parent().parent().find("#marinetraffic").get(0);
                    marineTrafficLiveMapFrame.src = marineTrafficLiveMapFrame.src;
                });

                $(row.child()).find("#vesselStatusCollapseItem").on("shown.bs.collapse", function () {
                    var a = $(this).find(".shipTrackingMap").append(shipTrackingMap);
                    
                    $(a).find("iframe").on("load", function () {
                        console.log("ate 2");
                    });
                });

                $(row.child()).find("#vesselStatusCollapseItem").on("hidden.bs.collapse", function () {
                    $(this).find(".shipTrackingMap").html("");
                });

                $(this).removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up");
                
                $('div.slider', row.child()).slideDown(function () {
                    $(this).parent().removeAttr('class').parent().removeAttr('class');
                });
                
                $('div.slider').css("display", "flex");

            }, "json");

           
        }

    });

    $("#checkbox-all").click(function () {

        $("#orderTable").find("tr:not(:first) input.checkbox-template")
                            .prop("checked", $(this).prop("checked"));


    });

    $(".checkbox-delete").change(function () {

    if ($("#orderTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

        $("a#deleteProduct").removeClass("text-muted").addClass("text-red").css("cursor", "pointer");
    } else {

        $("a#deleteProduct").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed");
    }
    });

});