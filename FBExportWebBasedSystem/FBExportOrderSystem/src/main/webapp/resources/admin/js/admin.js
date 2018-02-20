// Configure Underscore.js template syntax to avoid conflict with JSP syntax.
//
// Use templates like:
//
//      {{= value }}
//   or {{ statement }}
//   or {{- HTML-escaped text }}
//


$(function () {
  _.templateSettings.interpolate = /\{\{=([^-][\S\s]+?)\}\}/g;
  _.templateSettings.evaluate = /\{\{([^-=][\S\s]+?)\}\}/g;
  _.templateSettings.escape = /\{\{-([^=][\S\s]+?)\}\}/g;
});

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