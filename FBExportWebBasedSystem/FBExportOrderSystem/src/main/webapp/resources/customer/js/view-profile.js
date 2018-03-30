$(document).ready(function () {

    var customerActivityItemTemplate = $("#activityItemTemplate").html();

    var deleteActivityItem = function (e) {
        var activityItemId = $(e.currentTarget).closest("span").attr("id"); 
        var activityItem = $(e.currentTarget).closest("span");
        var cId = $("#customer-id").val();

        $.post("/FBExportSystem/delete-activity", {
            activityId : activityItemId,
            customerId : cId
        }, function () {
            activityItem.fadeIn("slow", function () {
                $(this).remove();
            });
        });
    };

    var deleteAllActivity = function () {
           
        var ids = {
          idElem : []
        };
        
        $(".activity-list>span").each(function (index) {
            console.log($(this).attr("id"));

            ids.idElem.push(parseInt($(this).attr("id")));

        });
        console.log(JSON.stringify(ids));
        $.ajax({
            type : "POST",
            url : "/FBExportSystem/delete-all-activity",
            data : {
                deleteData : JSON.stringify(ids) 
            },
            success : function () {
                  $(".activity-list>span").fadeIn("slow", function () {
                    $(this).remove();
                  });

                  
                  $(".clear-all").addClass("disabled").addClass("grey-text");
                  $(".see-more").hide();
                  $(".no-activity").css("display", "block");
            }
        })

        // $.post("/FBExportSystem/delete-all-activity", {
        //     activityId : activityItemId,
        //     customerId : cId
        // }, function () {
        //     activityItem.fadeIn("slow", function () {
        //         $(this).remove();
        //     });
        // });
        
    };

    $(".clear-all").click(deleteAllActivity);

    $(".activity-list>span button.close").click(deleteActivityItem);

    $(".see-more").click(function () {

            var activityListCurrentCount = $(".activity-list").children().length;
            console.log(activityListCurrentCount);


            var ci = $("#customer-id").val();

            $(".see-more").hide();
            $(".see-more-loader").css("display", "block");

            setTimeout(function () {

                $.post("/FBExportSystem/see-more-activities", {
                customerId : ci,
                pageCount : activityListCurrentCount
                }, function (response) {
                    
                    var activityItemTemplate = _.template(customerActivityItemTemplate);

                    if (response.length > 0) {

                        for (var i = 0; i != response.length; ++i) {

                            var activityItem =  activityItemTemplate({
                                activityId : response[i].activityId,
                                activityHeader : response[i].header,
                                activityDescription : response[i].description,
                                activityDate : timeago().format(response[i].date)
                            });

                            console.log(activityItem);

                            $(".activity-list").append(activityItem);
                            
                            $(".activity-list>span:last .close").click(deleteActivityItem);

                            $(".activity-list>span:last").hide();
                            
                            $(".activity-list>span:last").fadeIn("slow");

                        }

                        $(".see-more").show();
                        $(".see-more-loader").css("display", "none");

                    } else {

                        $(".see-more").hide();
                        $(".see-more-loader").css("display", "none");
                    }

                });

            }, 2000);



    });

    $(".activity-list").ready(function () {

        var $activityList = $(this);

        setTimeout(function () {
            
            $activityList.find("span").each(function () {
                var $dateAgo = $(this).find("small");
                $dateAgo.html(timeago().format($dateAgo.html()));
            });

            $(".activityLoadingDisplay").remove();

            $(".activity-list").removeClass("d-none");
            $(".see-more").removeClass("d-none");
            $(".clear-all").removeClass("d-none");


        }, 1000);

    });
});