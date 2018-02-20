$(document).ready(function () {

    setInterval(function () {
        $("#main-nav-date-time").html(moment().format("dddd, MMMM Do YYYY, h:mm:ss a"));
    }, 1000);

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
    
    /*Country*/ 
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


                }
            }
        );
    });
    /*Country*/

    
});