//$(document).ready(function(){
//	$("#resetForm").submit(function(e){
//		$form = $(this);
//		
//		$(".reset-email").css("display","block");
//		$("#reset-submit").hide();
//		e.preventDefault();
//		
//		var formData = new FormData($("#resetForm")[0]);
//    	$.ajax({
//    		type: 'POST',
//    		url: $form.attr('action'),
//    		processData: false,
//  	      	contentType: false,
//  	      	cache: false,
//            data : formData,
//            success: function(result){
//            	var jsonData = JSON.parse(result);
//        		
//  	    	  	$.each(jsonData, function (index, value) {
//  	    	  		$("#errorForgotPassword").append("<div class='red-text'> *"+value+" </div>");
//  	    	  		alert(value);
//  	    		});
//            	if(result == "Message sent")
//            		alertify.success(result);
//            	else
//            		alertify.error(result);
//            	
//            	$('#resetForm')[0].reset();
//            	
//            	$(".reset-email").css("display","none");
//        		$("#reset-submit").show();
//            },error: function(e){
//            	console.log("ERROR: ",e);
//            	$(".reset-email").css("display","none");
//        		$("#reset-submit").show();
//            }
//    	});
//	});
//});