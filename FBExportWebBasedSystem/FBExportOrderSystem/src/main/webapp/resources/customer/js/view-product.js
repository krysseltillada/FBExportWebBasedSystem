$(document).ready(function () {
	
	
	changeStar();
	
	function changeStar(){
		var averageRating = $("#averageRating").text();
		
		if(averageRating <= 0.0)
			showStars("fa-star-o","fa-star-o","fa-star-o","fa-star-o","fa-star-o");
		else if(averageRating == 1.0)
			showStars("fa-star","fa-star-o","fa-star-o","fa-star-o","fa-star-o");
		else if(averageRating == 2.0)
			showStars("fa-star","fa-star","fa-star-o","fa-star-o","fa-star-o");
		else if(averageRating == 3.0)
			showStars("fa-star","fa-star","fa-star","fa-star-o","fa-star-o");
		else if(averageRating == 4.0)
			showStars("fa-star","fa-star","fa-star","fa-star","fa-star-o");
		else if(averageRating == 5.0)
			showStars("fa-star","fa-star","fa-star","fa-star","fa-star");
		else if(averageRating > 1.0 && averageRating < 2.0)
			showStars("fa-star","fa-star-half-o","fa-star-o","fa-star-o","fa-star-o");
		else if(averageRating > 2.0 && averageRating < 3.0)
			showStars("fa-star","fa-star","fa-star-half-o","fa-star-o","fa-star-o");
		else if(averageRating > 3.0 && averageRating < 4.0)
			showStars("fa-star","fa-star","fa-star","fa-star-half-o","fa-star-o");
		else if(averageRating > 4.0 && averageRating < 5.0)
			showStars("fa-star","fa-star","fa-star","fa-star","fa-star-half-o");
	}
	
	function showStars(s1, s2, s3, s4, s5){
		$("#star1").attr("class", "fa "+s1+" yellow-text fa-2x ");
		$("#star2").attr("class", "fa "+s2+" yellow-text fa-2x ");
		$("#star3").attr("class", "fa "+s3+" yellow-text fa-2x ");
		$("#star4").attr("class", "fa "+s4+" yellow-text fa-2x ");
		$("#star5").attr("class", "fa "+s5+" yellow-text fa-2x ");
	}
	
    $(".btnProductItemAddToCart").click(function (event) {
        var $card = $(event.currentTarget).parent().parent().parent();
        var $cardBody = $card.find("div.card-body");

        var $spansHeaderInfo = $card.find("div div div span");
        
        var currency = $card.find("span>span:eq(1)").html();
        
        console.log($spansHeaderInfo.html());

        var productItem = {
            productImage : $card.find("img").attr("src"),
            price : $spansHeaderInfo.eq(0).text(),
            massType : $spansHeaderInfo.eq(1).find("span").text(),
            origin : $spansHeaderInfo.eq(5).text(),
            name : $cardBody.find("h4.card-title").text(),
            description : $cardBody.find("p.card-text").text(),
            productId : $cardBody.find("#productId").val(),
            stockStatus : $cardBody.find("#product-stock-status").html(),
            datePosted : $cardBody.find("#product-date-posted").html(),
            realPriceApprox : $card.find("#real-price-approx").val()
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
            	if(result == '["Please rate the product.","Please add your review, comment or feedback."]' || result == '["Please add your review, comment or feedback."]' || result == '["Please rate the product."]'){
            		var jsonData = JSON.parse(result);
            		$("#errorReview").empty();
      	    	  	$.each(jsonData, function (index, value) {
      	    	  		$("#errorReview").append("<div class='red-text'> *"+value+" </div>");
      	    		});
            	}else{
            		
      	    	  $("#errorReview").empty();

         		 alertify.success("You've successfully post a review.");
         		
         		 var jsonLastReviewId = JSON.parse(result);
         		 
         		 $("#comments").prepend("<div>" +
         		 		"<div class='row mt-3'>" +
         		 		"<div class='col-lg-3 text-center'>"+
         		 		"<img src='"+$("#profileImage").attr("src")+"' width='100' height='100' class='rounded-circle' alt='Sample' >"+
         		 		"</div>"+
         		 		"<div class='col-lg-9 col-xl-9'>"+
	            		"<button type='button' class='close deleteReview' aria-label='Close' style='cursor: pointer;'><span aria-hidden='true'>&times;</span></button>"+
	            			"<input class='reviewId' type='hidden' value='"+jsonLastReviewId["lastReviewId"]+"'/>"+
						    "<h3 class='mb-3 font-bold dark-grey-text'>"+
						    "</h3>"+
						    "<p class='grey-text'>"+$("#textarea-char-counter").val()+"</p>"+
						    "<p>by<a class='font-bold dark-grey-text'> "+$("#customerUsername").val()+" </a>, "+ moment().format('MMMM D, YYYY h:mm:ss A') +"</p>"+
						    "</div>"+
         		 		"</div>"+
         		 		"<hr class='mb-5'>"+
         		 		"</div>");
         		 
         		 $("#textarea-char-counter").val("");
         		 
         		 updateRating(result);
            	}
            	
            },error: function(e){
            	console.log("ERROR: ",e);
            }
    	});
    }
    
    
    function showRates(progress,rate,value,total){
    	$(progress).css("width", ((value / total ) * 100).toFixed(1)+"%");
		 $(rate).text(((value / total ) * 100).toFixed(1)+"%");
    }
    
    $(document).on("click", ".deleteReview",function(){
    	
    	var deleteReview = $(this);
    	var reviewId = $(this).next().val();
    	var productId = $("#productId").val();
    	
    	alertify.confirm("Are you sure you want to delete review?",
    		function(){
    			
    		$.ajax({
        		type: 'POST',
        		url: "/FBExportSystem/delete-review/"+productId+"/"+reviewId,
        		processData: false,
      	      	contentType: false,
      	      	cache: false,
      	      	data: reviewId,
                success: function(result){
                	
    		    	alertify.success("You've successfully delete review.");
    		    	
    		    	deleteReview.parent().parent().parent().remove();
                	updateRating(result);
                },error: function(e){
                	console.log("ERROR: ",e);
                }
        	});
    		
		  	},
		  	function(){/*Cancel*/});
    	 
    });
    
    function updateRating(result){
    	var jsonData = JSON.parse(result);
		 var total = jsonData["CountTotal"];
		 
		 $.each(jsonData, function (index, value) {
			 
			 if(index == "Average"){
				 $("#averageRating").text(value.toFixed(2));
				 changeStar();
			 }else if(index == "Count5.0"){
				 showRates("#count5-progress", "#count5-rate",value,total);
			 }else if(index == "Count4.0"){
				 showRates("#count4-progress", "#count4-rate",value,total);
			 }else if(index == "Count3.0"){
				 showRates("#count3-progress", "#count3-rate",value,total);
			 }else if(index == "Count2.0"){
				 showRates("#count2-progress", "#count2-rate",value,total);
			 }else if(index == "Count1.0"){
				 showRates("#count1-progress", "#count1-rate",value,total);
			 }
			 
   		});
   	
    }
    
   
});