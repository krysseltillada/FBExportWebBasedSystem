$(document).ready(function () {
    var stompClient = null; 

    var updateNotificationItemCount = function () {

        console.log($("#notificationListGroup input[value='false']").length + " length of notif in user bar");

        if ($("#notificationListGroup input[value='false']").length > 0) {
            $("#dropDownNotification").find("span").html($("#notificationListGroup input[value='false']").length);
            $("#emptyNotificationMessageDesktop").remove();
        } else {
            $("#dropDownNotification").find("span").html("");
        }
    };

    var updateNotificationDisplay = function() {
        
        updateNotificationItemCount();

        $("#notificationListGroup>span>small").each(function (i, elem) {
            var $dateAgo = $(this).closest("span").find(">small");
            $dateAgo.html(timeago().format($dateAgo.html()));

        });
    };

    $('#btnShowNotification').on('show.bs.dropdown', function () {
        console.log("tae tae");
        var seenItemId = [];

        console.log($("#emptyNotificationMessageDesktop").length);

        if ($("#emptyNotificationMessageDesktop").length <= 0) {

            $("#notificationListGroup>span").each(function (i, elem) {
                seenItemId.push($(this).find("#notificationId").val());
            });

            console.log(seenItemId);

            $.post("/FBExportSystem/seen-notification", {
                seenNotificationIdRawJSON : JSON.stringify(seenItemId)
            }, function () {
                $("#dropDownNotification").find("span").html("");
                $("#notificationListGroup input[value='false']").val("true");
            });

        }

    });


    function connect() {
        var socket = new SockJS('/FBExportSystem/notification');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            
            console.log('Connected: ' + frame);
            stompClient.subscribe('/queue/push-notification-user-id-' + $("#customer-id").val(), function(response){
                console.log(response + " response");

                var notification = JSON.parse(response.body);

                toastr.info(notification.header);

                $("#notificationListGroup").prepend(_.template($("#notificationItemTemplate").html())({
                    header : notification.header,
                    description : notification.description,
                    dateAgo : timeago().format(notification.date),
                    notificationId : notification.notificationId,
                    isSeen : notification.seen
                }));

                var notificationSound = new Audio("/FBExportSystem/resources/notification-sound.mp3");
                notificationSound.play();

                updateNotificationItemCount();
                

            });

        }, function (message) {
            console.log(message + " ERROR TNG INA");
            connect();
        });

        updateNotificationDisplay();
    }
    
    connect();
	       
   
});