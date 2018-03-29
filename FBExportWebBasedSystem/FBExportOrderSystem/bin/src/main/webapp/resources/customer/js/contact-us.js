
	$("#contactForm").submit(function(e){
		$(".sending-email").css("display","block");
		$("#contact-us-submit").hide();
		e.preventDefault();
		
		var formData = new FormData($("#contactForm")[0]);
    	$.ajax({
    		type: 'POST',
    		url: "/FBExportSystem/contact-us-email",
    		processData: false,
  	      	contentType: false,
  	      	cache: false,
            data : formData,
            success: function(result){
            	if(result == "Message sent")
            		alertify.success(result);
            	else
            		alertify.error(result);
            	
            	$('#contactForm')[0].reset();
            	
            	$(".sending-email").css("display","none");
        		$("#contact-us-submit").show();
            },error: function(e){
            	hidePreLoader();
            	console.log("ERROR: ",e);
            	$(".sending-email").css("display","none");
        		$("#contact-us-submit").show();
            }
    	});
	});
