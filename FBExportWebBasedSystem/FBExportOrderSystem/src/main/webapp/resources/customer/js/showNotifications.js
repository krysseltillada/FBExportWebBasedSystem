$(document).ready(function () {

    var deleteNotificationItem = function (e) {
        var notificationItemId = $(e.currentTarget).closest("span").find("#notificationId").val(); 
        var notificationItem = $(e.currentTarget).closest("span");
        var cId = $("#customer-id").val();

        $.post("/FBExportSystem/delete-notification", {
            notificationId : notificationItemId,
            customerId : cId
        }, function () {
            notificationItem.fadeIn("slow", function () {
                $(this).remove();
            });

            var notificationListCurrentCount = $("div.notifications>div.list-group").children().length;

            if (notificationListCurrentCount <= 1) {
                $("#btnClearNotifications").addClass("disabled").addClass("grey-text");
                $("#btnSeeMoreNotifications").hide();
                $(".no-notification").css("display", "block");
            }


        });
    };

    var deleteAllNotification = function () {
           
        var ids = {
          idElem : []
        };
        
        $("div.notifications>div.list-group>span").each(function (index) {
        
            console.log($(this).find("#notificationId").val());

            ids.idElem.push(parseInt($(this).find("#notificationId").val()));

        });

        
        $.ajax({
            type : "POST",
            url : "/FBExportSystem/delete-all-notification",
            data : {
                deleteData : JSON.stringify(ids) 
            },
            success : function () {
                  $("div.notifications>div.list-group>span").fadeIn("slow", function () {
                    $(this).remove();
                  });

                  
                  $("#btnClearNotifications").addClass("disabled").addClass("grey-text");
                  $("#btnSeeMoreNotifications").hide();
                  $(".no-notification").css("display", "block");
            }
        })

        
    };

    

    $("#btnClearNotifications").click(deleteAllNotification);

    $(".delete-notification").click(deleteNotificationItem);

    $("#btnSeeMoreNotifications").click(function () {

            var notificationListCurrentCount = $("div.notifications>div.list-group>:not(div)").length;
            console.log(notificationListCurrentCount);


            var ci = $("#customer-id").val();

            $("#btnSeeMoreNotifications").hide();
            $(".see-more-loader").css("display", "block");

            setTimeout(function () {

                $.post("/FBExportSystem/see-more-notifications", {
                customerId : ci,
                pageCount : notificationListCurrentCount
                }, function (response) {
                    
                    var notificationItemTemplate = _.template($("#showNotificationItemTemplate").html());

                    console.log(response);

                    if (response.length > 0) {

                        for (var i = 0; i != response.length; ++i) {

                            var notificationItem =  notificationItemTemplate({
                                notificationId : response[i].notificationId,
                                header : response[i].header,
                                description : response[i].description,
                                dateAgo : timeago().format(response[i].date)
                            });


                            $("div.notifications>div.list-group").append(notificationItem);
                            
                            $("div.notifications>div.list-group>span:last .delete-notification").click(deleteNotificationItem);

                            $("div.notifications>div.list-group>span:last").hide();
                            
                            $("div.notifications>div.list-group>span:last").fadeIn("slow");

                        }

                        $("#btnSeeMoreNotifications").show();
                        $(".see-more-loader").css("display", "none");

                    } else {

                        $("#btnSeeMoreNotifications").hide();
                        $(".see-more-loader").css("display", "none");
                    }

                });

            }, 2000);



    });

});