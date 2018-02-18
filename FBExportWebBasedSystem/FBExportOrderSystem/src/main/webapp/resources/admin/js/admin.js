$(document).ready(function () {

    setInterval(function () {
        $("#main-nav-date-time").html(moment().format("dddd, MMMM Do YYYY, h:mm:ss a"));
    }, 1000);

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    
});