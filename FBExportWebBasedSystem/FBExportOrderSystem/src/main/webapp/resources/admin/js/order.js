
$(document).ready(function () {

    var shipTrackingMapRawTemplate = $("#shipMapTrackingTemplate").html();

    var checkAllowDelete = function () {

		

		if ($("#inventoryTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

			$("a#delete-selected-product").removeClass("text-muted").addClass("text-red").css("cursor", "pointer")
																						.css("pointer-events", "auto");
		} else {

			$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																						.css("pointer-events", "none");
		}
	};

    var modalProgressBarConfig = {
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

    $("#expectedDatePicker").flatpickr();
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
        "order" : [],
        "fnDrawCallback" : function (oSettings) {
				checkAllowDelete();
				console.log("tae");
			}
    }
    );

    $("#orderTable").on("hidden.bs.dropdown", "div.dropdown-select", function () {
        var $dropdownMenu = $(this);

        if ($dropdownMenu.find("a.dropdown-item").length > 0) 
        $dropdownMenu.find("a.dropdown-item").remove();

        table.rows().invalidate();

    });

    $(".btn-save-to-ship-information").click(function () {

        var toShipInformation = {
            orderId : $("#toShipInformationModal #orderModalId").val(),
            shipmentStatus : $("#toShipInformationModal #shipmentStatusComboBox").val(),
            expectedDate : $("#toShipInformationModal #expectedDatePicker").val(),
            departureDate : $("#toShipInformationModal #departureDatePicker").val(),
            arrivalDate : $("#toShipInformationModal #arrivalDatePicker").val(),
            vesselName : $("#toShipInformationModal #vessel-name").val(),
            mmsiNumber : $("#toShipInformationModal #mmsi-number").val(),
            imoNumber : $("#toShipInformationModal #imo-number").val(),
            destination : $("#toShipInformationModal #destination").val()
        };

        modalProgressBarConfig.parent = "#toShipInformationModal .modal-content";

        var toShipInformationModalProgressBar = new Mprogress(modalProgressBarConfig);

        toShipInformationModalProgressBar.start();

        setTimeout(function () {

            $.post("/FBExportSystem/admin/orders/add-to-ship-information", {
                toShipInformationJSON : JSON.stringify(toShipInformation)
                },
                function (response) {

                    console.log(response);

                    if (response.status != "error") {

                        $.post("/FBExportSystem/admin/orders/get-order-details", {
                            id : toShipInformation.orderId
                        }, function (response) {

                            console.log(response);

                            $("#toShipInformationModal").modal("hide");
                            
                            var $currentOrderRow = $("#orderId-" + toShipInformation.orderId).closest("tr");
                            var shipmentStatusDisplay = (toShipInformation.shipmentStatus == "On Cargo Ship") ? 'On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i>' :
                                                                                              'On Truck <i class="fa fa-truck ml-1" aria-hidden="true"></i>';

                            $currentOrderRow.find("td:eq(6) span span:eq(1)").html(toShipInformation.expectedDate);

                            $currentOrderRow.find("td:eq(3) span#shipmentStatus").html(shipmentStatusDisplay);

                            var $orderDetailsRow = $currentOrderRow.next();

                            if (!$orderDetailsRow.hasClass("odd") && !$orderDetailsRow.hasClass("even")) {
                                $orderDetailsRow.find("ul.nav-tabs li:eq(0)")
                                                .after('<li class="nav-item">' +
                                                        '<a class="nav-link" data-toggle="tab" href="#shipping-order-tab-id-' + toShipInformation.orderId + '" role="tab">Shipping</a>' + 
                                                        '</li>');

                                var shippingDivOrderRawTemplate = $("#shippingDivOrderTemplate").html();
                                var shippingDivOrderTemplate = _.template(shippingDivOrderRawTemplate);

                                $orderDetailsRow.find("div.tab-content").append(shippingDivOrderTemplate({
                                   order : response
                                }));

                                $orderDetailsRow.find("#shipmentStatusComboBox").change(function () {
                                    console.log($(this).closest("tr").prev().find("#orderId").html());

                                    if ($(this).val() == "On Cargo Ship") {
                                        $("#vesselStatusCollapseDiv-id-" + toShipInformation.orderId).collapse("show");
                                    } else {
                                        $("#vesselStatusCollapseDiv-id-" + toShipInformation.orderId).collapse("hide");
                                    }
                                });

                                $orderDetailsRow.find("#expectedDatePicker").flatpickr();
                                $orderDetailsRow.find("#departureDatePicker").flatpickr();
                                $orderDetailsRow.find("#arrivalDatePicker").flatpickr();   
                                $orderDetailsRow.find("#shippingLogDatePicker").flatpickr();
                                $orderDetailsRow.find("#shippingLogTimePicker").flatpickr({
                                    enableTime : true,
                                    dateFormat : "h:i K",
                                    noCalendar : true,
                                    time_24hr : false
                                });

                                $orderDetailsRow.find("#btn-update-shipping-info").click(function () {

                                    var $btnUpdateShippingInfo = $(this);

                                    var $updateShippingDiv = $btnUpdateShippingInfo.closest("div#updateShipping-id-" + toShipInformation.orderId);
                                    var $shippingInformationDiv = $updateShippingDiv.closest("div#shippingInformationCollapseItem-id-" + toShipInformation.orderId);
                                    var id = toShipInformation.orderId;
                            
                                    var shippingInformation = {
                                        orderId : id,
                                        shipmentStatus : $updateShippingDiv.find("#shipmentStatusComboBox").val(),
                                        expectedDate : $updateShippingDiv.find("#expectedDatePicker").val(),
                                        departureDate : $updateShippingDiv.find("#departureDatePicker").val(),
                                        arrivalDate : $updateShippingDiv.find("#arrivalDatePicker").val(),
                                        vesselName : $updateShippingDiv.find("#vessel-name").val(),
                                        mmsiNumber : $updateShippingDiv.find("#mmsi-number").val(),
                                        imoNumber : $updateShippingDiv.find("#imo-number").val(),
                                        destination : $updateShippingDiv.find("#destination").val()
                                    };

                                    console.log(shippingInformation);

                                    
                                    $.post("/FBExportSystem/admin/orders/validateShippingInformation", {
                                        shippingInformationJSON : JSON.stringify(shippingInformation)
                                    },
                                    function (response) {

                                        if (response.status == "success") {

                                            $btnUpdateShippingInfo.attr("disabled", "disabled");

                                            $.post("/FBExportSystem/admin/orders/updateShippingInformation", {
                                                shippingInformationJSON : JSON.stringify(shippingInformation)
                                            }, function () {

                                                $btnUpdateShippingInfo.removeAttr("disabled");
                                                $updateShippingDiv.find("#errorMessage").hide();
                                                
                                                switch (shippingInformation.shipmentStatus) {

                                                case "On Cargo Ship":

                                                    if ($shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).length <= 0) {
                                                        console.log("can add vessel status div");

                                                        var vesselStatusDivRawTemplate = $("#vesselStatusDivTemplate").html();
                                                        var vesselStatusDivTemplate = _.template(vesselStatusDivRawTemplate);

                                                        $shippingInformationDiv.find("br").after(vesselStatusDivTemplate({
                                                            orderId : shippingInformation.orderId,
                                                            vesselName : shippingInformation.vesselName,
                                                            imoNumber : shippingInformation.imoNumber,
                                                            mmsiNumber : shippingInformation.mmsiNumber,
                                                            destination : shippingInformation.destination
                                                        }));


                                                        $shippingInformationDiv.find("#updateVesselStatus").click(function () {
                                                            var marineTrafficLiveMapFrame = $(this).parent().parent().parent().find("#marinetraffic").get(0);
                                                            marineTrafficLiveMapFrame.src = marineTrafficLiveMapFrame.src;
                                                        });

                                                        $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).on("shown.bs.collapse", function () {
                                                            var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                                                            var a = $(this).find(".shipTrackingMap").append(shipTrackingMapTemplate({
                                                                mmsi : shippingInformation.mmsiNumber
                                                            }));
                                                            
                                                            $(a).find("iframe").on("load", function () {
                                                                console.log("ate 2");
                                                            });
                                                        });

                                                        $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).on("hidden.bs.collapse", function () {
                                                            $(this).find(".shipTrackingMap").html("");
                                                        });
                                                        
                                                        
                                                        
                                                    } else {

                                                        var $vesselStatusCollapseDiv =  $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId);

                                                        $vesselStatusCollapseDiv.find("#vesselName").html(shippingInformation.vesselName);
                                                        $vesselStatusCollapseDiv.find("#imoNumber").html(shippingInformation.imoNumber);
                                                        $vesselStatusCollapseDiv.find("#mmsiNumber").html(shippingInformation.mmsiNumber);
                                                        $vesselStatusCollapseDiv.find("#destination").html(shippingInformation.destination);

                                                        if ($vesselStatusCollapseDiv.find("#marinetraffic").length > 0) {

                                                            $vesselStatusCollapseDiv.find(".shipTrackingMap").html("");

                                                            var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                                                            var a = $vesselStatusCollapseDiv.find(".shipTrackingMap").append(shipTrackingMapTemplate({
                                                                mmsi : shippingInformation.mmsiNumber
                                                            }));
                                                            
                                                            $(a).find("iframe").on("load", function () {
                                                                console.log("ate 2");
                                                            });

                                                        }


                                                    }

                                                    $shippingInformationDiv.find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');
                                                    $shippingInformationDiv.find("#departureDate").html(shippingInformation.departureDate);
                                                    $shippingInformationDiv.find("#arrivalDate").html(shippingInformation.arrivalDate);
                                                    $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');
                                                    $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(shippingInformation.expectedDate);

                                                break;

                                                case "On Truck":

                                                    if ($shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).length > 0) {
                                                        var $vesselStatusHeaderDiv = $shippingInformationDiv.find("i.fa-chevron-circle-down").parent();
                                                        var $vesselStatusHR = $vesselStatusHeaderDiv.next();
                                                        var $vesselStatusDiv = $vesselStatusHR.next();

                                                        $vesselStatusHeaderDiv.remove();
                                                        $vesselStatusHR.remove();
                                                        $vesselStatusDiv.remove();

                                                    }

                                                    $shippingInformationDiv.find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');
                                                    $shippingInformationDiv.find("#departureDate").html(shippingInformation.departureDate);
                                                    $shippingInformationDiv.find("#arrivalDate").html(shippingInformation.arrivalDate);
                                                    $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');
                                                    $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(shippingInformation.expectedDate);

                                                break;

                                                }

                                            });

                                            $btnUpdateShippingInfo.closest("div.collapse").collapse("hide");

                                            $updateShippingDiv.find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
                                            $updateShippingDiv.find("#vesselStatusCollapseDiv").collapse("hide");
                                            $updateShippingDiv.find("#expectedDatePicker").val("");
                                            $updateShippingDiv.find("#departureDatePicker").val("");
                                            $updateShippingDiv.find("#arrivalDatePicker").val("");
                                            $updateShippingDiv.find("#vessel-name").val("");
                                            $updateShippingDiv.find("#mmsi-number").val("");
                                            $updateShippingDiv.find("#imo-number").val("");
                                            $updateShippingDiv.find("#destination").val("");



                                        } else {

                                            $updateShippingDiv.find("#errorMessage").html("*" + response.message);
                                            $updateShippingDiv.find("#errorMessage").show();
                    
                                        }


                                    }, "json");


                                    console.log($(this).closest("tr").prev().find("#orderId").html());

                                    

                                });


                                $orderDetailsRow.find("#btn-cancel-shipping-info").click(function () {

                                    $(this).closest("div.collapse").collapse("hide");

                                    var $shippingUpdateDiv = $(this).closest("#updateShipping-id-" + toShipInformation.orderId);
                                
                                    $shippingUpdateDiv.find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
                                    $shippingUpdateDiv.find("#vesselStatusCollapseDiv").collapse("hide");
                                    $shippingUpdateDiv.find("#expectedDatePicker").val("");
                                    $shippingUpdateDiv.find("#departureDatePicker").val("");
                                    $shippingUpdateDiv.find("#arrivalDatePicker").val("");
                                    $shippingUpdateDiv.find("#vessel-name").val("");
                                    $shippingUpdateDiv.find("#mmsi-number").val("");
                                    $shippingUpdateDiv.find("#imo-number").val("");
                                    $shippingUpdateDiv.find("#destination").val("");
                                
                                });
                                
                                $orderDetailsRow.find("#updateVesselStatus").click(function () {
                                    var marineTrafficLiveMapFrame = $(this).parent().parent().parent().find("#marinetraffic").get(0);
                                    marineTrafficLiveMapFrame.src = marineTrafficLiveMapFrame.src;
                                
                                    console.log("update");
                                
                                });


                                $orderDetailsRow.find("#vesselStatusCollapseItem-id-" + toShipInformation.orderId).on("shown.bs.collapse", function () {
                                
                                    var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                                    var a = $(this).find(".shipTrackingMap").append(shipTrackingMapTemplate({
                                        mmsi : response.shipping.vesselStatus.mmsiNumber
                                    }));
                                    
                                    $(a).find("iframe").on("load", function () {
                                        console.log("ate 2");
                                    });

                                });

                                $orderDetailsRow.find("#vesselStatusCollapseItem-id-" + toShipInformation.orderId).on("hidden.bs.collapse", function () {
                                    $(this).find(".shipTrackingMap").html("");
                                });

                            }

                            var $dropDownSelectButton = $currentOrderRow.find("button.dropdown-toggle")

                            $dropDownSelectButton.html("To ship");

                            $dropDownSelectButton.css("background-color", orderStatusColors.get("To Ship"));
                            $dropDownSelectButton.css("border-color", orderStatusColors.get("To Ship"));




                            toShipInformationModalProgressBar.end();
                        }, "json");

                    } else {
                    
                        $("#toShipInformationModal").css("z-index", "10");
                        $(".modal-backdrop").css("z-index", "10");
                    
                        alertify.reset()
                                .alert(response.message, function () {
                                    
                                    $("#toShipInformationModal").css("z-index", "");
                                    $(".modal-backdrop").css("z-index", "");

                                });

                        $(".alertify").css("z-index", "10");

                        toShipInformationModalProgressBar.end();
                    }

                    

                }, "json");

            }, 1000);
    });

    $("#orderTable").on("show.bs.dropdown", "div.dropdown-select", function () {
        
        var $dropdownMenu = $(this).find("div.dropdown-menu");
        var $dropDownSelect = $(this);
        var orderId = $dropDownSelect.closest("tr").find("#orderId").html();

        

        console.log("open");

        orderStatusColors.forEach(function (color, key) {
            $dropdownMenu.find(".dropdown-header")
                        .after('<a class = "dropdown-item pointerable">' + key + '</a>')
                        .next().click(function () {

                            var orderStatus = $(this).html();
                            var $dropDownSelectButton = $(this).parent().parent().find("button");
                            var $btnOrderStatus = $dropDownSelect.find("button.dropdown-toggle");
                            var $row = $(this).closest("tr");
                            var $nextSiblingRow = $row.closest("tr").next();

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

                                            $.post("/FBExportSystem/admin/orders/checkShippingExists", {
                                                orderId : $btnOrderStatus.closest("tr").find("#orderId").html()
                                            }, function (isShippingExists) {

                                                if (!isShippingExists) {

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

                                                    $(".alertify").css("z-index", "10");


                                                } else {

                                                    alertify.okBtn("yes")
                                                            .confirm("shipping information exists marking it as approved will erase all shipping information continue?",
                                                            function () {

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

                                                                                            $row.find("#shipmentStatus").html("Shipment status not defined.");
                                                                                            $row.find("td:eq(6) span span:eq(1)").html("None");

                                                                                            $nextSiblingRow.find("ul.nav-tabs>li:eq(1)").remove();
                                                                                            $nextSiblingRow.find("div.tab-content>div:eq(1)").remove();

                                                                                            $nextSiblingRow.find("ul.nav-tabs>li:eq(0) a").tab("show");

                                                                                            $btnOrderStatus.removeAttr("disabled");

                                                                                            $dropDownSelectButton.html(orderStatus);

                                                                                            $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                                            $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                                        });

                                                                                    }, 1000);

                                                                            }});

                                                                });

                                                                $(".alertify").css("z-index", "10");

                                                            });

                                                            $(".alertify").css("z-index", "10");
                                                    
                                                }

                                            }, "json")

                                        break;
                                        case "Rejected":

                                            $.post("/FBExportSystem/admin/orders/checkShippingExists", {
                                                orderId : $btnOrderStatus.closest("tr").find("#orderId").html()
                                            }, function (isShippingExists) {
                                                if(!isShippingExists) {

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

                                                    });

                                                    $(".alertify").css("z-index", "10");


                                                } else {

                                                    alertify.okBtn("yes")
                                                            .confirm("shipping information exists marking it as rejected will erase all shipping information continue?",
                                                            function () {

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

                                                                                                $row.find("#shipmentStatus").html("Shipment status not defined.");
                                                                                                $row.find("td:eq(6) span span:eq(1)").html("None");

                                                                                                $nextSiblingRow.find("ul.nav-tabs>li:eq(1)").remove();
                                                                                                $nextSiblingRow.find("div.tab-content>div:eq(1)").remove();

                                                                                                $nextSiblingRow.find("ul.nav-tabs>li:eq(0) a").tab("show");

                                                                                                $btnOrderStatus.removeAttr("disabled");

                                                                                                $dropDownSelectButton.html(orderStatus);

                                                                                                $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                                                $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                                            });

                                                                                        }, 1000);

                                                                                    }
                                                                            });

                                                                });

                                                                $(".alertify").css("z-index", "10");


                                                        });

                                                        $(".alertify").css("z-index", "10");

                                                }
                                            });

                                            break;

                                        case "To Ship":

                                             var id = orderId;

                                             $.post("/FBExportSystem/admin/orders/checkShippingExists", {
                                                 orderId : id
                                             }, function (responseShippingExists) {

                                                if (!responseShippingExists) {
                                                    $("#toShipInformationModal").find("#orderModalId").val(orderId);
                                                    $("#toShipInformationModal").modal("show");
                                                } else {

                                                iziToast.show({
                                                            message: 'marking order as to ship...',
                                                            icon : "",
                                                            timeout : false,
                                                            close : false,
                                                            onOpening : function (instance, toast) {

                                                                setTimeout(function () {

                                                                $.post("/FBExportSystem/admin/orders/markToShip", {
                                                                        id : $btnOrderStatus.closest("tr").find("#orderId").html()
                                                                    }, function (response) {

                                                                        $(toast).fadeOut("slow", function () {
                                                                                $(this).remove();
                                                                        });

                                                                        iziToast.success({
                                                                                timeout : 2000,
                                                                                progressBar : false,
                                                                                message : "order is marked as to ship"
                                                                        });

                                                                        $btnOrderStatus.removeAttr("disabled");

                                                                        $dropDownSelectButton.html(orderStatus);

                                                                        $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                        $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                    });

                                                                }, 1000);

                                                            }
                                                        });
                                                    
                                                
                                                }

                                             }, "json");

                                             
                                            
                                        break;
                                    }

                                    $(".alertify").css("z-index", "10");


                                } else {

                                    if (orderStatus == "Pending") {

                                        $.post("/FBExportSystem/admin/orders/checkShippingExists", {
                                                orderId : $btnOrderStatus.closest("tr").find("#orderId").html()
                                            }, function (isShippingExists) {

                                                if (!isShippingExists) {

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

                                                } else {

                                                    alertify.okBtn("yes")
                                                            .confirm("shipping information exists marking it as pending will erase all shipping information continue?", function () {

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

                                                                                        $row.find("#shipmentStatus").html("Shipment status not defined.");
                                                                                        $row.find("td:eq(6) span span:eq(1)").html("None");

                                                                                        $nextSiblingRow.find("ul.nav-tabs>li:eq(1)").remove();
                                                                                        $nextSiblingRow.find("div.tab-content>div:eq(1)").remove();

                                                                                        $nextSiblingRow.find("ul.nav-tabs>li:eq(0) a").tab("show");

                                                                                        $btnOrderStatus.removeAttr("disabled");

                                                                                        $dropDownSelectButton.html(orderStatus);

                                                                                        $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                                                                                        $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));

                                                                                    });

                                                                                }, 1000);

                                                                }});

                                                            });

                                                            $(".alertify").css("z-index", "10");

                                                }
                                        });

                                        

                                    } 
                                   
                                }

                            });

                            $(".alertify").css("z-index", "10");

                        });
        });

    });

    $('#orderTable').on("click", "tr[role='row'] .fa-chevron-circle-down", function () {
        var parentRow = $(this).closest('tr');
        var row = table.row(parentRow);

        if (row.child.isShown()) {
            
            $(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
            
            $('div.slider', row.child()).slideUp(function () {
                row.child.hide();
            });

        } else {
        
            var rowProductRowCollapse = $("#collapsingOrderDiv").html();
           

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

                $(row.child()).find("#vesselStatusCollapseItem-id-" + response.orderId).on("shown.bs.collapse", function () {
                    var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                    var a = $(this).find(".shipTrackingMap").append(shipTrackingMapTemplate({
                        mmsi : response.shipping.vesselStatus.mmsiNumber
                    }));
                    
                    $(a).find("iframe").on("load", function () {
                        console.log("ate 2");
                    });
                });

                $(row.child()).find("#shipmentStatusComboBox").change(function () {
                     console.log($(this).closest("tr").prev().find("#orderId").html());

                    if ($(this).val() == "On Cargo Ship") {
                        $("#vesselStatusCollapseDiv-id-" + orderId).collapse("show");
                    } else {
                        $("#vesselStatusCollapseDiv-id-" + orderId).collapse("hide");
                    }
                });

                $(row.child()).find("#expectedDatePicker").flatpickr();
                $(row.child()).find("#departureDatePicker").flatpickr();
                $(row.child()).find("#arrivalDatePicker").flatpickr();

                $(row.child()).find("#shippingLogDatePicker").flatpickr();
                $(row.child()).find("#shippingLogTimePicker").flatpickr({
                    enableTime : true,
                    dateFormat : "h:i K",
                    noCalendar : true,
                    time_24hr : false
                });

                $(row.child()).find("#btn-update-shipping-info").click(function () {

                    var $btnUpdateShippingInfo = $(this);

                    var $updateShippingDiv = $btnUpdateShippingInfo.closest("div#updateShipping-id-" + orderId);
                    var $shippingInformationDiv = $updateShippingDiv.closest("div#shippingInformationCollapseItem-id-" + orderId);
                    var id = orderId;

                    var shippingInformation = {
                        orderId : id,
                        shipmentStatus : $updateShippingDiv.find("#shipmentStatusComboBox").val(),
                        expectedDate : $updateShippingDiv.find("#expectedDatePicker").val(),
                        departureDate : $updateShippingDiv.find("#departureDatePicker").val(),
                        arrivalDate : $updateShippingDiv.find("#arrivalDatePicker").val(),
                        vesselName : $updateShippingDiv.find("#vessel-name").val(),
                        mmsiNumber : $updateShippingDiv.find("#mmsi-number").val(),
                        imoNumber : $updateShippingDiv.find("#imo-number").val(),
                        destination : $updateShippingDiv.find("#destination").val()
                    };

                    console.log(shippingInformation);

                    
                    $.post("/FBExportSystem/admin/orders/validateShippingInformation", {
                        shippingInformationJSON : JSON.stringify(shippingInformation)
                    },
                    function (response) {

                        if (response.status == "success") {

                            $btnUpdateShippingInfo.attr("disabled", "disabled");

                            $.post("/FBExportSystem/admin/orders/updateShippingInformation", {
                                shippingInformationJSON : JSON.stringify(shippingInformation)
                            }, function () {

                                $btnUpdateShippingInfo.removeAttr("disabled");
                                $updateShippingDiv.find("#errorMessage").hide();
                                
                                switch (shippingInformation.shipmentStatus) {

                                    case "On Cargo Ship":

                                        if ($shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + orderId).length <= 0) {
                                            console.log("can add vessel status div");

                                            var vesselStatusDivRawTemplate = $("#vesselStatusDivTemplate").html();
                                            var vesselStatusDivTemplate = _.template(vesselStatusDivRawTemplate);

                                            $shippingInformationDiv.find("br").after(vesselStatusDivTemplate({
                                                orderId : shippingInformation.orderId,
                                                vesselName : shippingInformation.vesselName,
                                                imoNumber : shippingInformation.imoNumber,
                                                mmsiNumber : shippingInformation.mmsiNumber,
                                                destination : shippingInformation.destination
                                            }));


                                            $shippingInformationDiv.find("#updateVesselStatus").click(function () {
                                                var marineTrafficLiveMapFrame = $(this).parent().parent().parent().find("#marinetraffic").get(0);
                                                marineTrafficLiveMapFrame.src = marineTrafficLiveMapFrame.src;
                                            });

                                            $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).on("shown.bs.collapse", function () {
                                                var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                                                var a = $(this).find(".shipTrackingMap").append(shipTrackingMapTemplate({
                                                    mmsi : shippingInformation.mmsiNumber
                                                }));
                                                
                                                $(a).find("iframe").on("load", function () {
                                                    console.log("ate 2");
                                                });
                                            });

                                            $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId).on("hidden.bs.collapse", function () {
                                                $(this).find(".shipTrackingMap").html("");
                                            });
                                            
                                            
                                            
                                        } else {

                                            var $vesselStatusCollapseDiv =  $shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + shippingInformation.orderId);

                                            $vesselStatusCollapseDiv.find("#vesselName").html(shippingInformation.vesselName);
                                            $vesselStatusCollapseDiv.find("#imoNumber").html(shippingInformation.imoNumber);
                                            $vesselStatusCollapseDiv.find("#mmsiNumber").html(shippingInformation.mmsiNumber);
                                            $vesselStatusCollapseDiv.find("#destination").html(shippingInformation.destination);

                                            if ($vesselStatusCollapseDiv.find("#marinetraffic").length > 0) {

                                                $vesselStatusCollapseDiv.find(".shipTrackingMap").html("");

                                                var shipTrackingMapTemplate = _.template(shipTrackingMapRawTemplate);
                                                var a = $vesselStatusCollapseDiv.find(".shipTrackingMap").append(shipTrackingMapTemplate({
                                                    mmsi : shippingInformation.mmsiNumber
                                                }));
                                                
                                                $(a).find("iframe").on("load", function () {
                                                    console.log("ate 2");
                                                });

                                            }


                                        }

                                        $shippingInformationDiv.find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');
                                        $shippingInformationDiv.find("#departureDate").html(shippingInformation.departureDate);
                                        $shippingInformationDiv.find("#arrivalDate").html(shippingInformation.arrivalDate);
                                        $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');
                                        $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(shippingInformation.expectedDate);

                                    break;

                                    case "On Truck":

                                        if ($shippingInformationDiv.find("#vesselStatusCollapseItem-id-" + orderId).length > 0) {
                                            var $vesselStatusHeaderDiv = $shippingInformationDiv.find("i.fa-chevron-circle-down").parent();
                                            var $vesselStatusHR = $vesselStatusHeaderDiv.next();
                                            var $vesselStatusDiv = $vesselStatusHR.next();

                                            $vesselStatusHeaderDiv.remove();
                                            $vesselStatusHR.remove();
                                            $vesselStatusDiv.remove();

                                        }

                                        $shippingInformationDiv.find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');
                                        $shippingInformationDiv.find("#departureDate").html(shippingInformation.departureDate);
                                        $shippingInformationDiv.find("#arrivalDate").html(shippingInformation.arrivalDate);
                                        $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');
                                        $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(shippingInformation.expectedDate);

                                    break;

                                }

                            });

                            $btnUpdateShippingInfo.closest("div.collapse").collapse("hide");

                            $updateShippingDiv.find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
                            $updateShippingDiv.find("#vesselStatusCollapseDiv").collapse("hide");
                            $updateShippingDiv.find("#expectedDatePicker").val("");
                            $updateShippingDiv.find("#departureDatePicker").val("");
                            $updateShippingDiv.find("#arrivalDatePicker").val("");
                            $updateShippingDiv.find("#vessel-name").val("");
                            $updateShippingDiv.find("#mmsi-number").val("");
                            $updateShippingDiv.find("#imo-number").val("");
                            $updateShippingDiv.find("#destination").val("");



                        } else {

                            $updateShippingDiv.find("#errorMessage").html("*" + response.message);
                            $updateShippingDiv.find("#errorMessage").show();
    
                        }


                    }, "json");


                    console.log($(this).closest("tr").prev().find("#orderId").html());

                     

                });


                $(row.child()).find("#btn-cancel-shipping-info").click(function () {

                    $(this).closest("div.collapse").collapse("hide");

                    var $shippingUpdateDiv = $(this).closest("#updateShipping-id-" + orderId);
                
                    $shippingUpdateDiv.find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
                    $shippingUpdateDiv.find("#vesselStatusCollapseDiv").collapse("hide");
                    $shippingUpdateDiv.find("#expectedDatePicker").val("");
                    $shippingUpdateDiv.find("#departureDatePicker").val("");
                    $shippingUpdateDiv.find("#arrivalDatePicker").val("");
                    $shippingUpdateDiv.find("#vessel-name").val("");
                    $shippingUpdateDiv.find("#mmsi-number").val("");
                    $shippingUpdateDiv.find("#imo-number").val("");
                    $shippingUpdateDiv.find("#destination").val("");
                
                });


                $(row.child()).find("#vesselStatusCollapseItem-id-" + response.orderId).on("hidden.bs.collapse", function () {
                    $(this).find(".shipTrackingMap").html("");
                });

                $(row.child()).find("#btn-update-shipping-log").click(function () {
                    console.log($(this).closest("tr").prev().find("#orderId").html());
                    $(this).closest("div.collapse").collapse("hide");
                });

                $(row.child()).find("#btn-cancel-shipping-log").click(function () {

                    $(this).closest("div.collapse").collapse("hide");

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

    $("#orderTable").on("change", ".checkbox-delete", function () {

        if ($("#orderTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

            $("a#deleteProduct").removeClass("text-muted").addClass("text-red").css("cursor", "pointer");
        } else {

            $("a#deleteProduct").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed");
        }

    });

    $('#toShipInformationModal').on('hidden.bs.modal', function (e) {

        $(this).find("#orderModalId").val("");
        $(this).find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
        $(this).find("#vesselStatusCollapseDiv").collapse("hide");
        $(this).find("#expectedDatePicker").val("");
        $(this).find("#departureDatePicker").val("");
        $(this).find("#arrivalDatePicker").val("");
        $(this).find("#vessel-name").val("");
        $(this).find("#mmsi-number").val("");
        $(this).find("#imo-number").val("");
        $(this).find("#destination").val("");

    });

});