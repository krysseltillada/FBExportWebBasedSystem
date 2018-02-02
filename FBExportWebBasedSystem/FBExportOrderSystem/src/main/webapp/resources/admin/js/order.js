
$(window).ready(function () {

    var orderStatusColors = new Map({ 
                                    "To Ship" : "#796AEE",
                                    "Received" : "#0275D8",
                                    "Rejected" : "#D9534F",
                                    "Approved": "#5CB85C",
                                    "Pending": "#FFC107" 
                                    });


    var table = $('#orderTable').DataTable( {
        "language" : {
        "emptyTable" : "No orders found",
        "zeroRecords" : "No orders found"
        },
        "aLengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]],
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

        // table.rows().invalidate().draw();

        
        table.rows().invalidate();

    });

    $("div.dropdown-select").on("show.bs.dropdown", function () {
        
        var $dropdownMenu = $(this).find("div.dropdown-menu");

        console.log("open");

        orderStatusColors.forEach(function (color, key) {
        $dropdownMenu.find(".dropdown-header")
                        .after('<a class = "dropdown-item pointerable">' + key + '</a>')
                        .next().click(function () {
                        var orderStatus = $(this).html();
                        var $dropDownSelectButton = $(this).parent().parent().find("button");
                        

                        $dropDownSelectButton.html(orderStatus);


                        $dropDownSelectButton.css("background-color", orderStatusColors.get(orderStatus));
                        $dropDownSelectButton.css("border-color", orderStatusColors.get(orderStatus));


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
            row.child(rowProductRowCollapse, 'no-padding').show();

            console.log($(row.child()).html());


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