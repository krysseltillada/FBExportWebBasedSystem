
$(document).ready(function () {

    $('[data-toggle="popover"]').popover({
        placement : "left",
        offset : "40px 200px"
    });	

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

    $(".btn-view-reason").click(function () {
        alertify.alert("reason: " + $(this).attr("data-value"));
        $(".alertify").css("z-index", "10");
    });


    $("#shipmentStatusComboBox").change(function () {
        
        if ($(this).val() == "On Cargo Ship") {
            $("#vesselStatusCollapseDiv").collapse("show");
        } else {
            $("#vesselStatusCollapseDiv").collapse("hide");
        }


    });

    $("#expectedDatePicker").flatpickr({
        dateFormat : "F j, Y"
    });
    $("#departureDatePicker").flatpickr({
        dateFormat : "F j, Y"
    });
    $("#arrivalDatePicker").flatpickr({
        dateFormat : "F j, Y"
    });
    
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

    var filterOrders = function (filterByStatus, 
                                 filterByShipment, 
                                 filterByPayment, 
                                 sb, 
                                 sbOrder) {

         table.clear().draw();

        $("#orderTable tbody").html($("#filterLoaderTemplate").html());

        setTimeout(function () {
            $.post("/FBExportSystem/admin/orders/filter", {
                status : filterByStatus,
                shipment : filterByShipment,
                payment : filterByPayment,
                sortBy : sb,
                sortByOrder : sbOrder
            }, function (response) {

                console.log(response);

                $("#orderTable tbody>tr:eq(0)").remove();
                
                for (var i = 0; i != response.length; ++i) {

                    var order = response[i];

                    var orderStatusColor = (order.orderStatus == 'TO_SHIP') ? "#796AEE" : 
                                        (order.orderStatus == 'RECEIVED') ? "#0275D8" :
                                        (order.orderStatus == 'REJECTED') ? "#D9534F" : 
                                        (order.orderStatus == 'APPROVED') ? "#5CB85C" :
                                        (order.orderStatus == 'PENDING') ? "#FFC107" :
                                        (order.orderStatus == 'CANCELLED') ? "#D9534F" :
                                        (order.orderStatus == 'PAID') ? "#91C361" : 
                                        (order.orderStatus == 'REFUND') ? "#EA1E63" : "#795548"; 

                    var orderStatusLabel = (order.orderStatus == 'TO_SHIP') ? "To ship" :
                                        (order.orderStatus == 'RECEIVED') ? "Received" :
                                        (order.orderStatus == 'REJECTED') ? "Rejected" :
                                        (order.orderStatus == 'APPROVED') ? "Approved" :
                                        (order.orderStatus == 'PENDING') ? "Pending" :
                                        (order.orderStatus == 'CANCELLED') ? "Cancelled" :
                                        (order.orderStatus == 'PAID') ? "Paid" :
                                        (order.orderStatus == 'REFUND') ? "Refund" : "Returned"; 

                    order.totalPrice = "PHP" + order.totalPrice.toFixed(2);
                    order.dateOrdered = moment(order.dateOrdered).format("MMMM D, YYYY");

                    if (order.shipping) 
                        order.shipping.expectedDate = moment(order.shipping.expectedDate).format("MMMM D, YYYY");

                    table.row.add([
                        '<td></td>',
                        '<td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>',
                        '<td>' +
                            '<h3>' + 
                                '<span class="badge badge-success p-1">Order# <span id = "orderId">' + order.orderId +  '</span> </span>' +
                                '<input id = "orderId-' + order.orderId + '" type = "hidden" />' + 
                            '</h3>' +
                            '<span style = "font-size: 13px;">' +
                                '<strong> by: </strong> <strong> <a href = "#">' + order.customer.firstname + ' ' + order.customer.middlename  + ' ' + order.customer.lastname + '</a> </strong>' +
                                '<br />' +
                                '<strong> Payment: </strong>' + 
                                ((order.paymentMethod == 'CASH_ON_DELIVERY') ? 'Cash on delivery <i class="fa fa-truck ml-1" aria-hidden="true"></i>' :
                                                                            'Paypal <i class="fa fa-paypal ml-1" aria-hidden="true"></i>') +
                            '</span>' +
                        '</td>',
                        '<td>' +
                            '<div style = "font-size: 13px;">' +
                                '<strong> Order: </strong>' +
                                ((order.orderStatus == 'CANCELLED' || order.orderStatus == 'RETURNED' || order.orderStatus == 'REFUND') ? 
                                        '<small> <a class = "btn-view-reason"' +
                                                    'href = "javascript:void(0)"' +
                                                    'data-value = "' + order.reason + '"> (view reason) </a> </small>' : '') +
                                '<h6>' +                                             
                                    '<div class="btn-group dropdown-select">' +
                                        '<button type="button"' +
                                                'style = "background-color: ' +  orderStatusColor + ';"' +
                                                'class="btn btn-sm text-white dropdown-toggle"' +
                                                'data-toggle="dropdown"' +
                                                'aria-haspopup="true"' + 
                                                'aria-expanded="false">' +
                                                orderStatusLabel +
                                        '</button>' +
                                        '<div class="dropdown-menu">' +
                                        '<h6 class="dropdown-header">Mark as</h6>' +
                                        '</div>' +
                                    '</div>' +
                                '</h6>' +

                                '<strong> Shipment: </strong> <br />' +

                                ((order.shipping) ? ((order.shipping.shipmentStatus == 'ON_CARGO_SHIP') ? '<span id = "shipmentStatus">On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i></span>' :
                                                                                                        '<span id = "shipmentStatus">On Truck <i class="fa fa-truck ml-1" aria-hidden="true"></i></span>') 
                                                : '<span id = "shipmentStatus">Shipment status not defined.</span>') +
                            '</div>' +
                        '</td>',
                        '<td style = "max-width: 250px;">' +
                            '<span style = "font-size: 14px;">' +
                                '<strong> Receiver\'s name: </strong>' +
                                '<span style = "font-size: 12px;">' +
                                    order.shippingAddress.receiverFullName +
                                '</span>' +
                                '<br/>' +

                                '<strong> Phone number: </strong>' +
                                
                                '<span style = "font-size: 12px;">' +
                                    '(+' + order.shippingAddress.contact.countryCode + ') ' + order.shippingAddress.contact.phoneNumber +
                                '</span>' +
                
                                '<br/>' +
                                
                                '<strong> Address <span style = "font-size: 12px;"> (' + order.shippingAddress.addressType + ') </span>:' +
                                '</strong> <br />' +
                                
                                '<span style = "font-size: 12px;">' +
                                    order.shippingAddress.address.zipCode + ' ' + order.shippingAddress.address.address +
                                '</span>' +
                                
                                '<br />' +
                                
                                '<strong> Country <span style = "font-size: 12px;"> (City) </span>:  </strong> <br />' +
                                '<span style = "font-size: 12px;">' +
                                    order.shippingAddress.address.country + '(' + order.shippingAddress.address.city + ')' +
                                '</span>' +
                            '</span>' +

                            '<br />' +
                        '</td>',
                        '<td>' +
                            '<span style = "font-size: 13px;">' +
                                '<strong> Items: </strong> <br />' +
                                    '<span style = "font-size: 12px;">' +
                                        order.totalItems + ' items' +
                                    '</span>' +
                                '<br />' +

                                '<strong> Weight: </strong> <br />' +
                                '<span style = "font-size: 12px;">' +
                                    order.totalWeight + ' KILO' + 
                                '</span> <br />' +

                                '<strong> Price: </strong> <br />' +
                                '<span style = "font-size: 12px;">' +
                                    order.totalPrice +
                                '</span>' +
                            '</span>' +
                        '</td>',
                        '<td>' +

                            '<span style = "font-size: 13px;">' +

                                '<strong> Ordered: </strong> <br />' +
                                '<span style = "font-size: 12px;">' +
                                    order.dateOrdered +
                                '</span>' +
                                '<br />' +

                                '<strong> Expected: </strong> <br />' +
                                '<span style = "font-size: 12px;">' +

                                    ((order.shipping) ? order.shipping.expectedDate : 'None') +

                                '</span>' +
                                '<br />' +
                            '</span>' +
                        '</td>'
                    ]).draw()
                }

            }, "json");
        }, 1000);
        
    };

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
            expectedDate : convertFlatpickrDateToSystemDate($("#toShipInformationModal #expectedDatePicker").val()),
            departureDate : convertFlatpickrDateToSystemDate($("#toShipInformationModal #departureDatePicker").val()),
            arrivalDate : convertFlatpickrDateToSystemDate($("#toShipInformationModal #arrivalDatePicker").val()),
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

                        $("#toShipInformationModal").modal("hide");

                        iziToast.show({
                            message: 'adding shipping information...',
                            icon : "",
                            timeout : false,
                            close : false,
                            onOpening : function (instance, toast) {    
                                
                                setTimeout(function () {

                                    $.post("/FBExportSystem/admin/orders/get-order-details", {
                                        id : toShipInformation.orderId
                                    }, function (response) {

                                        console.log(response);

                                        var $currentOrderRow = $("#orderId-" + toShipInformation.orderId).closest("tr");
                                        var shipmentStatusDisplay = (toShipInformation.shipmentStatus == "On Cargo Ship") ? 'On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i>' :
                                                                                                        'On Truck <i class="fa fa-truck ml-1" aria-hidden="true"></i>';

                                        $currentOrderRow.find("td:eq(6) span span:eq(1)").html(moment(toShipInformation.expectedDate).format("MMMM D, YYYY"));

                                        $currentOrderRow.find("td:eq(3) span#shipmentStatus").html(shipmentStatusDisplay);

                                        var $orderDetailsRow = $currentOrderRow.next();

                                        if (!$orderDetailsRow.hasClass("odd") && !$orderDetailsRow.hasClass("even")) {
                                            $orderDetailsRow.find("ul.nav-tabs li:eq(0)")
                                                            .after('<li class="nav-item">' +
                                                                    '<a class="nav-link" data-toggle="tab" href="#shipping-order-tab-id-' + toShipInformation.orderId + '" role="tab">Shipping</a>' + 
                                                                    '</li>');

                                            var shippingDivOrderRawTemplate = $("#shippingDivOrderTemplate").html();
                                            var shippingDivOrderTemplate = _.template(shippingDivOrderRawTemplate);

                                            response.shipping.departureDate = moment(response.shipping.departureDate).format("MMMM D, YYYY");
                                            response.shipping.arrivalDate = moment(response.shipping.arrivalDate).format("MMMM D, YYYY");
                                            response.shipping.expectedDate = moment(response.shipping.expectedDate).format("MMMM D, YYYY");
                                            
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

                                            $orderDetailsRow.find("#expectedDatePicker").flatpickr({
                                                dateFormat : "F j, Y"
                                            });
                                            $orderDetailsRow.find("#departureDatePicker").flatpickr({
                                                dateFormat : "F j, Y"
                                            });
                                            $orderDetailsRow.find("#arrivalDatePicker").flatpickr({
                                                dateFormat : "F j, Y"
                                            });   
                                            $orderDetailsRow.find("#shippingLogDatePicker").flatpickr({
                                                dateFormat : "F j, Y"
                                            });
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
                                                    expectedDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#expectedDatePicker").val()),
                                                    departureDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#departureDatePicker").val()),
                                                    arrivalDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#arrivalDatePicker").val()),
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

                                                        $updateShippingDiv.find("#errorMessage").hide();
                                                        $btnUpdateShippingInfo.attr("disabled", "disabled");

                                                        iziToast.show({
                                                            message: 'adding shipping information...',
                                                            icon : "",
                                                            timeout : false,
                                                            close : false,
                                                            onOpening : function (instance, toast) {

                                                            setTimeout(function () {

                                                                $.post("/FBExportSystem/admin/orders/updateShippingInformation", {
                                                                    shippingInformationJSON : JSON.stringify(shippingInformation)
                                                                }, function () {

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
                                                                        $shippingInformationDiv.find("#departureDate").html(moment(shippingInformation.departureDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.find("#arrivalDate").html(moment(shippingInformation.arrivalDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(moment(shippingInformation.expectedDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');

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
                                                                        $shippingInformationDiv.find("#departureDate").html(moment(shippingInformation.departureDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.find("#arrivalDate").html(moment(shippingInformation.arrivalDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(moment(shippingInformation.expectedDate).format("MMMM D, YYYY"));
                                                                        $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');

                                                                    break;

                                                                    }

                                                                    $btnUpdateShippingInfo.removeAttr("disabled");

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

                                                                    $(toast).fadeOut("slow", function () {
                                                                            $(this).remove();
                                                                    });
                                                                    
                                                                    iziToast.success({
                                                                            timeout : 2000,
                                                                            progressBar : false,
                                                                            message : "shipping information is added"
                                                                    });

                                                                });

                                                            }, 500);

                                                        }});
  
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

                                            $orderDetailsRow.find("#btn-update-shipping-log").click(function () {
                                                
                                                console.log($(this).closest("tr").prev().find("#orderId").html());

                                                var $shippingLogDiv = $(this).closest("#shippingLogCollapseItem-id-" + toShipInformation.orderId);
                                                var $btnUpdateShippingLog = $(this);
                                                // $(this).closest("div.collapse").collapse("hide");

                                                var shippingLog = {
                                                    orderId : $(this).closest("tr").prev().find("#orderId").html(),
                                                    header : $shippingLogDiv.find("#shippingLogHeader").val(),
                                                    description : $shippingLogDiv.find("#shippingLogDescription").val(),
                                                    address : $shippingLogDiv.find("#shippingLogAddress").val(),
                                                    date : convertFlatpickrDateToSystemDate($shippingLogDiv.find("#shippingLogDatePicker").val()),
                                                    time : $shippingLogDiv.find("#shippingLogTimePicker").val() 
                                                };

                                                $.post("/FBExportSystem/admin/orders/validateShippingLog", {
                                                    shippingLogJSON : JSON.stringify(shippingLog)
                                                }, function (response) {

                                                    if (response.status == "success") {

                                                        $shippingLogDiv.find("#errorMessage").hide();
                                                        $btnUpdateShippingLog.attr("disabled", "disabled");

                                                        $.post("/FBExportSystem/admin/orders/addShippingLog", {
                                                            shippingLogJSON : JSON.stringify(shippingLog)
                                                        }, function (response) {

                                                            console.log(response);

                                                            var shippingLogItemRawTemplate = $("#shippingLogItemTemplate").html();
                                                            var $shippingLogList =  $shippingLogDiv.find("div.list-group");

                                                            $shippingLogDiv.find("div:first").collapse("hide");

                                                            if ($shippingLogList.find("div.row").length > 0) 
                                                                $shippingLogList.find("div.row").remove();
                                                            
                                                            $shippingLogList.prepend(_.template(shippingLogItemRawTemplate)({
                                                                shippingLogId : response.shippingLogId,
                                                                header : shippingLog.header,
                                                                date : $shippingLogDiv.find("#shippingLogDatePicker").val(),
                                                                time : shippingLog.time,
                                                                description : shippingLog.description,
                                                                address : shippingLog.address
                                                            }));

                                                            $shippingLogList.find("span:first button.delete-shipping-log").click(function () {

                                                                var $btnDeleteShippingLog = $(this);
                                                                var $shippingLogItem = $btnDeleteShippingLog.closest("span");
                                                                var $shippingLogItemList = $shippingLogItem.closest("div.list-group");
                                                                var id = toShipInformation.orderId;


                                                                alertify.okBtn("delete")
                                                                        .confirm("delete shipping log?", function () {
                                                                            $.post("/FBExportSystem/admin/orders/deleteShippingLog", {
                                                                                shippingLogId : $btnDeleteShippingLog.closest("span").find("#shippingDeleteId").val(),
                                                                                orderId : id
                                                                            }, function () {
                                                                                $shippingLogItem.remove();        

                                                                                if ($shippingLogItemList.find("span").length <= 0) {
                                                                                    $shippingLogItemList.append("<div class='row'>" +
                                                                                                                "<div class='mx-auto mt-2'>" +
                                                                                                                    "<h5> No shipping logs here </h5>" +
                                                                                                                "</div>" +
                                                                                                            "</div>");
                                                                                }

                                                                            });
                                                                        });

                                                                $(".alertify").css("z-index", "10");
                                                                
                                                            });

                                                            $shippingLogDiv.find("#shippingLogHeader").val("");
                                                            $shippingLogDiv.find("#shippingLogDescription").val("");
                                                            $shippingLogDiv.find("#shippingLogAddress").val("");
                                                            $shippingLogDiv.find("#shippingLogDatePicker").val("");
                                                            $shippingLogDiv.find("#shippingLogTimePicker").val(""); 

                                                            $btnUpdateShippingLog.removeAttr("disabled");

                                                            iziToast.success({
                                                                    timeout : 2000,
                                                                    progressBar : false,
                                                                    message : "shipping log is added"
                                                            });
                                                            
                                                        }, "json");


                                                    } else {
                                                        $shippingLogDiv.find("#errorMessage").html("*" + response.message);
                                                        $shippingLogDiv.find("#errorMessage").show();
                                                    }

                                                }, "json");

                                                
                                            });

                                            $orderDetailsRow.find("#btn-cancel-shipping-log").click(function () {

                                                $(this).closest("div.collapse").collapse("hide");

                                                var $btnCancelShippingInfo = $(this);

                                                var $shippingLogDiv = $(this).closest("#shippingLogCollapseItem-id-" + toShipInformation.orderId);

                                                $shippingLogDiv.find("#errorMessage").html("").hide();

                                                $shippingLogDiv.find("#shippingLogHeader").val("");
                                                $shippingLogDiv.find("#shippingLogDescription").val("");
                                                $shippingLogDiv.find("#shippingLogAddress").val("");
                                                $shippingLogDiv.find("#shippingLogDatePicker").val("");
                                                $shippingLogDiv.find("#shippingLogTimePicker").val(""); 

                                            });

                                            $orderDetailsRow.find("div#shippingLogCollapseItem-id-" + toShipInformation.orderId)
                                                            .find("div.list-group span button.delete-shipping-log").click(function () {


                                                                var $btnDeleteShippingLog = $(this);
                                                                var $shippingLogItem = $btnDeleteShippingLog.closest("span");
                                                                var $shippingLogItemList = $shippingLogItem.closest("div.list-group");

                                                                alertify.okBtn("delete")
                                                                        .confirm("delete shipping log?", function () {
                                                                            $.post("/FBExportSystem/admin/orders/deleteShippingLog", {
                                                                                shippingLogId : $btnDeleteShippingLog.closest("span").find("#shippingDeleteId").val(),
                                                                                orderId : toShipInformation.orderId
                                                                            }, function () {
                                                                                $shippingLogItem.remove();        

                                                                                if ($shippingLogItemList.find("span").length <= 0) {
                                                                                    $shippingLogItemList.append("<div class='row'>" +
                                                                                                                    "<div class='mx-auto mt-2'>" +
                                                                                                                        "<h5> No shipping logs here </h5>" +
                                                                                                                    "</div>" +
                                                                                                                "</div>");
                                                                                }

                                                                            });
                                                                        });

                                                                $(".alertify").css("z-index", "10");

                                            });

                                        }

                                        var $dropDownSelectButton = $currentOrderRow.find("button.dropdown-toggle")

                                        $dropDownSelectButton.html("To ship");

                                        $dropDownSelectButton.css("background-color", orderStatusColors.get("To Ship"));
                                        $dropDownSelectButton.css("border-color", orderStatusColors.get("To Ship"));

                                        $(toast).fadeOut("slow", function () {
                                                $(this).remove();
                                        });

                                        iziToast.success({
                                                timeout : 2000,
                                                progressBar : false,
                                                message : "shipping information is added"
                                        });

                                        toShipInformationModalProgressBar.end();


                                    }, "json");

                                }, 1000);


                        }});

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

                if (response.shipping) {

                    response.shipping.departureDate = moment(response.shipping.departureDate).format("MMMM D, YYYY");
                    response.shipping.arrivalDate = moment(response.shipping.arrivalDate).format("MMMM D, YYYY");


                    var shippingLog = response.shipping.shippingLog;

                    for (var i = 0; i != shippingLog.length; ++i) {
                        shippingLog[i].date = moment(shippingLog[i].date).format("MMMM D, YYYY");
                    }

                }

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

                $(row.child()).find("#expectedDatePicker").flatpickr({
                    dateFormat : "F j, Y"
                });
                $(row.child()).find("#departureDatePicker").flatpickr({
                    dateFormat : "F j, Y"
                });
                $(row.child()).find("#arrivalDatePicker").flatpickr({
                    dateFormat : "F j, Y"
                });

                $(row.child()).find("#shippingLogDatePicker").flatpickr({
                    dateFormat : "F j, Y"
                });

                $(row.child()).find("#shippingLogTimePicker").flatpickr({
                    enableTime : true,
                    noCalendar : true,
                    time_24hr : true
                });

                $(row.child()).find("#btn-update-shipping-info").click(function () {

                    var $btnUpdateShippingInfo = $(this);

                    var $updateShippingDiv = $btnUpdateShippingInfo.closest("div#updateShipping-id-" + orderId);
                    var $shippingInformationDiv = $updateShippingDiv.closest("div#shippingInformationCollapseItem-id-" + orderId);
                    var id = orderId;

                    var shippingInformation = {
                        orderId : id,
                        shipmentStatus : $updateShippingDiv.find("#shipmentStatusComboBox").val(),
                        expectedDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#expectedDatePicker").val()),
                        departureDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#departureDatePicker").val()),
                        arrivalDate : convertFlatpickrDateToSystemDate($updateShippingDiv.find("#arrivalDatePicker").val()),
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

                            $updateShippingDiv.find("#errorMessage").hide();
                            $btnUpdateShippingInfo.attr("disabled", "disabled");

                              iziToast.show({
                                            message: 'updating shipping information...',
                                            icon : "",
                                            timeout : false,
                                            close : false,
                                            onOpening : function (instance, toast) {

                                            setTimeout(function () {
                                                $.post("/FBExportSystem/admin/orders/updateShippingInformation", {
                                                    shippingInformationJSON : JSON.stringify(shippingInformation)
                                                }, function () {

                                                    
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
                                                            $shippingInformationDiv.find("#departureDate").html(moment(shippingInformation.departureDate).format("MMMM D, YYYY"));
                                                            $shippingInformationDiv.find("#arrivalDate").html(moment(shippingInformation.arrivalDate).format("MMMM D, YYYY") );
                                                            $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(moment(shippingInformation.expectedDate).format("MMMM D, YYYY"));
                                                            $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-ship" aria-hidden="true"></i>');

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
                                                            $shippingInformationDiv.find("#departureDate").html(moment(shippingInformation.departureDate).format("MMMM D, YYYY"));
                                                            $shippingInformationDiv.find("#arrivalDate").html(moment(shippingInformation.arrivalDate).format("MMMM D, YYYY"));
                                                            $shippingInformationDiv.closest("tr").prev().find("td:eq(6) span>span:eq(1)").html(moment(shippingInformation.expectedDate).format("MMMM D, YYYY"));
                                                            $shippingInformationDiv.closest("tr").prev().find("#shipmentStatus").html(shippingInformation.shipmentStatus + ' <i class="fa fa-truck" aria-hidden="true"></i>');

                                                        break;

                                                    }

                                                    $updateShippingDiv.find("#shipmentStatusComboBox option:eq(0)").prop("selected", true);
                                                    $updateShippingDiv.find("#vesselStatusCollapseDiv").collapse("hide");
                                                    $updateShippingDiv.find("#expectedDatePicker").val("");
                                                    $updateShippingDiv.find("#departureDatePicker").val("");
                                                    $updateShippingDiv.find("#arrivalDatePicker").val("");
                                                    $updateShippingDiv.find("#vessel-name").val("");
                                                    $updateShippingDiv.find("#mmsi-number").val("");
                                                    $updateShippingDiv.find("#imo-number").val("");
                                                    $updateShippingDiv.find("#destination").val("");

                                                    $btnUpdateShippingInfo.removeAttr("disabled");
                                                    $btnUpdateShippingInfo.closest("div.collapse").collapse("hide");

                                                    

                                                    $(toast).fadeOut("slow", function () {
                                                            $(this).remove();
                                                    });

                                                    iziToast.success({
                                                        timeout : 2000,
                                                        progressBar : false,
                                                        message : "shipping information updated"
                                                    });

                                                });
                                            }, 1000);

                            }});

                            
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

                    var $shippingLogDiv = $(this).closest("#shippingLogCollapseItem-id-" + response.orderId);
                    var $btnUpdateShippingLog = $(this);
                    // $(this).closest("div.collapse").collapse("hide");

                    var shippingLog = {
                        orderId : $(this).closest("tr").prev().find("#orderId").html(),
                        header : $shippingLogDiv.find("#shippingLogHeader").val(),
                        description : $shippingLogDiv.find("#shippingLogDescription").val(),
                        address : $shippingLogDiv.find("#shippingLogAddress").val(),
                        date : convertFlatpickrDateToSystemDate($shippingLogDiv.find("#shippingLogDatePicker").val()),
                        time : $shippingLogDiv.find("#shippingLogTimePicker").val() 
                    };

                    $.post("/FBExportSystem/admin/orders/validateShippingLog", {
                        shippingLogJSON : JSON.stringify(shippingLog)
                    }, function (response) {

                        if (response.status == "success") {

                            $shippingLogDiv.find("#errorMessage").hide();
                            $btnUpdateShippingLog.attr("disabled", "disabled");

                            $.post("/FBExportSystem/admin/orders/addShippingLog", {
                                shippingLogJSON : JSON.stringify(shippingLog)
                            }, function (response) {

                                console.log(response);

                                var shippingLogItemRawTemplate = $("#shippingLogItemTemplate").html();
                                var $shippingLogList =  $shippingLogDiv.find("div.list-group");

                                $shippingLogDiv.find("div:first").collapse("hide");

                                if ($shippingLogList.find("div.row").length > 0) 
                                    $shippingLogList.find("div.row").remove();
                                
                                $shippingLogList.prepend(_.template(shippingLogItemRawTemplate)({
                                    shippingLogId : response.shippingLogId,
                                    header : shippingLog.header,
                                    date : $shippingLogDiv.find("#shippingLogDatePicker").val(),
                                    time : shippingLog.time,
                                    description : shippingLog.description,
                                    address : shippingLog.address
                                }));

                                $shippingLogList.find("span:first button.delete-shipping-log").click(function () {

                                    var $btnDeleteShippingLog = $(this);
                                    var $shippingLogItem = $btnDeleteShippingLog.closest("span");
                                    var $shippingLogItemList = $shippingLogItem.closest("div.list-group");
                                    var id = orderId;


                                    alertify.okBtn("delete")
                                            .confirm("delete shipping log?", function () {
                                                $.post("/FBExportSystem/admin/orders/deleteShippingLog", {
                                                    shippingLogId : $btnDeleteShippingLog.closest("span").find("#shippingDeleteId").val(),
                                                    orderId : id
                                                }, function () {
                                                    $shippingLogItem.remove();        

                                                    if ($shippingLogItemList.find("span").length <= 0) {
                                                        $shippingLogItemList.append("<div class='row'>" +
                                                                                    "<div class='mx-auto mt-2'>" +
                                                                                        "<h5> No shipping logs here </h5>" +
                                                                                    "</div>" +
                                                                                "</div>");
                                                    }

                                                });
                                            });

                                    $(".alertify").css("z-index", "10");
                                    
                                });

                                $shippingLogDiv.find("#shippingLogHeader").val("");
                                $shippingLogDiv.find("#shippingLogDescription").val("");
                                $shippingLogDiv.find("#shippingLogAddress").val("");
                                $shippingLogDiv.find("#shippingLogDatePicker").val("");
                                $shippingLogDiv.find("#shippingLogTimePicker").val(""); 

                                $btnUpdateShippingLog.removeAttr("disabled");

                                iziToast.success({
                                        timeout : 2000,
                                        progressBar : false,
                                        message : "shipping log is added"
                                });
                                
                            }, "json");


                        } else {
                            $shippingLogDiv.find("#errorMessage").html("*" + response.message);
                            $shippingLogDiv.find("#errorMessage").show();
                        }

                    }, "json");

                    
                });

                $(row.child()).find("div#shippingLogCollapseItem-id-" + response.orderId)
                              .find("div.list-group span button.delete-shipping-log").click(function () {

                                var $btnDeleteShippingLog = $(this);
                                var $shippingLogItem = $btnDeleteShippingLog.closest("span");
                                var $shippingLogItemList = $shippingLogItem.closest("div.list-group");

                                alertify.okBtn("delete")
                                        .confirm("delete shipping log?", function () {
                                            $.post("/FBExportSystem/admin/orders/deleteShippingLog", {
                                                shippingLogId : $btnDeleteShippingLog.closest("span").find("#shippingDeleteId").val(),
                                                orderId : response.orderId
                                            }, function () {
                                                $shippingLogItem.remove();        

                                                if ($shippingLogItemList.find("span").length <= 0) {
                                                    $shippingLogItemList.append("<div class='row'>" +
                                                                                "<div class='mx-auto mt-2'>" +
                                                                                    "<h5> No shipping logs here </h5>" +
                                                                                "</div>" +
                                                                            "</div>");
                                                }

                                            });
                                        });

                                $(".alertify").css("z-index", "10");

                });

                $(row.child()).find("#btn-cancel-shipping-log").click(function () {

                    $(this).closest("div.collapse").collapse("hide");

                    var $btnCancelShippingInfo = $(this);

                    var $shippingLogDiv = $(this).closest("#shippingLogCollapseItem-id-" + response.orderId);

                    $shippingLogDiv.find("#errorMessage").html("").hide();

                    $shippingLogDiv.find("#shippingLogHeader").val("");
                    $shippingLogDiv.find("#shippingLogDescription").val("");
                    $shippingLogDiv.find("#shippingLogAddress").val("");
                    $shippingLogDiv.find("#shippingLogDatePicker").val("");
                    $shippingLogDiv.find("#shippingLogTimePicker").val(""); 

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

    $("#filterByStatus").change(function () {
        filterOrders($("#filterByStatus").val(),
                     $("#filterByShipment").val(),
                     $("#filterByPayment").val(),
                     $("#sortBy").val(),
                     $("#sortByOrder").val());
    });

    $("#filterByShipment").change(function () {
        filterOrders($("#filterByStatus").val(),
                     $("#filterByShipment").val(),
                     $("#filterByPayment").val(),
                     $("#sortBy").val(),
                     $("#sortByOrder").val());
    });

    $("#filterByPayment").change(function () {
        filterOrders($("#filterByStatus").val(),
                     $("#filterByShipment").val(),
                     $("#filterByPayment").val(),
                     $("#sortBy").val(),
                     $("#sortByOrder").val());
    });

    $("#sortBy").change(function () {
        filterOrders($("#filterByStatus").val(),
                     $("#filterByShipment").val(),
                     $("#filterByPayment").val(),
                     $("#sortBy").val(),
                     $("#sortByOrder").val());
    });

    $("#sortByOrder").change(function () {
        filterOrders($("#filterByStatus").val(),
                     $("#filterByShipment").val(),
                     $("#filterByPayment").val(),
                     $("#sortBy").val(),
                     $("#sortByOrder").val());
    });

});