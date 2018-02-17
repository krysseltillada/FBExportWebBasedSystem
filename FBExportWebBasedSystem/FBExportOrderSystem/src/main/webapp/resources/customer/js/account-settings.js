$(document).ready(function () {

    var cid = $("#customer-id").val();

    console.log(cid);

    $(".countryCode").ready(function () {

        //https://restcountries.eu/rest/v2/name/Australia

        console.log("tae");

         $.get("/FBExportSystem/get-customer", 
             {
                customerId : cid
             }, function (response) {
                 console.log(response);
                var countryCode = response.contact.countryCode;
                console.log(countryCode);
                $('.countryCode').find('option[value~="' + countryCode + '"]').prop('selected', true);
             }, "json");

    });

    $('.country').ready(function () {

        console.log("tae e");

         $.get("/FBExportSystem/get-customer", 
             {
                customerId : cid
             }, function (response) {
                var country = response.address.country;

                console.log(country);

                $('.country').find('option[value*="' + country + '"]').prop('selected', true);
             }, "json");
        
    });

    

});