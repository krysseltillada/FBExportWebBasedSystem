$(document).ready(function () {
    var stompClient = null; 

    var updateNotificationItemCount = function () {

        var currentNotificationListCount = $("#notificationListGroup>span #isSeen[value='false']").length;

        $("#dropDownNotification>span").html(currentNotificationListCount);
       
    };

    $('#btnShowNotification').on('show.bs.dropdown', function () {

        console.log($("#emptyNotificationMessageDesktop").length);

        $("#dropDownNotification>span").html("");
        $(this).find("#notificationListGroup>span").remove();

        $.get("/FBExportSystem/get-notification", 
              function (response) {

                if (response.length > 0) {

                    for (var i = 0; i != response.length; ++i) {

                        var notification = response[i];

                        $("#notificationListGroup").append(_.template($("#notificationListItemTemplate").html())({
                            header : notification.header,
                            description : notification.description,
                            dateAgo : timeago().format(notification.date)
                        }));

                    }

                } else {

                    $("#notificationListGroup").append('<span href="javascript:void(0)" id = "emptyNotificationMessageDesktop" class="list-group-item list-group-item-action flex-column align-items-start notification-link pl-4 pr-4">' +
												            '<h6 class="text-center p-5"> No unseen notifications yet </h6>' +
												        '</span>');

                }
        });

    });


    function connect() {
        var socket = new SockJS('/FBExportSystem/customer/notification');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            
            console.log('Connected: ' + frame);
            stompClient.subscribe('/queue/push-notification-user-id-' + $("#customer-id").val(), function(response){
                console.log(response + " response");

                var notification = JSON.parse(response.body);

                toastr.info(notification.header);

                if ($("#emptyNotificationMessageDesktop").length > 0) 
                    $("#emptyNotificationMessageDesktop").remove();

                $("#notificationListGroup").prepend(_.template($("#notificationItemTemplate").html())({
                    header : notification.header,
                    description : notification.description,
                    dateAgo : timeago().format(notification.date),
                    notificationId : notification.notificationId,
                    isSeen : notification.seen
                }));

                var notificationSound = new Audio("/FBExportSystem/resources/notification-sound.mp3");
                notificationSound.play();

                if (!$("#btnShowNotification>a>span").html()) {
                    $("#btnShowNotification>a>span").html("1");
                } else {

                    var currentNotificationCount = Number($("#btnShowNotification>a>span").html());
                    currentNotificationCount += 1;

                    console.log("counted " + currentNotificationCount);

                    $("#btnShowNotification>a>span").html(currentNotificationCount);


                }
                

            });

        }, function (message) {
            console.log(message + " ERROR TNG INA");
            connect();
        });

    }
    
    connect();
	       
   
});