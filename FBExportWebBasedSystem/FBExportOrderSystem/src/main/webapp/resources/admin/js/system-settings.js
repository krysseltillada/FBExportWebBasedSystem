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
      
    $("#btnBackupData").click(function(e){
    	systemSettingsData("/FBExportSystem/admin/backup-data", 'BACKUP DATA', 'Are you sure you want to backup your data?', "You've successfully backup data!");
    });
    
    $("#btnRestoreData").click(function(e){
    	systemSettingsData("/FBExportSystem/admin/restore-data", 'RESTORE DATA', 'Are you sure you want to restore your data?', "You've successfully restore data!");
    });
    
    $("#btnExportDatabase").click(function(e){
    	iziToast.question({
    	    timeout: 20000,
    	    close: false,
    	    overlay: true,
    	    toastOnce: true,
    	    id: 'question',
    	    zindex: 999,
    	    title: "EXPORT DATABASE",
    	    message: "Are you sure you want to export your database?",
    	    position: 'center',
    	    buttons: [
    	        ['<button><b>YES</b></button>', function (instance, toast) {
    	        	
    	        	window.location.replace("/FBExportSystem/admin/export/backup");
    	        	
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
    
    $("#sqlfile").change(function (){
        var fileName = $(this).val();
        $("#filename-uploaded").html(fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length));
      });
    
});
