$(document).ready(function () {

    setTimeout(function () {

        $("div.notifications>.list-group>span").each(function () {

            var $dateAgo = $(this).find("small");

            console.log($dateAgo.html());

            $dateAgo.html(timeago().format($dateAgo.html()));
        });

        $("div.notificationsLoadingDisplay").addClass("d-none");
        $("div.notifications").removeClass("d-none");

        $("#btnClearNotifications").removeClass("d-none");
        $("#btnSeeMoreNotifications").removeClass("d-none");

    }, 1000);

});