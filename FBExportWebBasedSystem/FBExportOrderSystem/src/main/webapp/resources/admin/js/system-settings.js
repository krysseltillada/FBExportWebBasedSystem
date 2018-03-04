$(document).ready(function () {
    $(".timepicker").timepicki();
    
    /*Remove Duplicates*/
    removeDuplicates("#inlineFormCustomSelect");
    
    function removeDuplicates(className){
    	var usedNames = {};
        $(className+" > option").each(function () {
            if (usedNames[this.value]) {
                $(this).remove();
            } else {
                usedNames[this.value] = this.text;
            }
        });
    }
    /*Remove Duplicates*/
    
    $("#formSystemSettingsEdit").submit(function(event){
  	  event.preventDefault();
  	  
  	  ajaxFormSystemSettings();
    });
    
    function ajaxFormSystemSettings(){
    	var formData = new FormData($("#formSystemSettingsEdit")[0]);
    	
    	$.ajax({
    		type: 'POST',
    		url: "/FBExportSystem/admin/edit-system-settings",
    		processData: false,
  	      	contentType: false,
  	      	cache: false,
            data : formData,
            success: function(result){
            	if(result == "Success"){
            		iziToast.success({
            		    title: 'SUCCESS',
            		    message: "You've successfully update system settings!",
            		});
            	}else{
            		iziToast.error({
            		    title: 'ERROR',
            		    message: 'Failed to update system settings!',
            		});
            	}
            },error: function(e){
            	console.log("ERROR: ",e);
            }
    	});
    }
});