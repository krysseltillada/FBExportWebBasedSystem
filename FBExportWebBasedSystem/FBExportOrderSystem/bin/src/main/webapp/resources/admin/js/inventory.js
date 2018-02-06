$(document).ready(function (){
			 
	$( "#minDatePicker" ).flatpickr({
		minDate : "today",
		onChange : function (selectedDates, date) {
			
			$("#maxDatePicker").flatpickr({
				defaultDate : date,
				minDate : date
			})
		}
	});

	$( "#maxDatePicker" ).flatpickr({
		minDate : "today"
	});
	
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
	
	

});