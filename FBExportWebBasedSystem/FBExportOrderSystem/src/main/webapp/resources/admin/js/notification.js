$(document).ready(function () {

    var getSystemNotificationStatusIcon = function (systemNotificationStatus) {

        return systemNotificationStatus == "ORDER_RECEIVED" ? '<i class="icon-padnote ml-1" style = "color: #0275d8;"></i>' :
               systemNotificationStatus == "ORDER_REFUND" ? '<i class="fa fa-arrow-left ml-1" style = "color: #ea1e63;"></i>' :
               systemNotificationStatus == "ORDER_PAID" ? '<i class="fa fa-usd ml-1" style = "color: #91c361;"></i>' :
               systemNotificationStatus == "ORDER_RETURN" ? '<i class="fa fa-undo ml-1" style = "color: #795548;"></i>' :
               systemNotificationStatus == "ORDER_NEW_ORDER" ? '<i class="fa fa-list ml-1" style = "color: #ffc107;"></i>' :
               systemNotificationStatus == "ORDER_CANCELLED" ? '<i class="fa fa-times ml-1" style = "color: #d9534f;"></i>' :
               systemNotificationStatus == "INVENTORY_ADD_PRODUCT" ? '<i class="fa fa-plus ml-1" style = "color: #2b90d9;"></i>' :
               systemNotificationStatus == "INVENTORY_EDIT_PRODUCT" ? '<i class="fa fa-edit ml-1" style = "color: #2b90d9;"></i>' :
               systemNotificationStatus == "INVENTORY_UPDATE_STOCK" ?  '<i class="fa fa-product-hunt ml-1" style = "color: #2b90d9;"></i>' : '<i class="fa fa-server"></i>';

    };

    var getSystemNotificationListStatusIcon = function (systemNotificationStatus) {

        return systemNotificationStatus == "ORDER_RECEIVED" ? '<i class="icon-padnote ml-1" style = "background-color: #0275d8;"></i>' :
               systemNotificationStatus == "ORDER_REFUND" ? '<i class="fa fa-arrow-left ml-1" style = "background-color: #ea1e63;"></i>' :
               systemNotificationStatus == "ORDER_PAID" ? '<i class="fa fa-usd ml-1" style = "background-color: #91c361;"></i>' :
               systemNotificationStatus == "ORDER_RETURN" ? '<i class="fa fa-undo ml-1" style = "background-color: #795548;"></i>' :
               systemNotificationStatus == "ORDER_NEW_ORDER" ? '<i class="fa fa-list-alt ml-1" style = "background-color: #ffc107;"></i>' :
               systemNotificationStatus == "ORDER_CANCELLED" ? '<i class="fa fa-times ml-1" style = "background-color: #d9534f;"></i>' :
               systemNotificationStatus == "INVENTORY_ADD_PRODUCT" ? '<i class="fa fa-plus ml-1" style = "background-color: #2b90d9;"></i>' :
               systemNotificationStatus == "INVENTORY_EDIT_PRODUCT" ? '<i class="fa fa-edit ml-1" style = "background-color: #2b90d9;"></i>' :
               systemNotificationStatus == "INVENTORY_UPDATE_STOCK" ?  '<i class="fa fa-product-hunt ml-1" style = "background-color: #2b90d9;"></i>' : '<i class="fa fa-server ml-1"></i>'

    };

    var getSystemNotificationStatusIconColor = function (systemNotificationStatus) {

        return systemNotificationStatus == "ORDER_RECEIVED" ? '#0275d8' :
               systemNotificationStatus == "ORDER_REFUND" ? '#ea1e63' :
               systemNotificationStatus == "ORDER_PAID" ? '#91c361' :
               systemNotificationStatus == "ORDER_RETURN" ? '#795548' :
               systemNotificationStatus == "ORDER_NEW_ORDER" ? '#ffc107' :
               systemNotificationStatus == "ORDER_CANCELLED" ? '#d9534f' : 
               systemNotificationStatus == "INVENTORY_ADD_PRODUCT" ? '#2b90d9' :
               systemNotificationStatus == "INVENTORY_EDIT_PRODUCT" ? '#2b90d9' :
               systemNotificationStatus == "INVENTORY_UPDATE_STOCK" ?  '#2b90d9' : '<i class="fa fa-server"></i>';

    };

    $("#notifications").parent().ready(function () {
        
        var $dropDownNotification = $(this);

        $dropDownNotification.find("ul.dropdown-menu>div>li").each(function () {
            var dateAgo = $(this).find("small").html();
            $(this).find("small").html(timeago().format(dateAgo));
        });
        
    });

    $("#notifications").parent().on("show.bs.dropdown", function () {
       
        var $dropDownNotification = $(this);

        $dropDownNotification.find("a>span").remove(); 

        $dropDownNotification.find("ul>div>li").remove();

        $.post("/FBExportSystem/admin/showNotificationList", 
              function (response) {

                if (response.length > 0) {

                    if ($("#notificationListEmptyMessage").length > 0) 
                        $("#notificationListEmptyMessage").remove();

                    for (var i = 0; i != response.length; ++i) {

                        var notification = response[i];
                        var systemNotificationListStatusIcon = getSystemNotificationListStatusIcon(notification.systemNotificationStatus);

                        $dropDownNotification.find("ul>div")
                                            .append(_.template($("#notificationListItem").html())({
                                                header : notification.header,
                                                icon : systemNotificationListStatusIcon,
                                                dateAgo : timeago().format(notification.date),
                                                isSeen : notification.seen
                                            }));                    

                    }

                } else {

                    $dropDownNotification.find("ul>div")
                                         .append("<li> <p id = 'notificationListEmptyMessage' class = 'text-center mt-3'> <span style = 'font-size: 12px;'> No unseen notification. </span> </p> </li>"); 

                }


              }, "json");

    });

    $("#notificationModal").on("show.bs.modal", function () {

        var $notificationList = $(this).find("div.list-group");

        $("#notifications").parent().find("a>span").remove(); 

        $notificationList.children().remove();
        $notificationList.append($("#notificationSeeMoreLoaderTemplate").html());
    
        setTimeout(function () {

            $.get("/FBExportSystem/admin/showAllNotification", {
                record : 6,
                offset : 0
            }, function (response) {

                $notificationList.find("#notificationSeeMoreLoader").remove();

                if (response.length > 0) {

                    var notification = response;

                    for (var i = 0; i != notification.length; ++i){

                        var systemNotificationStatus = notification[i].systemNotificationStatus;
                        var systemNotificationStatusIcon = getSystemNotificationStatusIcon(systemNotificationStatus);

                        $notificationList.append(_.template($("#notificationModalListItem").html())({
                            header : notification[i].header,
                            icon : systemNotificationStatusIcon,
                            dateAgo : timeago().format(notification[i].date),
                            description : notification[i].description
                        }));
                    }

                } else {

                    if ($notificationList.find("#notificationModalEmptyMessage").length <= 0) 
                        $notificationList.append("<div id = 'notificationModalEmptyMessage' class='mx-auto pt-5 pb-5'> <h5> No notifications yet. </h5> </div>")

                }

            }, "json");

        }, 1500);

    });

    $("#notificationModal div.list-group").scroll(function () {
        var $notificationList = $(this);
        var isNotificationLoaderDisplayed = $notificationList.find("#notificationSeeMoreLoader").length > 0;
        console.log("scrolling");

        // <i class="fa fa-envelope circle bg-green circle ml-1"></i>

        if ($notificationList[0].scrollHeight - $notificationList.scrollTop() == $notificationList.height())
        {
            if (!isNotificationLoaderDisplayed) {
         
                var currentNotificationItems = $notificationList.find(">span").length;
                
                $notificationList.append($("#notificationSeeMoreLoaderTemplate").html());
               
                setTimeout(function () {

                    console.log(currentNotificationItems);

                    $.post("/FBExportSystem/admin/showAllNotification", {
                        record : 6,
                        offset : currentNotificationItems
                    }, function (response) {

                        $notificationList.find("#notificationSeeMoreLoader").remove();

                        var notification = response;

                        console.log(response);

                        for (var i = 0; i != notification.length; ++i){

                            var systemNotificationStatus = notification[i].systemNotificationStatus;
                            var systemNotificationStatusIcon = getSystemNotificationStatusIcon(systemNotificationStatus);

                            $notificationList.append(_.template($("#notificationModalListItem").html())({
                                header : notification[i].header,
                                icon : systemNotificationStatusIcon,
                                dateAgo : timeago().format(notification[i].date),
                                description : notification[i].description
                            }));
                        }

                    }, "json")

                }, 1500);
            }
        }
    });

    function connect() {
        var socket = new SockJS('/FBExportSystem/admin/notification');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            
            stompClient.subscribe('/topic/notification', function(response){

                var notification = JSON.parse(response.body);
                var systemNotificationStatusIcon = getSystemNotificationStatusIcon(notification.systemNotificationStatus);
                var systemNotificationListStatusIcon = getSystemNotificationListStatusIcon(notification.systemNotificationStatus);
               
                if (!window.location.pathname.includes("/FBExportSystem/admin/inventory/edit-product") &&
                    !window.location.pathname.includes("/FBExportSystem/admin/add-product")) {

                    var notificationSound = new Audio("/FBExportSystem/resources/notification-sound.mp3");
                    notificationSound.play();

                    iziToast.info({
                        iconColor: '#ffffff',
                        backgroundColor : getSystemNotificationStatusIconColor(notification.systemNotificationStatus),
                        titleColor: '#ffffff',
                        messageColor : "#ffffff",
                        title: notification.header,
                        message: notification.description
                    });

                }

                $("a#notifications").next().find(">div").prepend(_.template($("#notificationListItem").html())({
                    header : notification.header,
                    icon : systemNotificationListStatusIcon,
                    dateAgo : timeago().format(notification.date),
                    isSeen : notification.seen
                }));

                if($("#notificationModal").hasClass("show")) {

                    if($("#notificationModalEmptyMessage").length > 0) 
                        $("#notificationModalEmptyMessage").remove();

                    $.post("/FBExportSystem/admin/seenAllNotification", {
                        notificationJSONRawIds : JSON.stringify([
                            notification.notificationId
                        ])
                    }, function (response) {});

                    $("#notificationModal div.list-group").prepend(
                        _.template($("#notificationModalListItem").html())(
                            {
                                header : notification.header,
                                icon : systemNotificationStatusIcon,
                                dateAgo : timeago().format(notification.date),
                                description : notification.description
                            }
                        )
                    )


                } else {

                    if ($("#notificationListEmptyMessage").length > 0) 
                        $("#notificationListEmptyMessage").remove();
                    
                    if ($("#notifications>span.badge").length <= 0)
                        $("#notifications").append("<span class='badge bg-red'>1</span>");
                    else {

                        var currentNotificationCount = Number($("#notifications").find("span.badge").html());
                        currentNotificationCount += 1;

                        $("#notifications").find("span.badge").html(currentNotificationCount);


                    }



                }

                
            });

        }, function (message) {
            console.log(message + " ERROR TNG INA");
            connect();
        });

    }
    
    connect();

});