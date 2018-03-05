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
    	showPreLoader();
    	$.ajax({
    		type: 'POST',
    		url: "/FBExportSystem/admin/edit-system-settings",
    		processData: false,
  	      	contentType: false,
  	      	cache: false,
            data : formData,
            success: function(result){
            	if(result == "Success"){
            		hidePreLoader();
            		iziToast.success({
            		    title: 'SUCCESS',
            		    message: "You've successfully update system settings!",
            		});
            	}else{
            		hidePreLoader();
            		iziToast.error({
            		    title: 'ERROR',
            		    message: 'Failed to update system settings!',
            		});
            	}
            },error: function(e){
            	hidePreLoader();
            	console.log("ERROR: ",e);
            }
    	});
    }
    
    $("#btnBackupData").click(function(e){
    	systemSettingsData("/FBExportSystem/admin/backup-data", 'BACKUP DATA', 'Are you sure you want to backup your data?', "You've successfully backup data!");
    });
    
    $("#btnRestoreData").click(function(e){
    	systemSettingsData("/FBExportSystem/admin/restore-data", 'RESTORE DATA', 'Are you sure you want to restore your data?', "You've successfully restore data!");
    });
 
    function systemSettingsData(urlData, titleData, messageData, successMessage){
    	iziToast.question({
    	    timeout: 20000,
    	    close: false,
    	    overlay: true,
    	    toastOnce: true,
    	    id: 'question',
    	    zindex: 999,
    	    title: titleData,
    	    message: messageData,
    	    position: 'center',
    	    buttons: [
    	        ['<button><b>YES</b></button>', function (instance, toast) {
    	        	showPreLoader();
    	        	$.ajax({
    	        		type: 'POST',
    	        		url: urlData,
    	        		processData: false,
    	      	      	contentType: false,
    	      	      	cache: false,
    	                success: function(result){
    	                	if(result == "Success"){
    	                		iziToast.success({
    	                		    title: 'SUCCESS',
    	                		    message: successMessage,
    	                		});
    	                    	
    	                		hidePreLoader();
    	                	}else{
    	                		iziToast.error({
    	                		    title: 'ERROR',
    	                		    message: result,
    	                		});
    	                		hidePreLoader();

    	                	}
    	                },error: function(e){
    	                	console.log("ERROR: ",e);
    	                	hidePreLoader();
    	                }
    	        	});
    	        	
    	        	
    	            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
    	 
    	        }, true],
    	        ['<button>NO</button>', function (instance, toast) {
    	 
    	            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
    	 
    	        }]
    	    ],
    	    onClosing: function(instance, toast, closedBy){
    	        console.info('Closing | closedBy: ' + closedBy);
    	    },
    	    onClosed: function(instance, toast, closedBy){
    	        console.info('Closed | closedBy: ' + closedBy);
    	    }
    	});
    }
    
    /*PreLoader*/
    function showPreLoader(){
    	$(".loader").show();
    	$("body").find("*").attr("disabled", "disabled");
    	$("body").find("a").click(function (e) { e.preventDefault(); });
    }
    
    function hidePreLoader(){
    	$(".loader").hide();
    	$("body").find("*").removeAttr("disabled");
    	$("body").find("a").unbind("click");
    }
    /*PreLoader*/
    
});
