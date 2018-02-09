$(document).ready(function () {

    var customerActivityItemTemplate = $("#activityItemTemplate").html();

    $(".see-more").click(function () {

            var activityListCurrentCount = $(".activity-list").children().length;
            console.log(activityListCurrentCount);
            var currentPageNumber = activityListCurrentCount / 5;

            var nextPageNumber = (currentPageNumber + 1) - 1;

            console.log(nextPageNumber);

            var ci = $("#customer-id").val();

            $(".see-more").hide();
            $(".see-more-loader").css("display", "block");

            setTimeout(function () {

                $.post("/FBExportSystem/see-more-activities", {
                customerId : ci,
                pageNumber : nextPageNumber
                }, function (response) {
                    
                    var activityItemTemplate = _.template(customerActivityItemTemplate);

                    if (response.length > 0) {

                        for (var i = 0; i != response.length; ++i) {

                            var activityItem =  activityItemTemplate({
                                activityHeader : response[i].header,
                                activityDescription : response[i].description,
                                activityDate : response[i].date
                            });

                            console.log(activityItem);

                            $(".activity-list").append(activityItem);
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