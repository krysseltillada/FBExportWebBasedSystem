
$(document).ready(function () {

    // PENDING, /
	// APPROVED, /
	// REJECTED, /
	// RECEIVED, dynamic
	// TO_SHIP,
	// PAID /
	// RETURNED, dynamic
	// CANCELLED /
	// REFUND /

	// $(".paypal-button").each(function (ind, elem) {
			
	// 		console.log($(this).closest("div.multi-collapse").prev().find(".price").html() + " tae");
		
	// 		paypal.Button.render({
	// 			env: 'sandbox', // Or 'sandbox',

	// 			style: {
	// 			color: 'blue',
	// 			size: 'small',
	// 			shape : 'rect',
	// 			size : 'small',
	// 			label : 'pay',
	// 			tagline : 'false'
	// 			},
				
	// 			commit : true,
				
	// 			client: {
	// 				sandbox:    'AQNTbQBVVlGXxzbWa9o9poVa187KefuAwZ3EuUxn7uH2cCUxXkUCqhIPW2f0Eh6FW6_MSNGxwlIv3bSD'
	// 			},

	// 			payment: function(data, actions) {
	// 			console.log(data);
	// 			return actions.payment.create({
	// 				payment: {
	// 					intent : "sale",
	// 					transactions: [
	// 						{
	// 							amount: { 
	// 								total: "360", 
	// 								currency: 'PHP',
	// 								details : {
	// 								subtotal : "360"
	// 								}
	// 							},
								
	// 							description : "tae",
	// 							invoice_number : "1",
	// 							item_list : {	
	// 								items : [
	// 								{name : "tae", price : "120", currency : "PHP", quantity : "1"},
	// 								{name : "tae", price : "120", currency : "PHP", quantity : "1"},
	// 								{name : "tae", price : "120", currency : "PHP", quantity : "1"}
	// 								],
	// 								shipping_address : {
	// 									recipient_name: "Brian Robinson",
	// 									line1: "4th Floor",
	// 									line2: "Unit #34",
	// 									city: "San Jose",
	// 									country_code: "US",
	// 									postal_code: "95131",
	// 									phone: "011862212345678",
	// 									state: "CA"
	// 								}
	// 							}
								
	// 						}
	// 					],
	// 					note_to_payer: "Contact us for any regardings on your payment",
	// 				}
	// 			});
	// 			},

	// 			onAuthorize: function(data, actions) {
	// 				return actions.payment.execute().then(function(payment) {
					
	// 				});
	// 			},

	// 			onCancel: function(data, actions) {
	// 			/* 
	// 				* Buyer cancelled the payment 
	// 				*/
	// 			},

	// 			onError: function(err) {
	// 			/* 
	// 				* An error occurred during the transaction 
	// 				*/
	// 			}
	// 		}, elem);
	// });
	
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

					alertify.reset()
							.okBtn("send")
							.defaultValue("wrong order")
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
	
						});

					});

				});

	});

	$(".btn-cancel-rejected-order").click(function () {

		var $btnCancelRejectedOrder = $(this);

		if($btnCancelRejectedOrder.is("a")) {

			var $orderDivItem = $(this).closest("span.list-group-item");
			
			alertify.okBtn("yes")
					.confirm("are you sure you want to cancel your order?", function () {

						alertify.reset()
								.okBtn("send")
								.defaultValue("wrong order")
								.prompt("tell us your reason for cancellation", function (val, ev) {

							$.post("/FBExportSystem/order-list/markCancelled", {
								orderId : $orderDivItem.find("#orderId").html(),
								reason : val							
							}, function () {

								var $orderStatus = $orderDivItem.find("#orderStatus");

								$orderStatus.html("Cancelled");
		
								var $cancelLinkToReason = $orderDivItem.find("div.dropdown>a:eq(1)");

								$cancelLinkToReason.html("Reason");

								$cancelLinkToReason.attr("data-toggle", "popover")
												.attr("data-trigger", "focus")
												.attr("title", "")
												.attr("data-content", val)
												.attr("data-original-title", "Reason");

								$cancelLinkToReason.off("click");

								var $rowHR = $orderDivItem.next().find(">div").find("div.row:eq(1)").next();
								var $rowDiv = $rowHR.next();

								$rowHR.remove();
								$rowDiv.remove();
								$btnCancelRejectedOrder.prev().remove();
								$btnCancelRejectedOrder.remove();

								reInitializePopover();
		
							});

						});

					});
		} else {

			var $orderMultiCollapse = $(this).closest("div.multi-collapse");
			var $orderDivItem = $orderMultiCollapse.prev();

			alertify.okBtn("yes")
					.confirm("are you sure you want to cancel your order?", function () {

						alertify.reset()
								.okBtn("send")
								.defaultValue("wrong order")
								.prompt("tell us your reason for cancellation", function (val, ev) {

							$.post("/FBExportSystem/order-list/markCancelled", {
								orderId : $orderDivItem.find("#orderId").html(),
								reason : val							
							}, function () {

								var $orderStatus = $orderDivItem.find("#orderStatus");

								$orderStatus.html("Cancelled");
		
								var $cancelLinkToReason = $orderDivItem.find("div.dropdown>a:eq(1)");

								$cancelLinkToReason.html("Reason");

								$cancelLinkToReason.attr("data-toggle", "popover")
												.attr("data-trigger", "focus")
												.attr("title", "")
												.attr("data-content", val)
												.attr("data-original-title", "Reason");

								$cancelLinkToReason.off("click");

								var $rowHR = $orderDivItem.next().find(">div").find("div.row:eq(1)").next();
								var $rowDiv = $rowHR.next();

								$rowHR.remove();
								$rowDiv.remove();

								var $line = $cancelLinkToReason.next();
								var $cancelLink = $line.next();

								$line.remove();
								$cancelLink.remove();

								reInitializePopover();
		
							});

						});

					});

			console.log("tae");
		}

	});

	$(".btn-cancel-approved-order").click(function () {

		var $orderDivItem = $(this).closest("span.list-group-item");

		console.log($(this).closest("span.list-group-item").find("#orderId").html());

		alertify.okBtn("yes")
				.confirm("are you sure you want to cancel your order?", function () {

					alertify.reset()
							.okBtn("send")
							.defaultValue("wrong order")
							.prompt("tell us your reason for cancellation", function (val, ev) {

						$.post("/FBExportSystem/order-list/markCancelled", {
							orderId : $orderDivItem.find("#orderId").html(),
							reason : val							
						}, function () {

							var $orderStatus = $orderDivItem.find("#orderStatus");

							$orderStatus.html("Cancelled");
							$orderStatus.removeClass("green-text").addClass("red-text");

							var $cancelLinkToReason = $orderDivItem.find("div.dropdown>a:eq(1)");

							$cancelLinkToReason.html("Reason");

							$cancelLinkToReason.attr("data-toggle", "popover")
												.attr("data-trigger", "focus")
												.attr("title", "")
												.attr("data-content", val)
												.attr("data-original-title", "Reason");

							$cancelLinkToReason.off("click");

							var $divCollapseItem = $orderDivItem.next();

							var $hr = $divCollapseItem.find(">div").find("div.row:eq(1)").next();
							var $hrRow = $hr.next();

							$hr.remove();
							$hrRow.remove();

							reInitializePopover();
	
						});

					});

				});

	});

	$(".btn-reorder").click(function () {

		var $btnReorder = $(this);

		alertify.okBtn("reorder")
				.confirm("reorder this order?", function () {
					if ($btnReorder.is("a")) {
						
						var $divOrderItem = $btnReorder.closest("span.list-group-item");
						var $orderStatus = $divOrderItem.find("#orderStatus");

						$.post("/FBExportSystem/order-list/reorder", {
							orderId : $divOrderItem.find("#orderId").html()
						}, function () {

							$orderStatus.removeClass("red-text").addClass("orange-text");
							$orderStatus.html("Pending");

							$btnReorder.prev().remove();
							$btnReorder.remove();

							var $divOrderCollapse = $divOrderItem.next();

							var $hr = $divOrderCollapse.find(">div").find("div.row:eq(1)").next();
							var $hrDiv = $hr.next();

							$hr.remove();
							$hrDiv.remove();

							$divOrderItem.find(".btn-cancel-rejected-order").off("click");
							$divOrderItem.find(".btn-cancel-rejected-order").click(function () {

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
							
												});

											});

										});

							});

						});
						

					} else {
						
						var $divOrderCollapse = $btnReorder.closest("div.multi-collapse");
						var $divOrderItem = $divOrderCollapse.prev();

						$.post("/FBExportSystem/order-list/reorder", {
							orderId : $divOrderItem.find("#orderId").html()
						}, function () {
							
							var $orderStatus = $divOrderItem.find("#orderStatus");

							$orderStatus.removeClass("red-text").addClass("orange-text");
							$orderStatus.html("Pending");

							$divOrderItem.find(".btn-reorder").prev().remove();
							$divOrderItem.find(".btn-reorder").remove();

							var $hr = $divOrderCollapse.find(">div").find("div.row:eq(1)").next();
							var $hrDiv = $hr.next();

							$hr.remove();
							$hrDiv.remove();
						
						});

					}

				});
	});

	$(".btn-refund-order").click(function () {
		
		
		var $btnRefundOrder = $(this);
		var $divOrderItem = $btnRefundOrder.closest("span.list-group-item");

		alertify.okBtn("refund")
				.confirm("are you sure you want to refund this order?", function () {

					alertify.reset()
							.okBtn("send")
							.prompt("tell us the reason for your refund", function (val, ev) {
							
							$.post("/FBExportSystem/order-list/refund", {
								orderId : $divOrderItem.find("#orderId").html(),
								reason : val,
							}, function () {

								var $refundLinkBtn = $divOrderItem.find("a.btn-refund-order");
								var $orderStatus = $divOrderItem.find("#orderStatus");

								$orderStatus.removeClass("light-green-text");
								$orderStatus.addClass("pink-text");
								$orderStatus.html("Refund");

								$refundLinkBtn.off("click");

								$refundLinkBtn.html("Reason");

								$refundLinkBtn.attr("data-toggle", "popover")
											.attr("data-trigger", "focus")
											.attr("title", "")
											.attr("data-content", val)
											.attr("data-original-title", "Reason");
								
								reInitializePopover();

							});

					});

				});

	});
			

	reInitializePopover();
    
});