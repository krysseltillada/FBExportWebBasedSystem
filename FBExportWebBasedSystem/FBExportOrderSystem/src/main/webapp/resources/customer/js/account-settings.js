$(document).ready(function () {

    var cid = $("#customer-id").val();

    console.log(cid);

    $("#countryCode").ready(function () {

        //https://restcountries.eu/rest/v2/name/Australia

         $.get("/FBExportSystem/get-customer", 
             {
                customerId : cid
             }, function (response) {
                 console.log(response);
                var countryCode = response.contact.countryCode;
                console.log(countryCode);
                $('#countryCode option[value~=' + countryCode + ']').prop('selected', true);
             }, "json");

    });

    $('#country').ready(function () {

         $.get("/FBExportSystem/get-customer", 
             {
                customerId : cid
             }, function (response) {
                var country = response.address.country;
                $('#country option[value*=' + country + ']').prop('selected', true);
             }, "json");
        
    });

    

});