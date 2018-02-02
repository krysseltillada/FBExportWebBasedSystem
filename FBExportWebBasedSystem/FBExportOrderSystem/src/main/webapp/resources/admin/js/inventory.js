$(window).ready(function (){
			 
	$( "#minDatePicker" ).flatpickr();
	$( "#maxDatePicker" ).flatpickr();
	
	var table = $('#inventoryTable').DataTable( { 
		"columns": [
		{
				'searchable': false,
				'orderable': false,
				'className': 'dt-body-center',
				'render': function (data, type, full, meta){
					return '<input id="checkboxCustom1" type="checkbox" value="" class="checkbox-template checkbox-delete">';
				}
		},
		{"orderable" : false},
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null
		],
		"order" : []
	}
	);

	$('.fa-chevron-circle-down').click(function () { 
		var parentRow = $(this).closest('tr');


		var row = table.row(parentRow);

		if (row.child.isShown()) {
			$(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
			$('div.slider', row.child()).slideUp(function () {
			row.child.hide();
			});
		} else {
			var rowProductRowCollapse = $("#collapsingInventoryProductTemplateUnposted").html();
			row.child(rowProductRowCollapse, 'no-padding').show();
			$(this).removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up");
			$('div.slider', row.child()).slideDown(function () {

			$(this).parent().removeAttr('class').parent().removeAttr('class');
			});
			$('div.slider').css("display", "flex");
		}

	});

	$("#checkbox-all").click(function () { 

		$("#inventoryTable").find("tr:not(:first) input.checkbox-template")
							.prop("checked", $(this).prop("checked"));


	});

	$(".checkbox-delete").change(function () { 

	if ($("#inventoryTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

		$("a#deleteProduct").removeClass("text-muted").addClass("text-red").css("cursor", "pointer");
	} else {

		$("a#deleteProduct").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed");
	}
	});
	
	// product add and edit code

	var allowedImageTypes = [
		'image/jpeg',
		'image/png'
	];

	$(document).on('change', '.btn-file :file', function() {
			var input = $(this),
				label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
				
			input.trigger('fileselect', [label]);
	});

	$('.btn-file :file').on('fileselect', function(event, label) {
		
		var input = $(this).parents('.input-group').find(':text'),
			log = label;
					
		if( input.length && allowedImageTypes.includes(event.target.files[0].type)) {
			input.val(log);
		} else {
			if( log ) {
				alert("invalid image type");
				input.val("");
			}
		}

	});

	function readURL(input) {

		if (input.files && input.files[0] && allowedImageTypes.includes(input.files[0].type)) {
			var reader = new FileReader();
			
			reader.onload = function (e) {  
				$('#img-upload').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		} else {
			$("#img-upload").attr('src', "upload-product-img.png");
		}
	}

	$("#imgInp").change(function(){
		readURL(this);
	}); 

});