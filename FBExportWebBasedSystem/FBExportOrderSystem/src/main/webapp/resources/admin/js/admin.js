$(document).ready(function () {

    setInterval(function () {
        $("#main-nav-date-time").html(moment().format("dddd, MMMM Do YYYY, h:mm:ss a"));
    }, 1000);

    
});