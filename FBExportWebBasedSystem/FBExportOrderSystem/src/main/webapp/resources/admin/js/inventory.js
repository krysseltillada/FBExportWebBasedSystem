$(document).ready(function (){

	var checkAllowDelete = function () {

		

		if ($("#inventoryTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

			$("a#delete-selected-product").removeClass("text-muted").addClass("text-red").css("cursor", "pointer")
																						.css("pointer-events", "auto");
		} else {

			$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																						.css("pointer-events", "none");
		}
	};

	var getMoreProductDetails = function () { 
		var parentRow = $(this).closest('tr');

		var row = table.row(parentRow);

		if (row.child.isShown()) {
			$(this).removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down");
			$('div.slider', row.child()).slideUp(function () {
			row.child.hide();
			});
		} else {
			var rowProductRowCollapseRawTemplate = $("#collapsingInventoryProductTemplate").html();
			
			$.post("/FBExportSystem/admin/inventory/get-product-details", {
				id : row.data()[2]
			}, function (response) {

				var rowProductRowCollapseTemplate  = _.template(rowProductRowCollapseRawTemplate);

				var productImageLink = response.productImageLink;
				var previewImageLinks = response.previewImageLinks;

				var productImageIds = [
					productImageLink.substring(productImageLink.lastIndexOf("/") + 1, productImageLink.lastIndexOf(".")),
					previewImageLinks[0].substring(previewImageLinks[0].lastIndexOf("/") + 1, previewImageLinks[0].lastIndexOf(".")),
					previewImageLinks[1].substring(previewImageLinks[1].lastIndexOf("/") + 1, previewImageLinks[1].lastIndexOf(".")),
					previewImageLinks[2].substring(previewImageLinks[2].lastIndexOf("/") + 1, previewImageLinks[2].lastIndexOf("."))
				];

				console.log(productImageIds);

				var rowProductRowCollapse = rowProductRowCollapseTemplate({
					productImageId1 : productImageIds[0],
					productImageId2 : productImageIds[1],
					productImageId3 : productImageIds[2],
					productImageId4 : productImageIds[3],

					productImageLink1 : productImageLink,
					productImageLink2 : previewImageLinks[0],
					productImageLink3 : previewImageLinks[1],
					productImageLink4 : previewImageLinks[2],

					name : response.name,
					origin : response.origin,
					productDescription : response.description,
					supplier : response.supplier,
					supplierContactNumber  : response.supplierContactNumber,
					supplierAddress : response.supplierAddress,
					dateOfDelivery : moment(response.dateOfDelivery).format("MMMM D, YYYY"),
					status : response.status,
					editAddressLink : "http://localhost:" + location.port + "/FBExportSystem/admin/inventory/edit-product/" + response.productId
				});

				row.child(rowProductRowCollapse, 'no-padding').show();

				$(row.child()).find(".btn-delete").click(function () {
					 
					var $deleteButton = $(this);
					var $deletedProductChildRow = $(this).closest("tr");
					var $deletedProductRow = $deletedProductChildRow.prev();
					var deletedProductId = $deletedProductRow.find("td:eq(2)").html();

					alertify.okBtn("Delete")
							.cancelBtn("Cancel")
							.confirm("Delete this product?", function () {
								
								$deleteButton.attr("disabled", "");
								$deleteButton.css("cursor", "not-allowed");

								iziToast.error({
									icon : "",
									message : "deleting product..",
									timeout : false,
									close : false,
									onOpening : function (instance, toast) {

										$.post("/FBExportSystem/admin/inventory/delete-product", {
											id : deletedProductId
										}, function () {

											console.log("delete");
											

											$deletedProductChildRow.fadeOut("slow");



											$deletedProductRow.fadeOut("slow", function () {
												console.log($deletedProductChildRow.html());
												console.log($deletedProductRow.html());
												table.row($deletedProductRow).remove().draw();
											});

											$(toast).fadeOut("slow", function () {
												$(this).remove();
											});

											
										});

									}
								});

							});


					$(".alertify").css("z-index", "10");


				});



				$(row.child()).find(".btn-post-unpost").click(function () {
					// window.alert("delete ?" + $(this).closest("tr").prev().find("td:eq(2)").html());
					 //class="btn bg-dark text-white float-right mr-1"
					var $buttonPost = $(this);
					var $postProductChildRow = $(this).closest("tr");
					var $postProductRow = $postProductChildRow.prev();

					var productId = $postProductRow.find("td:eq(2)").html();

					if ($buttonPost.hasClass("bg-green")) {
						
						alertify.okBtn("Post")
								.cancelBtn("Cancel")
								.confirm("Post this product?", function () {

									$buttonPost.attr("disabled", "");
									$buttonPost.css("cursor", "not-allowed");

									iziToast.show({
										message: 'posting product...',
										icon : "",
										timeout : false,
										close : false,
										onOpening : function (instance, toast) {

											setTimeout(function () {
												$.post("/FBExportSystem/admin/inventory/post-product", {
													id : productId
												}, function () {

													$buttonPost.removeAttr("class");
													$buttonPost.html("");
													$buttonPost.append("Unpost <i class='fa fa-clipboard ml-1' aria-hidden='true'></i>");
													$buttonPost.addClass("btn bg-dark text-white float-right mr-1");

													$postProductRow.find("td:eq(10)").html("Posted");

													iziToast.success({
														timeout : 2000,
														progressBar : false,
														message : "Product posted"
													});

													$buttonPost.removeAttr("disabled");
													$buttonPost.css("cursor", "pointer");

													$(toast).fadeOut("slow", function () {
														$(this).remove();
													});

													table.rows().invalidate();

												});

											}, 1000);

										}
									});
								
								});

					} else if ($buttonPost.hasClass("bg-dark")) {

						alertify.okBtn("Unpost")
								.cancelBtn("Cancel")
								.confirm("Unpost this product?", function () {

									$buttonPost.attr("disabled", "");
									$buttonPost.css("cursor", "not-allowed");

									iziToast.show({
										message: 'unposting product...',
										icon : "",
										timeout : false,
										close : false,
										onOpening : function (instance, toast) {

											setTimeout(function () {

												$.post("/FBExportSystem/admin/inventory/unpost-product", {
													id : productId
												}, function () {

													$buttonPost.removeAttr("class");
													$buttonPost.html("");
													$buttonPost.append("Post <i class='fa fa-clipboard ml-1' aria-hidden='true'></i>");
													$buttonPost.addClass("btn bg-green float-right mr-1");

													$postProductRow.find("td:eq(10)").html("Unposted");

													iziToast.success({
														timeout : 2000,
														progressBar : false,
														message : "Product unposted"
													});

													$buttonPost.removeAttr("disabled");
													$buttonPost.css("cursor", "pointer");

													$(toast).fadeOut("slow", function () {
														$(this).remove();
													});

													table.rows().invalidate();

												});	

											}, 1000);

										}
									});

								});

					}

					 $(".alertify").css("z-index", "10");

					 

				});
				
				$(this).removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up");
					$('div.slider', row.child()).slideDown(function () {
					$(this).parent().removeAttr('class').parent().removeAttr('class');
				});
				
				$('div.slider').css("display", "flex");		
			}, "json");

		
		}

	};



	var maxDatePicker = flatpickr("#maxDatePicker", {
		minDate : "today",
		dateFormat : "F j, Y",
		onChange : function (selectedDates, date) {
			var minTempDate = $("#minDatePicker").val();
			minDatePicker.config.maxDate = date;
			$("#minDatePicker").val(minTempDate);
		},
		onReady : function () {
			$("#maxDatePicker").val(flatpickr.formatDate(new Date(), "F j, Y"));
		}
	});
	
	var minDatePicker = flatpickr("#minDatePicker", {
		dateFormat : "F j, Y",	
		onChange : function (selectedDates, date) {
			var maxTempDate = $("#maxDatePicker").val();
			maxDatePicker.config.minDate = date;
			$("#maxDatePicker").val(maxTempDate);
		},
		onReady : function () {
			$("#minDatePicker").val(flatpickr.formatDate(new Date(), "F j, Y"));
		}
	});

	$("#minPrice").keypress(function (event) {
		var keyCode = event.keyCode;

        if ( keyCode < 48 || keyCode > 57 )
            return false;
	});

	$("#maxPrice").keypress(function (event) {
		var keyCode = event.keyCode;

        if ( keyCode < 48 || keyCode > 57 )
            return false;
	});

	$("#minWeight").keypress(function (event) {
		var keyCode = event.keyCode;

		if ( keyCode < 48 || keyCode > 57 )
			return false;
	});

	$("#maxWeight").keypress(function (event) {
		var keyCode = event.keyCode;

        if ( keyCode < 48 || keyCode > 57 )
            return false;
	});

	$.post("/FBExportSystem/admin/inventory/get-product-details", {
		id : "1"
	}, function (response) {
		console.log(response);
	}, "json");
	
	var table = $('#inventoryTable').DataTable( { 
		"language" : {
        "emptyTable" : "No products found",
        "zeroRecords" : "No products found"
        },
		"processing" : true,
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
		"order" : [],
		"lengthMenu" : [5, 10, 25],
		"fnDrawCallback" : function (oSettings) {
				checkAllowDelete();
				console.log("tae");
			}
		}
	);

	$(".btn-clear").click(function () {

		maxDatePicker = flatpickr("#maxDatePicker", {
			dateFormat : "F j, Y",
			minDate : "today",
			onChange : function (selectedDates, date) {
				var minTempDate = $("#minDatePicker").val();
				minDatePicker.config.maxDate = date;
				$("#minDatePicker").val(minTempDate);
			},
			onReady : function () {
				$("#maxDatePicker").val(flatpickr.formatDate(new Date(), "F j, Y"));
			}
		});


		minDatePicker = flatpickr("#minDatePicker", {
			dateFormat : "F j, Y",
			onChange : function (selectedDates, date) {
				var maxTempDate = $("#maxDatePicker").val();
				maxDatePicker.config.minDate = date;
				$("#maxDatePicker").val(maxTempDate);
			},
			onReady : function () {
				$("#minDatePicker").val(flatpickr.formatDate(new Date(), "F j, Y"));
			}
		});

		$("#dateFilterType").val("DateRegistered");

		$("input[name=status]:checked").closest("label").removeClass("active");

		$("input[name=status]:eq(3)").prop("checked", true);
		$("input[name=status]:eq(3)").closest("label").addClass("active");
		
		$("#minPrice").val("");
		$("#maxPrice").val("");
		$("#minWeight").val("");
		$("#maxWeight").val("");

	});

	$(".btn-filter").click(function () {
		console.log("filter");

		var productStatus = $("input[name='status']:checked").val() != undefined ? $("input[name='status']:checked").val() : "";  

		var filter = {
			minDate : convertFlatpickrDateToSystemDate($("#minDatePicker").val()),
			maxDate : convertFlatpickrDateToSystemDate($("#maxDatePicker").val()),
			dateFilterType : $("#dateFilterType").val(),
			status : productStatus,
			minPrice : $("#minPrice").val(),
			maxPrice : $("#maxPrice").val(),
			minWeight : $("#minWeight").val(),
			maxWeight : $("#maxWeight").val()
		};

		var filterLoaderTemplate = $("#filterLoaderTemplate").html();

		table.clear().draw();

		$("#inventoryTable tbody").html(filterLoaderTemplate);

		$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																					 .css("pointer-events", "none");

		$("#checkbox-all").prop("checked", false);

		setTimeout(function () {

			console.log(filter);

			$.get("/FBExportSystem/admin/inventory/filter-products", {
				filterData : JSON.stringify(filter) 
			}, function (response) {

				var rowProductRawTemplate = $("#rowProductTemplate").html();
				var $inventoryTableBody = $("#inventoryTable tbody");
				console.log(response);

				$(".filter-loader").remove();

				for (var i = 0; i != response.length; ++i) {
					
					var product = response[i];

					table.row.add( [
						'<td></td>',
						'<td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>',
						product.productId,
						product.name,
						product.origin,
						product.supplier,
						product.price,
						product.weight,
						moment(product.dateRegistered).format("MMMM D, YYYY"),
						moment(product.dateOfDelivery).format("MMMM D, YYYY"),
						(product.status == "POSTED") ? "Posted" : (product.status == "UNPOSTED") ? "Unposted" : "Expired" 
					] );

					$inventoryTableBody.find(".fa-chevron-circle-down").click(getMoreProductDetails);

					$inventoryTableBody.find("tr:last td:eq(0)>input[type='checkbox']").click(function () {
						if ($("#inventoryTable").find("tr:not(:first) input.checkbox-template:checked").length > 0) {

							$("a#delete-selected-product").removeClass("text-muted").addClass("text-red").css("cursor", "pointer")
																										.css("pointer-events", "auto");
						} else {

							$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																										.css("pointer-events", "none");
						}
					});

				}

				table.rows().invalidate().draw();


			}, "json");

		}, 1000);


	});


	$('#inventoryTable').on("click", ".fa-chevron-circle-down", getMoreProductDetails);

	$("#checkbox-all").click(function () { 

		$("#inventoryTable").find("tr:not(:first) input.checkbox-template")
							.prop("checked", $(this).prop("checked"));



		checkAllowDelete();

	});

	$("#inventoryTable").on("change", ".checkbox-delete:not(#checkbox-all)", function () { 

		if ($("#checkbox-all").is(":checked")) 
            $("#checkbox-all").prop("checked", false);

		checkAllowDelete();
	});

	$("#delete-selected-product").click(function () {

		var $inventoryTable = $("#inventoryTable");
		var ifEmpty = $inventoryTable.find("tbody tr:eq(0)> td").hasClass("dataTables_empty");

		console.log(ifEmpty);

		alertify.okBtn("Delete")
				.cancelBtn("Cancel")
				.confirm("Delete all selected product?", function () {

					if (!ifEmpty) {

						iziToast.show({
										message: 'deleting selected product...',
										icon : "",
										timeout : false,
										close : false,
										onOpening : function (instance, toast) {

										
											var deletedJSONId = {
												deletedIds : []
											};

											$inventoryTable.find("tbody tr").each(function () {

												var $deletedRow = $(this);

							
												if($(this).find("input[type='checkbox']").is(":checked")) {
													
													$(this).find("input[type='checkbox']").attr("disabled", "disabled");
													deletedJSONId.deletedIds.push($(this).find("td:eq(2)").html());

												}
											});

											console.log(JSON.stringify(deletedJSONId));

											$.post("/FBExportSystem/admin/inventory/delete-selected-product", 
												{
													ids : JSON.stringify(deletedJSONId)
												}, function () {

													$inventoryTable.find("tbody tr").each(function () {

														var $deletedRow = $(this);

									
														if($(this).find("input[type='checkbox']").is(":checked")) {
															

															var $childRow = $deletedRow.next();

															if (!$childRow.hasClass("odd") && !$childRow.hasClass("even")) {
																$childRow.fadeOut("slow");
															}


															$deletedRow.fadeOut("slow", function () {
																table.row($deletedRow).remove().draw(false);
															});

														}

													});

													$(toast).fadeOut("slow", function () {
															$(this).remove();
													});

													iziToast.success({
															timeout : 2000,
															progressBar : false,
															message : "Selected product deleted"
													});
													
												});

											$("#checkbox-all").prop("checked", false);
											
											$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																														.css("pointer-events", "none");

										}
								});

					} else {
						console.log("ada");
						alertify.alert("Select a product first");

						$("#checkbox-all").prop("checked", false);

						$("a#delete-selected-product").removeClass("red-text").addClass("text-muted").css("cursor", "not-allowed")
																									 .css("pointer-events", "none");

						$(".alertify").css("z-index", "10");
					}
														
		});

		$(".alertify").css("z-index", "10");
	
	});
	
	

});