$(document).ready(function () {
	
    $(".btnProductItemAddToCart").click(function (event) {
        var $card = $(event.currentTarget).parent().parent().parent();
        var $cardBody = $card.find("div.card-body");

        var $spansHeaderInfo = $card.find("div div div span");

        console.log($spansHeaderInfo.html());

        var productItem = {
            productImage : $card.find("img").attr("src"),
            price : $spansHeaderInfo.eq(0).text(),
            massType : $spansHeaderInfo.eq(1).find("span").text(),
            origin : $spansHeaderInfo.eq(3).text(),
            name : $cardBody.find("h4.card-title a").text(),
            description : $cardBody.find("p.card-text").text(),
            expirationDate : $cardBody.find("span span.red-text").text()
        };

        showAddToCartModal(productItem);
    });
    
    $("#reviewProduct").submit(function(event){
    	 $form = $(this);
    	 event.preventDefault();
    	  
    	 ajaxFormReviewProduct($form.attr('action'));
      });
    
    function ajaxFormReviewProduct(action){
    	var formData = new FormData($("#reviewProduct")[0]);
    	
    	$.ajax({
    		type: 'POST',
    		url: action,
    		processData: false,
  	      	contentType: false,
  	      	cache: false,
            data : formData,
            success: function(result){
            	if(result == "Success"){
            		$("#errorReview").empty();

            		 alertify.success("You've successfully post a review.");
            		 
            		 $("#comments").prepend("<div>" +
            		 		"<div class='row mt-3'>" +
            		 		"<div class='col-lg-3 text-center'>"+
            		 		"<img src='"+$("#profileImage").attr("src")+"' width='100' height='100' class='rounded-circle' alt='Sample' >"+
            		 		"</div>"+
            		 		"<div class='col-lg-9 col-xl-9'>"+
						    "<h3 class='mb-3 font-bold dark-grey-text'>"+
						    "</h3>"+
						    "<p class='grey-text'>"+$("#textarea-char-counter").val()+"</p>"+
						                "<p>by<a class='font-bold dark-grey-text'> "+$("#customerUsername").val()+" </a>, "+ moment().format('MMMM D, YYYY h:mm:ss A') +"</p>"+
						    "</div>"+
            		 		"</div>" +
            		 		"<hr class='mb-5'>"+
            		 		"</div>");
            		 
            		 $("#textarea-char-counter").val("");
            	}else{
            		var jsonData = JSON.parse(result);
            		$("#errorReview").empty();
      	    	  	$.each(jsonData, function (index, value) {
      	    	  		$("#errorReview").append("<div class='red-text'> *"+value+" </div>");
      	    		});
            	}
            	
            },error: function(e){
            	console.log("ERROR: ",e);
            }
    	});
    }

});