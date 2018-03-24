$(document).ready(function () {
    
    
    /*CLIENT TABLE*/

    

      var clienttable = $('#client-table').DataTable({
        "scrollX": true,
        "columns": [
          {"orderable" : false},
          {"orderable" : false},
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          {"orderable" : false},
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
      });


      
      $('#client-table tbody').on( 'click', 'tr', function () {
    		  
    		  if ( $(this).hasClass('selected') ) {
                  $(this).removeClass('selected');
                  
                  $boxes.each(function(){
            			 if($(this).is(":checked")){
            				 $(this).closest("tr").css("background-color", "#e7ffd6");
            			 }else{
            				 $(this).closest("tr").css("background-color", "#ffd6d6");
            			 }
            		 	});
              }
              else {
              	clienttable.$('tr.selected').removeClass('selected');
                  $(this).addClass('selected');
                  
                  $boxes.each(function(){
          			 if($(this).is(":checked")){
          				 $(this).closest("tr").css("background-color", "#e7ffd6");
          			 }else{
          				 $(this).closest("tr").css("background-color", "#ffd6d6");
          			 }
          			
          		 	});
                  
                  if($(this).attr("role")){
                	  
                	  
               
                	  $(this).css("background-color", "#b3c9dd");
                 
                  
                  }
    		  
    		 
              }
    	  
    	  

        
      } );

      $('#btnUpdateClient').click( function () {
    	  emptyDiv("#errorClientEdit");
        var clientData = clienttable.row('.selected').data();
        if($('#client-table tbody tr').hasClass("selected")){
        	 $("#usernameClientEdit").val(clientData[2]);
        	 $("#firstnameClientEdit").val(clientData[3]);
             $("#middlenameClientEdit").val(clientData[4]);
             $("#lastnameClientEdit").val(clientData[5]);
             if(clientData[6] == "MALE")
             	$("#maleClientEdit").prop('checked', true);
             else
             	$("#femaleClientEdit").prop("checked", true);
             $("#ageClientEdit").val(clientData[7]);
             $("#emailClientEdit").val(clientData[8]);
             $("#countryClientEdit").val(clientData[9]).change();
             $("#cityClientEdit").val(clientData[10]);
             $("#addressClientEdit").val(clientData[11]);
             $("#zipcodeClientEdit").val(clientData[12]).change();
             $("#countryCodeClientEdit").val(clientData[13]);
             $("#phonenumberClientEdit").val(clientData[14]);
        }else{
        	$("#formClientEdit")[0].reset();
        }
      });

      /*IS ACTIVE TOGGLE*/
      var $boxes = $('input[name=isActive]');
      $boxes.each(function(){
        toggleIsActive(this);
      });

      $boxes.on('change', function(){
    	
    	if($(this).closest("tr").find(".usernameEmployeeRow").hasClass("usernameEmployeeRow")){
    		var usernameEmployee = $(this).closest('tr').find(".usernameEmployeeRow").html();
       	  	ajaxEnabledEmployee(usernameEmployee);
    	}else if($(this).closest("tr").find(".usernameAdminRow").hasClass("usernameAdminRow")){
    		var usernameAdmin = $(this).closest('tr').find(".usernameAdminRow").html();
    	  	ajaxEnabledAdmin(usernameAdmin);
    	}else{
    		var usernameCustomer = $(this).closest('tr').find(".usernameCustomerRow").html();
        	ajaxEnabledCustomer(usernameCustomer);
    	}
    	 
        
    	toggleIsActive(this);
      });

      function toggleIsActive(btnIsActive){
        if($(btnIsActive).is(":checked")){
          $(btnIsActive).closest('tr').css("background-color", "#e7ffd6");
        }else{
          $(btnIsActive).closest('tr').css("background-color", "#ffd6d6");
        }
      }
      /*IS ACTIVE TOGGLE*/

      $('.fa-chevron-circle-down').click(function () {
        var parentRow = $(this).closest('tr');


        var row = clienttable.row(parentRow);
        
        clienttable.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
          	var clientTableRow = clienttable.row( rowIdx );
          	
          	if(clientTableRow.child.isShown()){
          		$(".fa-chevron-circle-up").removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
          		$('div.showMoreInfoSlider', clientTableRow.child()).slideUp(function () {
          			clientTableRow.child.hide();
                    });
          	}
              
          } );
        
        
        

        if (row.child.isShown()) {
            $(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
            $('div.showMoreInfoSlider', row.child()).slideUp(function () {
              row.child.hide();
            });
        } else {
	
        	
            var rowMoreInformationCollapse = $("#collapsingClientTableMoreInformation").html();
            row.child(rowMoreInformationCollapse, 'no-padding').show();
            $(this).removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up");
            $('div.showMoreInfoSlider', row.child()).slideDown(function () {

              $(this).parent().removeAttr('class').parent().removeAttr('class');
            });
            $('div.showMoreInfoSlider').css("display", "flex");
        }
        
        setTimeout(function(){
        	/*Customer Activity*/
      	  	var clientUsername = row.data()[2];
      	  	ajaxShowCustomerActivities(clientUsername);
      	  	/*Customer Activity*/
        	
        }, 400);
        
        
        

      });


      /*Country Edit Client*/

      $('#countryClientEdit').change(function () {

          var $cityTextBox = $('#cityClientEdit');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });
      /*Country Edit Client*/

      /*CLIENT FILTER*/

      $.fn.dataTable.ext.search.push(
          function( settings, data, dataIndex ) {
              var min = parseInt( $('#minAgeClient').val(), 10 );
              var max = parseInt( $('#maxAgeClient').val(), 10 );
              var age = parseFloat( data[7] ) || 0; // use data for the age column

              if ( ( isNaN( min ) && isNaN( max ) ) ||
                   ( isNaN( min ) && age <= max ) ||
                   ( min <= age   && isNaN( max ) ) ||
                   ( min <= age   && age <= max ) )
              {
                  return true;
              }
              return false;
          }
      );
      
      $.fn.dataTable.ext.search.push(
    		  
    			  function( settings, data, dataIndex ) {
    		    	
    		    	if($('#filterCustomerGender').val() != null){
	                      var gender = $('#filterCustomerGender').val().toUpperCase();
	                      var genderColumn = data[6];
	                      
	                      if ( ( gender == genderColumn ) )
	                      {
	                          return true;
	                      }else if(gender == "ALL"){
	                    	  return true;
	                      }
	                      return false;
    			  	}
                  }
    	 
              
          );
      
      $.fn.dataTable.ext.search.push(
    		  
			  function( settings, data, dataIndex ) {
		    	
		    	if($('#countryClient').val() != null){
                      var country = $('#countryClient').val();
                      var countryColumn = data[9];
                      
                      if ( ( country == countryColumn ) )
                      {
                          return true;
                      }else if(country == "All"){
                    	  
                    	  return true;
                      }
                      return false;
			  	}
              }
	   
      );
      
      $.fn.dataTable.ext.search.push(
    		  
			  function( settings, data, dataIndex ) {
		    	
		    	if($('#filterCustomerStatus').val() != null){
                      var status = $('#filterCustomerStatus').val();
                      var statusRow = clienttable.row(dataIndex).node();
                      if(status == "All"){
                    	  return true;
                      }else if (String($(statusRow).find('input').prop('checked')) == status) { // active

                          return true;
                      }
                      
                      return false;
			  	}
              }
	 
          
      );

      // Event listener to the two range filtering inputs to redraw on input
      $('#minAgeClient, #maxAgeClient').keyup( function() {
          clienttable.draw();
      } );
      
      $("#filterCustomerGender").on("change", function(){
    	  clienttable.draw();
      });
      
      $("#countryClient").on("change", function(){
    	  clienttable.draw();
      });
      
      $("#filterCustomerStatus").on("change", function(){
    	  clienttable.draw();
      });

      /*CLIENT FILTER*/

      /*CLIENT TABLE*/
      
      /*AJAX EDIT EMPLOYEE*/
      
      $("#formClientEdit").submit(function(event){
    	  emptyDiv("#errorClientEdit");
    	  
    	  event.preventDefault();
    	  
    	  ajaxClientEdit();
    	  
    	  
      });
      
      function ajaxClientEdit(){
    	  
    	  var formData = new FormData($("#formClientEdit")[0]);
    	 
    	  $.ajax({
    		  type: "POST",
    	      enctype: 'multipart/form-data',
    	      url : "/FBExportSystem/admin/edit-customer",
    	      processData: false,
    	      contentType: false,
    	      cache: false,
              data : formData,
    	      success : function(result) {
    	    	  if(result == "Success"){
    	    		  $("#errorClientEdit").append("<div class='alert alert-success' > * You've successfully update employee's account! </div> ");
    	    		  
    	    		  $("#formClientEdit")[0].reset();
    	    		  
    	    		  location.reload();
    	    	  }else{
    	    		  var jsonData = JSON.parse(result);
        	    	  $.each(jsonData, function (index, value) {
        	    		  $("#errorClientEdit").append("<div class='alert alert-danger'> *"+value+" </div>");
        	    		});
        	    	  
    	    	  }
              },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      
      /*AJAX EDIT EMPLOYEE*/
      
      /*Activate and Deactivate account*/
      function ajaxEnabledCustomer(username){
    	 
    	  $.ajax({
    		  type : "POST",
	  		  contentType : "application/json",
	  		  data : username,
	  		  dataType : 'text',
    	      url : "/FBExportSystem/admin/enabled-customer",
    	      success : function(result) {},
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*Activate and Deactivate account*/
      
      /*Customer's Activity*/
      function ajaxShowCustomerActivities(username){
     	 
    	  $.ajax({
    		  type : "POST",
	  		  contentType : "application/json",
	  		  data : username,
	  		  dataType : 'text',
    	      url : "/FBExportSystem/admin/show-customer-activity",
    	      success : function(result) {
    	    	//show data table
    	    	  var activityTable = $('#user-activity-table').DataTable({
    	    		  "deferLoading": 57
    	    	  });
    	    	  var jsonData = JSON.parse(result);
    	    		  
    	    	  $.each(jsonData, function (index, value) {
    	    		  activityTable.row.add([
    	    		  		value["header"],
    	    		  		value["description"],
    	    		  		value["date"]
    	    		  ]).draw(false);
    	    	  });
    	    	  
    	    	   
    	    	  
    	      },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*Customer's Activity*/
      















      /*EMPLOYEE TABLE*/
      var employeetable = $('#employee-table').DataTable({
        "scrollX": true,
        "columns": [
          {"orderable" : false},
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          {"orderable" : false},
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
      });
      $('#employee-table tbody').on( 'click', 'tr', function () {
    	  
    	  
    		  if ( $(this).hasClass('selected') ) {
                  $(this).removeClass('selected');
                  $boxes.each(function(){
         			 if($(this).is(":checked")){
         				 $(this).closest("tr").css("background-color", "#e7ffd6");
         			 }else{
         				 $(this).closest("tr").css("background-color", "#ffd6d6");
         			 }
         			
         		 	});
              }
              else {
              	employeetable.$('tr.selected').removeClass('selected');
                  $(this).addClass('selected');
                  $boxes.each(function(){
            			 if($(this).is(":checked")){
            				 $(this).closest("tr").css("background-color", "#e7ffd6");
            			 }else{
            				 $(this).closest("tr").css("background-color", "#ffd6d6");
            			 }
            			
            		 	});
                  if($(this).attr("role")){ 
                 	 
                   	
                      $(this).css("background-color", "#b3c9dd");
                      
                  	}
    	  	}
    		  
    		  
              
    		 
      } );
      
      $('#btnAddEmployee').click( function () {
    	  emptyDiv("#errorEmployeeAdd");
      } );
      
      $('#btnUpdateEmployee').click( function () {
    	emptyDiv("#errorEmployeeEdit");
        var employeeData = employeetable.row('.selected').data();
        if($('#employee-table tbody tr').hasClass("selected")){
	        	$("#usernameEmployeeEdit").val(employeeData[1]);
	        	$("#firstnameEmployeeEdit").val(employeeData[2]);
	            $("#middlenameEmployeeEdit").val(employeeData[3]);
	            $("#lastnameEmployeeEdit").val(employeeData[4]);
	            $("#positionEmployeeEdit").val(employeeData[5]);
	            if(employeeData[6] == "MALE")
	            	$("#maleEmployeeEdit").prop('checked', true);
	            else
	            	$("#femaleEmployeeEdit").prop("checked", true);
	            $("#ageEmployeeEdit").val(employeeData[7]);
	            $("#emailEmployeeEdit").val(employeeData[8]);
	            $("#countryEmployeeEdit").val(employeeData[9]).change();
	            $("#cityEmployeeEdit").val(employeeData[10]);
	            $("#addressEmployeeEdit").val(employeeData[11]);
	            $("#zipcodeEmployeeEdit").val(employeeData[12]).change();
	            $("#countryCodeEmployeeEdit").val(employeeData[13]);
	            $("#phonenumberEmployeeEdit").val(employeeData[14]);
	            $("#img-uploadEmployeeEdit").attr("src", $(employeeData[0]).attr("src"));
	        
        }else{
	    	  $("#img-uploadEmployeeEdit").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");

        	$("#formEmployeeEdit")[0].reset();

        }
      });

      //Filter EMPLOYEE
      $.fn.dataTable.ext.search.push(
              function( settings, data, dataIndex ) {
                  var min = parseInt( $('#minAgeEmployee').val(), 10 );
                  var max = parseInt( $('#maxAgeEmployee').val(), 10 );
                  var age = parseFloat( data[7] ) || 0; // use data for the age column

                  if ( ( isNaN( min ) && isNaN( max ) ) ||
                       ( isNaN( min ) && age <= max ) ||
                       ( min <= age   && isNaN( max ) ) ||
                       ( min <= age   && age <= max ) )
                  {
                      return true;
                  }
                  return false;
              }
          );
          
          $.fn.dataTable.ext.search.push(
        		  
        			  function( settings, data, dataIndex ) {
        		    	
        		    	if($('#filterEmployeeGender').val() != null){
    	                      var gender = $('#filterEmployeeGender').val().toUpperCase();
    	                      var genderColumn = data[6];
    	                      
    	                      if ( ( gender == genderColumn ) )
    	                      {
    	                          return true;
    	                      }else if(gender == "ALL"){
    	                    	  return true;
    	                      }
    	                      return false;
        			  	}
                      }
        	 
                  
              );
          
          $.fn.dataTable.ext.search.push(
        		  
    			  function( settings, data, dataIndex ) {
    		    	
    		    	if($('#countryEmployee').val() != null){
                          var country = $('#countryEmployee').val();
                          var countryColumn = data[9];
                          
                          if ( ( country == countryColumn ) )
                          {
                              return true;
                          }else if(country == "All"){
                        	  
                        	  return true;
                          }
                          return false;
    			  	}
                  }
    	   
          );
          
          $.fn.dataTable.ext.search.push(
        		  
    			  function( settings, data, dataIndex ) {
    		    	
    		    	if($('#filterEmployeeStatus').val() != null){
                          var status = $('#filterEmployeeStatus').val();
                          var statusRow = employeetable.row(dataIndex).node();
                          if(status == "All"){
                        	  return true;
                          }else if (String($(statusRow).find('input').prop('checked')) == status) { // active

                              return true;
                          }
                          
                          return false;
    			  	}
                  }
    	 
              
          );

          // Event listener to the two range filtering inputs to redraw on input
          $('#minAgeEmployee, #maxAgeEmployee').keyup( function() {
              employeetable.draw();
          } );
          
          $("#filterEmployeeGender").on("change", function(){
        	  employeetable.draw();
          });
          
          $("#countryEmployee").on("change", function(){
        	  employeetable.draw();
          });
          
          $("#filterEmployeeStatus").on("change", function(){
        	  employeetable.draw();
          });

     
      //Filter EMPLOYEE


      /*Country Edit Employee*/

      $('#countryEmployeeEdit').change(function () {

          var $cityTextBox = $('#cityEmployeeEdit');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });
      /*Country Edit Employee*/





      /*Country Add Employee*/

      $('#countryEmployeeAdd').change(function () {

          var $cityTextBox = $('#cityEmployeeAdd');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });


      /*Country Add Employee*/

      /*Profile Picture Add New Employee*/

      $('input[type=radio][name=genderEmployeeAdd]').change(function(){
        var gender = $('input[type=radio][name=genderEmployeeAdd]:checked').val();
        if(gender == "Male"){
          if($("#fileEmployeeAdd").get(0).files.length == 0)
            $("#img-uploadEmployeeAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
        }

        if(gender == "Female"){
          if($("#fileEmployeeAdd").get(0).files.length == 0)
            $("#img-uploadEmployeeAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-female.jpg");
        }
      });

      function filePreviewAdd(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-uploadEmployeeAdd").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
      }

      $("#fileEmployeeAdd").change(function () {
          filePreviewAdd(this);
      });


      /*Profile Picture Add New Employee*/

      /*Profile Picture Edit Employee*/

      function filePreviewEdit(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-uploadEmployeeEdit").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
      }

      $("#fileEmployeeEdit").change(function () {
          filePreviewEdit(this);
      });


      /*Profile Picture Edit Employee*/
      /*EMPLOYEE TABLE*/
      
      
      
      /*AJAX ADD NEW EMPLOYEE*/
      
      $("#formEmployeeAdd").submit(function(event){
    	  emptyDiv("#errorEmployeeAdd");
    	  
    	  event.preventDefault();
    	  
    	  ajaxEmployeeAdd();
    	  
    	  
      });
      
      function emptyDiv(divToEmpty){
    	  $(divToEmpty).empty();
      }
      
      
      
      function ajaxEmployeeAdd(){
    	  
    	  var formData = new FormData($("#formEmployeeAdd")[0]);
    	 
    	  $.ajax({
    		  type: "POST",
    	      enctype: 'multipart/form-data',
    	      url : "/FBExportSystem/admin/add-new-employee",
    	      processData: false,  // Important!
    	      contentType: false,
    	      cache: false,
              data : formData,
    	      success : function(result) {
    	    	  if(result == "Success"){
    	    		  $("#errorEmployeeAdd").append("<div class='alert alert-success' > * You've successfully registered! </div> ");
    	    		  
    	    		  $("#formEmployeeAdd")[0].reset();
        	    	  $("#img-uploadEmployeeAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
    	    		  
        	    	  location.reload();
    	    	  }else{
    	    		  var jsonData = JSON.parse(result);
        	    	  $.each(jsonData, function (index, value) {
        	    		  $("#errorEmployeeAdd").append("<div class='alert alert-danger'> *"+value+" </div>");
        	    		});
        	    	  
    	    	  }
              },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*AJAX ADD NEW EMPLOYEE*/
      
      /*Activate and Deactivate account*/
      function ajaxEnabledEmployee(username){
    	 
    	  $.ajax({
    		  type : "POST",
	  		  contentType : "application/json",
	  		  data : username,
	  		  dataType : 'text',
    	      url : "/FBExportSystem/admin/enabled-employee",
    	      success : function(result) {},
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*Activate and Deactivate account*/
      
      /*AJAX EDIT EMPLOYEE*/
      
      $("#formEmployeeEdit").submit(function(event){
    	  emptyDiv("#errorEmployeeEdit");
    	  
    	  event.preventDefault();
    	  
    	  ajaxEmployeeEdit();
    	  
    	  
      });
      
      function ajaxEmployeeEdit(){
    	  
    	  var formData = new FormData($("#formEmployeeEdit")[0]);
    	 
    	  $.ajax({
    		  type: "POST",
    	      enctype: 'multipart/form-data',
    	      url : "/FBExportSystem/admin/edit-employee",
    	      processData: false,  // Important!
    	      contentType: false,
    	      cache: false,
              data : formData,
    	      success : function(result) {
    	    	  if(result == "Success"){
    	    		  $("#errorEmployeeEdit").append("<div class='alert alert-success' > * You've successfully update employee's account! </div> ");
    	    		  
    	    		  $("#formEmployeeEdit")[0].reset();
        	    	  $("#img-uploadEmployeeEdit").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
    	    		  
        	    	  location.reload();
    	    	  }else{
    	    		  var jsonData = JSON.parse(result);
        	    	  $.each(jsonData, function (index, value) {
        	    		  $("#errorEmployeeEdit").append("<div class='alert alert-danger'> *"+value+" </div>");
        	    		});
        	    	  
    	    	  }
              },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      
      /*AJAX EDIT EMPLOYEE*/
      
      
      
      
      
      
      
      
      
      
      
      
      /*ADMIN TABLE*/
      var admintable = $('#admin-table').DataTable({
        "scrollX": true,
        "columns": [
          {"orderable" : false},
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          {"orderable" : false},
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
      });
      $('#admin-table tbody').on( 'click', 'tr', function () {
    	  
    	  
    		  if ( $(this).hasClass('selected') ) {
                  $(this).removeClass('selected');
                  $boxes.each(function(){
         			 if($(this).is(":checked")){
         				 $(this).closest("tr").css("background-color", "#e7ffd6");
         			 }else{
         				 $(this).closest("tr").css("background-color", "#ffd6d6");
         			 }
         			
         		 	});
              }
              else {
              	admintable.$('tr.selected').removeClass('selected');
                  $(this).addClass('selected');
                  $boxes.each(function(){
            			 if($(this).is(":checked")){
            				 $(this).closest("tr").css("background-color", "#e7ffd6");
            			 }else{
            				 $(this).closest("tr").css("background-color", "#ffd6d6");
            			 }
            			
            		 	});
                  if($(this).attr("role")){ 
                 	 
                   	
                      $(this).css("background-color", "#b3c9dd");
                      
                  	}
    	  	}
    		  
    		  
              
    		 
      } );
      
      $('#btnAddAdmin').click( function () {
    	  emptyDiv("#errorAdminAdd");
      } );
      
      $('#btnUpdateAdmin').click( function () {
    	emptyDiv("#errorAdminEdit");
        var adminData = admintable.row('.selected').data();
        if($('#admin-table tbody tr').hasClass("selected")){
	        	$("#usernameAdminEdit").val(adminData[1]);
	        	$("#firstnameAdminEdit").val(adminData[2]);
	            $("#middlenameAdminEdit").val(adminData[3]);
	            $("#lastnameAdminEdit").val(adminData[4]);
	            $("#positionAdminEdit").val(adminData[5]);
	            if(adminData[6] == "MALE")
	            	$("#maleAdminEdit").prop('checked', true);
	            else
	            	$("#femaleAdminEdit").prop("checked", true);
	            $("#ageAdminEdit").val(adminData[7]);
	            $("#emailAdminEdit").val(adminData[8]);
	            $("#countryAdminEdit").val(adminData[9]).change();
	            $("#cityAdminEdit").val(adminData[10]);
	            $("#addressAdminEdit").val(adminData[11]);
	            $("#zipcodeAdminEdit").val(adminData[12]).change();
	            $("#countryCodeAdminEdit").val(adminData[13]);
	            $("#phonenumberAdminEdit").val(adminData[14]);
	            $("#img-uploadAdminEdit").attr("src", $(adminData[0]).attr("src"));
	        
        }else{
	    	  $("#img-uploadAdminEdit").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");

        	$("#formAdminEdit")[0].reset();

        }
      });

      //Filter Admin
      $.fn.dataTable.ext.search.push(
              function( settings, data, dataIndex ) {
                  var min = parseInt( $('#minAgeAdmin').val(), 10 );
                  var max = parseInt( $('#maxAgeAdmin').val(), 10 );
                  var age = parseFloat( data[7] ) || 0; // use data for the age column

                  if ( ( isNaN( min ) && isNaN( max ) ) ||
                       ( isNaN( min ) && age <= max ) ||
                       ( min <= age   && isNaN( max ) ) ||
                       ( min <= age   && age <= max ) )
                  {
                      return true;
                  }
                  return false;
              }
          );
          
          $.fn.dataTable.ext.search.push(
        		  
        			  function( settings, data, dataIndex ) {
        		    	
        		    	if($('#filterAdminGender').val() != null){
    	                      var gender = $('#filterAdminGender').val().toUpperCase();
    	                      var genderColumn = data[6];
    	                      
    	                      if ( ( gender == genderColumn ) )
    	                      {
    	                          return true;
    	                      }else if(gender == "ALL"){
    	                    	  return true;
    	                      }
    	                      return false;
        			  	}
                      }
        	 
                  
              );
          
          $.fn.dataTable.ext.search.push(
        		  
    			  function( settings, data, dataIndex ) {
    		    	
    		    	if($('#countryAdmin').val() != null){
                          var country = $('#countryAdmin').val();
                          var countryColumn = data[9];
                          
                          if ( ( country == countryColumn ) )
                          {
                              return true;
                          }else if(country == "All"){
                        	  
                        	  return true;
                          }
                          return false;
    			  	}
                  }
    	   
          );
          
          $.fn.dataTable.ext.search.push(
        		  
    			  function( settings, data, dataIndex ) {
    		    	
    		    	if($('#filterAdminStatus').val() != null){
                          var status = $('#filterAdminStatus').val();
                          var statusRow = admintable.row(dataIndex).node();
                          if(status == "All"){
                        	  return true;
                          }else if (String($(statusRow).find('input').prop('checked')) == status) { // active

                              return true;
                          }
                          
                          return false;
    			  	}
                  }
    	 
              
          );

          // Event listener to the two range filtering inputs to redraw on input
          $('#minAgeAdmin, #maxAgeAdmin').keyup( function() {
              admintable.draw();
          } );
          
          $("#filterAdminGender").on("change", function(){
        	  admintable.draw();
          });
          
          $("#countryAdmin").on("change", function(){
        	  admintable.draw();
          });
          
          $("#filterAdminStatus").on("change", function(){
        	  admintable.draw();
          });
          
      //Filter ADMIN


      /*Country Edit Admin*/

      $('#countryAdminEdit').change(function () {

          var $cityTextBox = $('#cityAdminEdit');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });
      /*Country Edit Admin*/





      /*Country Add Admin*/

      $('#countryAdminAdd').change(function () {

          var $cityTextBox = $('#cityAdminAdd');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });


      /*Country Add Admin*/

      /*Profile Picture Add New Admin*/

      $('input[type=radio][name=genderAdminAdd]').change(function(){
        var gender = $('input[type=radio][name=genderAdminAdd]:checked').val();
        if(gender == "Male"){
          if($("#fileAdminAdd").get(0).files.length == 0)
            $("#img-uploadAdminAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
        }

        if(gender == "Female"){
          if($("#fileAdminAdd").get(0).files.length == 0)
            $("#img-uploadAdminAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-female.jpg");
        }
      });

      function filePreviewAdminAdd(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-uploadAdminAdd").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
      }

      $("#fileAdminAdd").change(function () {
          filePreviewAdminAdd(this);
      });


      /*Profile Picture Add New Admin*/

      /*Profile Picture Edit Admin*/

      function filePreviewAdminEdit(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img-uploadAdminEdit").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
      }

      $("#fileAdminEdit").change(function () {
          filePreviewAdminEdit(this);
      });


      /*Profile Picture Edit Admin*/
      /*ADMIN TABLE*/
      
      
      
      /*AJAX ADD NEW ADMIN*/
      
      $("#formAdminAdd").submit(function(event){
    	  emptyDiv("#errorAdminAdd");
    	  
    	  event.preventDefault();
    	  
    	  ajaxAdminAdd();
    	  
    	  
      });
      
      
      
      
      function ajaxAdminAdd(){
    	  
    	  var formData = new FormData($("#formAdminAdd")[0]);
    	 
    	  $.ajax({
    		  type: "POST",
    	      enctype: 'multipart/form-data',
    	      url : "/FBExportSystem/admin/add-new-admin",
    	      processData: false,  // Important!
    	      contentType: false,
    	      cache: false,
              data : formData,
    	      success : function(result) {
    	    	  if(result == "Success"){
    	    		  $("#errorAdminAdd").append("<div class='alert alert-success' > * You've successfully registered! </div> ");
    	    		  
    	    		  $("#formAdminAdd")[0].reset();
        	    	  $("#img-uploadAdminAdd").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
    	    		  
        	    	  location.reload();
    	    	  }else{
    	    		  var jsonData = JSON.parse(result);
        	    	  $.each(jsonData, function (index, value) {
        	    		  $("#errorAdminAdd").append("<div class='alert alert-danger'> *"+value+" </div>");
        	    		});
        	    	  
    	    	  }
              },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*AJAX ADD NEW ADMIN*/
      
      /*Activate and Deactivate account*/
      function ajaxEnabledAdmin(username){
    	 
    	  $.ajax({
    		  type : "POST",
	  		  contentType : "application/json",
	  		  data : username,
	  		  dataType : 'text',
    	      url : "/FBExportSystem/admin/enabled-admin",
    	      success : function(result) {},
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      /*Activate and Deactivate account*/
      
      /*AJAX EDIT EMPLOYEE*/
      
      $("#formAdminEdit").submit(function(event){
    	  emptyDiv("#errorAdminEdit");
    	  
    	  event.preventDefault();
    	  
    	  ajaxAdminEdit();
    	  
    	  
      });
      
      function ajaxAdminEdit(){
    	  
    	  var formData = new FormData($("#formAdminEdit")[0]);
    	 
    	  $.ajax({
    		  type: "POST",
    	      enctype: 'multipart/form-data',
    	      url : "/FBExportSystem/admin/edit-admin",
    	      processData: false,  // Important!
    	      contentType: false,
    	      cache: false,
              data : formData,
    	      success : function(result) {
    	    	  if(result == "Success"){
    	    		  $("#errorAdminEdit").append("<div class='alert alert-success' > * You've successfully update admin's account! </div> ");
    	    		  
    	    		  $("#formAdminEdit")[0].reset();
        	    	  $("#img-uploadAdminEdit").attr("src", "/../FBExportSystem/resources/admin/img/profile-male.jpg");
        	    	  
        	    	  location.reload();
    	    	  }else{
    	    		  var jsonData = JSON.parse(result);
        	    	  $.each(jsonData, function (index, value) {
        	    		  $("#errorAdminEdit").append("<div class='alert alert-danger'> *"+value+" </div>");
        	    		});
        	    	  
    	    	  }
              },
              error : function(e){
                  console.log("ERROR: ", e);
              }
          });
    	  
      }
      
      /*AJAX EDIT ADMIN*/
});