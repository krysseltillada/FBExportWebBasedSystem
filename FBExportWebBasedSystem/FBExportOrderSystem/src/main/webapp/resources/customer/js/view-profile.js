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
           
        var ids = [];
        
        $(".activity-list>span").each(function (index) {
            console.log($(this).attr("id"));

            ids.push(parseInt($(this).attr("id")));

        });

        $.ajax({
            type : "POST",
            url : "/FBExportSystem/delete-all-activity",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            data : {
                deleteData : JSON.stringify(ids) 
            },
            success : function () {
                console.log("tae mo");
            },
            dataType : "json"
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
                                activityDate : response[i].date
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
});