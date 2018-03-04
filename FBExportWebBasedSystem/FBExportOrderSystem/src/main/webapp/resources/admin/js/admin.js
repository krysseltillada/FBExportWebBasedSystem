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

     
    $(".countryCode").ready(function () {
        $.ajax({
            url : "https://restcountries.eu/rest/v2/all",
            dataType : "json",
            success : function (restCountriesData) {


                for (var i = 0; i != restCountriesData.length; ++i) {
                    var countryLetterCode = restCountriesData[i].alpha2Code.trim();
                    var countryCode = restCountriesData[i].callingCodes[0].trim();

                    if (countryCode.length > 0)
                        $(".countryCode").append('<option value = "' + countryCode + '">+' + countryCode + ' (' + countryLetterCode + ') </option>');

                }

            }
        });
    });

    $('.country').ready(function () {
        $.ajax(
            {
                url : "https://restcountries.eu/rest/v2/all",
                dataType : "json",
                success : function (responseData) {

                    for (var i = 0; i != responseData.length; ++i) {

                        if (responseData[i].alpha2Code.length > 0) {
                            var country = responseData[i].name.trim();
                            var countryCode = responseData[i].alpha2Code.trim();
                            $('.country').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                        }

                    }

                    var token = $("meta[name='_csrf']").attr("content");
                    var header = $("meta[name='_csrf_header']").attr("content");
                    
                    $(document).ajaxSend(function(e, xhr, options) {
                        xhr.setRequestHeader(header, token);
                    });


                }
            }
        );
    });
    
    /*Logout Time*/
    if(window.location.pathname != "/FBExportSystem/admin/" && window.location.pathname != "/FBExportSystem/admin/login/" && window.location.pathname != "/FBExportSystem/admin" && window.location.pathname != "/FBExportSystem/admin/login"){
    	console.log(window.location.pathname);
    	var timeoutID;
        
        function setup() {
            this.addEventListener("mousemove", resetTimer, false);
            this.addEventListener("mousedown", resetTimer, false);
            this.addEventListener("keypress", resetTimer, false);
            this.addEventListener("DOMMouseScroll", resetTimer, false);
            this.addEventListener("mousewheel", resetTimer, false);
            this.addEventListener("touchmove", resetTimer, false);
            this.addEventListener("MSPointerMove", resetTimer, false);
         
            startTimer();
        }
        setup();
         
        function startTimer() {
            // wait before calling goInactive
            timeoutID = window.setTimeout(goInactive, 2000);
        }
         
        function resetTimer(e) {
            window.clearTimeout(timeoutID);
         
            goActive();
        }
         
        function goInactive() {
            console.log("IN ACTIVE");
        }
         
        function goActive() {
            console.log("ACTIVE");
                 
            startTimer();
        }
    }
    /*Logout Time*/
    
});