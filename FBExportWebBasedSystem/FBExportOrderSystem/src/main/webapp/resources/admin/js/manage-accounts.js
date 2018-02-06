$(document).ready(function () {
    /*CLIENT TABLE*/

      /*User Activity*/

      /*User Activity*/

      var clienttable = $('#client-table').DataTable({
        "scrollX": true,
        "columns": [
          {
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta){
                    return '<input id="checkboxCustom1" name="checkboxClient[]" type="checkbox" value="" class="checkbox-template checkbox-delete">';
                }
          },
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
          null,
          {"orderable" : false},
        ],
        "order" : []
      });



      $('#client-table tbody').on( 'click', 'tr', function () {
    	  
    	 if($(this).attr("role")){
    		 if ( $(this).hasClass('selected') ) {
    	            $(this).removeClass('selected');
    	            $(this).css("background-color", "#e7ffd6");
    	        }
    	        else {
    	            clienttable.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	            
    	            $(this).css("background-color", "#81ecec");
    	          }
    	 }

        
      } );

      $('#btnDeleteClient').click( function () {
          clienttable.row('.selected').remove().draw( false );
      } );

      $('#btnUpdateClient').click( function () {
        var employeeData = clienttable.row('.selected').data();
        $("#usernameClientEdit").val(employeeData[3]);
        $("#firstnameClientEdit").val(employeeData[5]);
        $("#middlenameClientEdit").val(employeeData[6]);
        $("#lastnameClientEdit").val(employeeData[7]);
        $("input[name='genderClientEdit'][value='"+employeeData[8]+"']").prop('checked', true);
        $("#ageClientEdit").val(employeeData[9]);
        $("#emailClientEdit").val(employeeData[10]);
        $("#countryClientEdit").val(employeeData[11]).change();
        $("#cityClientEdit").val(employeeData[12]);
        $("#addressClientEdit").val(employeeData[13]);
        $("#zipcodeClientEdit").val(employeeData[14]).change();
        $("#countryCodeClientEdit").val(employeeData[15]);
        $("#phonenumberClientEdit").val(employeeData[16]);
      });

      /*IS ACTIVE TOGGLE*/
      var $boxes = $('input[name=isActive]');
      $boxes.each(function(){
        toggleIsActive(this);
      });

      $boxes.on('change', function(){
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

      });

      $("#checkbox-all-client").click(function () {
          $("#client-table").find("tr:not(:first) input.checkbox-template")
                              .prop("checked", $(this).prop("checked"));
      });

      /*Country Edit Client*/
      $("#countryCodeClientEdit").ready(function () {
          $.ajax({
              url : "https://restcountries.eu/rest/v2/all",
              dataType : "json",
              success : function (restCountriesData) {


                  for (var i = 0; i != restCountriesData.length; ++i) {
                      var countryLetterCode = restCountriesData[i].alpha2Code;
                      var countryCode = restCountriesData[i].callingCodes[0];

                      if (countryCode.length > 0)
                          $("#countryCodeClientEdit").append('<option value = "' + countryCode + '">+' + countryCode + ' (' + countryLetterCode + ') </option');

                  }


              }
          });
      });

      $('#countryClientEdit').ready(function () {

         $.ajax(
             {
                 url : "https://restcountries.eu/rest/v2/all",
                 dataType : "json",
                 success : function (responseData) {

                     for (var i = 0; i != responseData.length; ++i) {

                          if (responseData[i].alpha2Code.length > 0) {
                              var country = responseData[i].name;
                              var countryCode = responseData[i].alpha2Code;
                              $('#countryClientEdit').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                          }

                     }



                 }
             }
         );
      });

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
              var age = parseFloat( data[9] ) || 0; // use data for the age column

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

      // Event listener to the two range filtering inputs to redraw on input
      $('#minAgeClient, #maxAgeClient').keyup( function() {
          clienttable.draw();
      } );

      $('#countryClient').ready(function () {

         $.ajax(
             {
                 url : "https://restcountries.eu/rest/v2/all",
                 dataType : "json",
                 success : function (responseData) {

                     for (var i = 0; i != responseData.length; ++i) {

                          if (responseData[i].alpha2Code.length > 0) {
                              var country = responseData[i].name;
                              var countryCode = responseData[i].alpha2Code;
                              $('#countryClient').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                          }

                     }

                 }
             }
         );
      });

      /*CLIENT FILTER*/

      /*CLIENT TABLE*/

















      /*EMPLOYEE TABLE*/
      var employeetable = $('#employee-table').DataTable({
        "scrollX": true,
        "columns": [
          {
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta){
                    return '<input id="checkboxCustom2" type="checkbox" value="" class="checkbox-template checkbox-delete">';
                }
          },
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
          null,
          null,
          null,
          {"orderable" : false},
        ],
        "order" : []
      });

      $('#employee-table tbody').on( 'click', 'tr', function () {
    	if($(this).attr("role")){
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
                $(this).css("background-color", "#e7ffd6");
            }
            else {
                employeetable.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');

                $(this).css("background-color", "#81ecec");
              }

    	}

      } );

      $('#btnDeleteEmployee').click( function () {
          employeetable.row('.selected').remove().draw( false );
      } );

      $('#btnUpdateEmployee').click( function () {
        var employeeData = employeetable.row('.selected').data();
        $("#usernameEmployeeEdit").val(employeeData[3]);
        $("#firstnameEmployeeEdit").val(employeeData[5]);
        $("#middlenameEmployeeEdit").val(employeeData[6]);
        $("#lastnameEmployeeEdit").val(employeeData[7]);
        $("#positionEmployeeEdit").val(employeeData[8]);
        $("#roleEmployeeEdit").val(employeeData[9]);
        $("input[name='genderEmployeeEdit'][value='"+employeeData[10]+"']").prop('checked', true);
        $("#ageEmployeeEdit").val(employeeData[11]);
        $("#emailEmployeeEdit").val(employeeData[12]);
        $("#countryEmployeeEdit").val(employeeData[13]).change();
        $("#cityEmployeeEdit").val(employeeData[14]);
        $("#addressEmployeeEdit").val(employeeData[15]);
        $("#zipcodeEmployeeEdit").val(employeeData[16]).change();
        $("#countryCodeEmployeeEdit").val(employeeData[17]);
        $("#phonenumberEmployeeEdit").val(employeeData[18]);
        $("#img-uploadEmployeeEdit").attr("src", $(employeeData[2]).attr("src"));

      });

      /*IS ACTIVE TOGGLE*/
      var $boxes = $('input[name=isActive]');
      $boxes.each(function(){
        toggleIsActive(this);
      });

      $boxes.on('change', function(){
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
        var parentRowEmployee = $(this).closest('tr');


        var rowEmployee = employeetable.row(parentRowEmployee);

        if (rowEmployee.child.isShown()) {
            $(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
            $('div.showMoreInfoSlider', rowEmployee.child()).slideUp(function () {
              rowEmployee.child.hide();
            });
        } else {
            var rowMoreInformationCollapse = $("#collapsingEmployeeTableMoreInformation").html();
            rowEmployee.child(rowMoreInformationCollapse, 'no-padding').show();
            $(this).removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up");
            $('div.showMoreInfoSlider', rowEmployee.child()).slideDown(function () {

              $(this).parent().removeAttr('class').parent().removeAttr('class');
            });
            $('div.showMoreInfoSlider').css("display", "flex");
        }

      });

      $("#checkbox-all-employee").click(function () {
          $("#employee-table").find("tr:not(:first) input.checkbox-template")
                              .prop("checked", $(this).prop("checked"));
      });



      //Filter EMPLOYEE
      $.fn.dataTable.ext.search.push(
          function( settings, data, dataIndex ) {
              var min = parseInt( $('#minAgeEmployee').val(), 10 );
              var max = parseInt( $('#maxAgeEmployee').val(), 10 );
              var age = parseFloat( data[11] ) || 0; // use data for the age column

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

      $('#minAgeEmployee, #maxAgeEmployee').keyup( function() {
          employeetable.draw();
      } );

      $('#countryEmployee').ready(function () {

         $.ajax(
             {
                 url : "https://restcountries.eu/rest/v2/all",
                 dataType : "json",
                 success : function (responseData) {

                     for (var i = 0; i != responseData.length; ++i) {

                          if (responseData[i].alpha2Code.length > 0) {
                              var country = responseData[i].name;
                              var countryCode = responseData[i].alpha2Code;
                              $('#countryEmployee').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                          }

                     }

                 }
             }
         );
      });
      //Filter EMPLOYEE


      /*Country Edit Employee*/
      $("#countryCodeEmployeeEdit").ready(function () {
          $.ajax({
              url : "https://restcountries.eu/rest/v2/all",
              dataType : "json",
              success : function (restCountriesData) {


                  for (var i = 0; i != restCountriesData.length; ++i) {
                      var countryLetterCode = restCountriesData[i].alpha2Code;
                      var countryCode = restCountriesData[i].callingCodes[0];

                      if (countryCode.length > 0)
                          $("#countryCodeEmployeeEdit").append('<option value = "' + countryCode + '">+' + countryCode + ' (' + countryLetterCode + ') </option');

                  }


              }
          });
      });

      $('#countryEmployeeEdit').ready(function () {

         $.ajax(
             {
                 url : "https://restcountries.eu/rest/v2/all",
                 dataType : "json",
                 success : function (responseData) {

                     for (var i = 0; i != responseData.length; ++i) {

                          if (responseData[i].alpha2Code.length > 0) {
                              var country = responseData[i].name;
                              var countryCode = responseData[i].alpha2Code;
                              $('#countryEmployeeEdit').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                          }

                     }



                 }
             }
         );
      });

      $('#countryEmployeeEdit').change(function () {

          var $cityTextBox = $('#cityEmployeeEdit');

          var country = $(this).val();


          if ($cityTextBox.is(":disabled"))
              $cityTextBox.removeAttr("disabled");

      });
      /*Country Edit Employee*/





      /*Country Add Employee*/
      $("#countryCodeEmployeeAdd").ready(function () {
          $.ajax({
              url : "https://restcountries.eu/rest/v2/all",
              dataType : "json",
              success : function (restCountriesData) {


                  for (var i = 0; i != restCountriesData.length; ++i) {
                      var countryLetterCode = restCountriesData[i].alpha2Code;
                      var countryCode = restCountriesData[i].callingCodes[0];

                      if (countryCode.length > 0)
                          $("#countryCodeEmployeeAdd").append('<option value = "' + countryCode + '">+' + countryCode + ' (' + countryLetterCode + ') </option');

                  }


              }
          });
      });

      $('#countryEmployeeAdd').ready(function () {

         $.ajax(
             {
                 url : "https://restcountries.eu/rest/v2/all",
                 dataType : "json",
                 success : function (responseData) {

                     for (var i = 0; i != responseData.length; ++i) {

                          if (responseData[i].alpha2Code.length > 0) {
                              var country = responseData[i].name;
                              var countryCode = responseData[i].alpha2Code;
                              $('#countryEmployeeAdd').append('<option value = "'+ country + '">' + country + ' (' + countryCode + ')</option>');
                          }

                     }



                 }
             }
         );
      });

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
            $("#img-uploadEmployeeAdd").attr("src", "resources/admin/img/profile-male.jpg");
        }

        if(gender == "Female"){
          if($("#fileEmployeeAdd").get(0).files.length == 0)
            $("#img-uploadEmployeeAdd").attr("src", "resources/admin/img/profile-female.jpg");
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
});