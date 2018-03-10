
$(document).ready(function () {

    // PENDING,
	// APPROVED,
	// REJECTED,
	// RECEIVED, dynamic
	// TO_SHIP,
	// PAID,
	// RETURNED, dynamic
	// CANCELLED, dynamic
	// REFUND dynamic
	
	var reInitializePopover = function () {
		$('[data-toggle="popover"]').popover({
			placement : "top"
		});	
	};

	$(".btn-cancel-order").click(function () {
		
		var $orderDivItem = $(this).closest("span.list-group-item");


		console.log($(this).closest("span.list-group-item").find("#orderId").html());


		

		alertify.okBtn("yes")
				.confirm("are you sure you want to cancel your order?", function () {

					alertify.defaultValue("wrong order")
							.prompt("tell us your reason for cancellation", function (val, ev) {

						$.post("/FBExportSystem/order-list/markCancelled", {
							orderId : $orderDivItem.find("#orderId").html(),
							reason : val							
						}, function () {

							var $orderStatus = $orderDivItem.find("#orderStatus");

							$orderStatus.html("Cancelled");
							$orderStatus.removeClass("orange-text").addClass("red-text");

							var $cancelLinkToReason = $orderDivItem.find("div.dropdown>a:eq(1)");

							$cancelLinkToReason.html("Reason");

							$cancelLinkToReason.attr("data-toggle", "popover")
											   .attr("data-trigger", "focus")
											   .attr("title", "")
											   .attr("data-content", val)
											   .attr("data-original-title", "Reason");

							$cancelLinkToReason.off("click");

							reInitializePopover();

							var $divOrderCollapse = $orderDivItem.next();

							$divOrderCollapse.find(">div").find("div.row:eq(1)").after('<hr class="m-0">' +
																						'<div class="row">' +
																							'<div class="col-sm-12">' +
																								'<button type="button" class="btn btn-primary float-right btn-delete-order waves-effect waves-light">Delete</button>' +
																							'</div>' +
																						'</div>'
																						);

							$divOrderCollapse.find("button.btn-delete-order").click(function () {

								var $btnDeleteOrder = $(this);

								alertify.okBtn("delete")
										.confirm("are you sure you want to delete your order?", function () {

											$btnDeleteOrder.attr("disabled", "disabled");

											var $divOrderCollapse = $btnDeleteOrder.closest("div.multi-collapse");
											var $orderDivItem = $divOrderCollapse.prev();

											$divOrderCollapse.fadeOut("slow", function () {
												$orderDivItem.fadeOut("slow", function () {
													$divOrderCollapse.remove();
													$orderDivItem.remove();
												});
											});
										
										});
							});		

						});

					});

				});

	});

	reInitializePopover();

	$("button.btn-delete-order").click(function () {

		var $btnDeleteOrder = $(this);
		var $divOrderCollapse = $btnDeleteOrder.closest("div.multi-collapse");
		var $orderDivItem = $divOrderCollapse.prev();

		alertify.okBtn("delete")
				.confirm("are you sure you want to delete your order?", function () {

					$btnDeleteOrder.attr("disabled", "disabled");

					$.post("/FBExportSystem/order-list/markDeleted", {
						orderId : $orderDivItem.find("#orderId").html()
					}, function () {
						$divOrderCollapse.fadeOut("slow", function () {
							$orderDivItem.fadeOut("slow", function () {
								$divOrderCollapse.remove();
								$orderDivItem.remove();
							});
						});
					});

				});
	});
    
});