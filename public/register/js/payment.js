$(document).ready(function(){
	var formId = "#payment-form";
	//provide your public key here
	Stripe.setPublishableKey('pk_test_7Q71bOm8iPESKR19JiGqBLjg00Sz6AMigN');
	
	$(function() {
		var $form = $(formId);
		
		$form.submit(function(event) {

			// Disable the submit button to prevent repeated clicks:
			$form.find('.submit')
				.prop('value', 'Sending...')
				.prop('disabled', true);
				$('#paynow-btn').val("Processing...");


				//check if it is less than 999999
				if(camount > 999999){
					console.log("it is greater");
					$('#paynow-btn').val("Please Pay by Bank");
					jQuery.noConflict();

						$('#bankModal').modal('show');
				}else{
			// Request a token from Stripe:
			console.log(camount);
			console.log("it is less");
			Stripe.card.createToken($form, stripeResponseHandler);
		}

			// Prevent the form from being submitted:
			return false;
		});
	});


	function stripeResponseHandler(status, response) {
		console.log(response);

		// Grab the form:
		var $form = $(formId);

		if (response.error) { // Problem!

			// Show the errors on the form:
			 
			$('.payment-msg')
				.removeClass('success')
				.addClass('error')
				.html(response.error.message);

			$form.find('.submit')
				.prop('value', 'Submit Payment')
				.prop('disabled', false); // Re-enable submission
				$('#paynow-btn').val("Pay Now");

		} else { // Token was created!

			// Get the token ID:
			var token = response.id;

			console.log("hello"+camount);
			$form.append($('<input type="hidden" name="description">').val(cemail));
			$form.append($('<input type="hidden" name="name">').val(cname));
			$form.append($('<input type="hidden" name="amount">').val(camount));
			$form.append($('<input type="hidden" name="email">').val(cemail));
			$form.append($('<input type="hidden" name="product_id">').val("share"));

			// Insert the token ID into the form so it gets submitted to the server:
			$form.append($('<input type="hidden" name="stripe_token">').val(token));

			// Submit the form:
			 
			$.post('stripe-payment', $form.serialize(), function(response) {
				console.log(response);
					if (response.errors) {
						

						var str = "<ul>";
						for (var i in response.errors) {
							str += "<li>" + response.errors[i] + "</li>";
						}
						str += "</ul>";
						console.log(str);

						$('.payment-msg')
							.removeClass('success')
							.addClass('error')
							.html(str);

						$form.find('.submit')
							.prop('value', 'Submit Again')
							.prop('disabled', false); // Re-enable submission
							$('#paynow-btn').val("Try Again");

					} else {

						// var str = "<ul>";
						// for (var i in response) {
						// 	str += "<li>" + i + ": " + response[i] + "</li>";
						// }
						// str += "</ul>";

						// $('.payment-msg')
						// 	.removeClass('error')
						// 	.addClass('success')
						// 	.html(str);
						jQuery.noConflict();

						$('#myModal').modal('show');

						$form.find('.submit')
						.prop('value', 'Payment Successful')
						.prop('disabled', false); // Re-enable submission	

						csource = 'card';
						$('#paynow-btn').val("Payment Successful");
					}
				}, 'json'
			);
		
		}
	};


});



function gotoagrre(){
	stepsWizard.steps("next");
	//populateAgreement();
}

function gotobank(){
	$('#nav-profile-tab').click();
}
