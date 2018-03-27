$(document).ready(function () {

    var getSystemNotificationStatusIcon = function (systemNotificationStatus) {

        return systemNotificationStatus == "ORDER_RECEIVED" ? '<i class="icon-padnote ml-1" style = "color: #0275d8;"></i>' :
               systemNotificationStatus == "ORDER_REFUND" ? '<i class="fa fa-arrow-left ml-1" style = "color: #ea1e63;"></i>' :
               systemNotificationStatus == "ORDER_PAID" ? '<i class="fa fa-usd ml-1" style = "color: #91c361;"></i>' :
               systemNotificationStatus == "ORDER_RETURN" ? '<i class="fa fa-undo ml-1" style = "color: #795548;"></i>' :
               systemNotificationStatus == "ORDER_NEW_ORDER" ? '<i class="fa fa-list ml-1" style = "color: #ffc107;"></i>' :
               systemNotificationStatus == "ORDER_CANCELLED" ? '<i class="fa fa-times ml-1" style = "color: #d9534f;"></i>' :
               systemNotificationStatus == "INVENTORY_ADD_PRODUCT" ? '<i class="fa fa-plus ml-1"></i>' :
               systemNotificationStatus == "INVENTORY_EDIT_PRODUCT" ? '<i class="fa fa-edit ml-1"></i>' :
               systemNotificationStatus == "INVENTORY_UPDATE_STOCK" ?  '<i class="fa fa-product-hunt ml-1"></i>' : '<i class="fa fa-server"></i>';

    };

    var getSystemNotificationStatusIconColor = function (systemNotificationStatus) {

        return systemNotificationStatus == "ORDER_RECEIVED" ? '#0275d8' :
               systemNotificationStatus == "ORDER_REFUND" ? '#ea1e63' :
               systemNotificationStatus == "ORDER_PAID" ? '#91c361' :
               systemNotificationStatus == "ORDER_RETURN" ? '#795548' :
               systemNotificationStatus == "ORDER_NEW_ORDER" ? '#ffc107' :
               systemNotificationStatus == "ORDER_CANCELLED" ? '#d9534f' : '';
            //    systemNotificationStatus == "INVENTORY_ADD_PRODUCT" ? '<i class="fa fa-plus ml-1"></i>' :
            //    systemNotificationStatus == "INVENTORY_EDIT_PRODUCT" ? '<i class="fa fa-edit ml-1"></i>' :
            //    systemNotificationStatus == "INVENTORY_UPDATE_STOCK" ?  '<i class="fa fa-product-hunt ml-1"></i>' : '<i class="fa fa-server"></i>';

    }


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
       
    });

    $("#notificationModal").on("show.bs.modal", function () {

        var $notificationList = $(this).find("div.list-group");

        $notificationList.find(">span").remove();
        $notificationList.append($("#notificationSeeMoreLoaderTemplate").html());
        console.log("show modal");

        setTimeout(function () {

            $.get("/FBExportSystem/admin/showAllNotification", {
                record : 6,
                offset : 0
            }, function (response) {

                $notificationList.find("#notificationSeeMoreLoader").remove();

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

                iziToast.info({
                    iconColor: '#ffffff',
                    backgroundColor : getSystemNotificationStatusIconColor(notification.systemNotificationStatus),
                    titleColor: '#ffffff',
                    messageColor : "#ffffff",
                    title: notification.header,
                    message: notification.description,
                });

                if($("#notificationModal").hasClass("show")) {
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
                }
                
            });

        }, function (message) {
            console.log(message + " ERROR TNG INA");
            connect();
        });

    }
    
    connect();

});