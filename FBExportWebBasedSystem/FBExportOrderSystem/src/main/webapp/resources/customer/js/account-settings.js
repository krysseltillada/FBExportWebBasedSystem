$(document).ready(function () {
	
	$("#showPassword").click(function(){
		if($("#new-password").attr("type") == "password")
			$("#new-password").attr("type", "text");
		else
			$("#new-password").attr("type", "password");
		
		if($("#old-password").attr("type") == "password")
			$("#old-password").attr("type", "text");
		else
			$("#old-password").attr("type", "password");
		
	});
	
    var cid = $("#customer-id").val();

    $(".countryCode").ready(function () {

        //https://restcountries.eu/rest/v2/name/Australia

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
         $.get("/FBExportSystem/get-customer", 
             {
                customerId : cid
             }, function (response) {
                var country = response.address.country;

                console.log(country);

                $('.country').find('option[value*="' + country + '"]').prop('selected', true);
             }, "json");
        
    });

      function filePreviewAdd(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-upload").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
      }

      $("#edit-profile-image").change(function () {
          filePreviewAdd(this);
      });

});