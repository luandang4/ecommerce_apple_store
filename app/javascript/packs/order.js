$(document).ready(function(){
  $(document).on("change", ".delivery-address", function(){
    var address = $(this).val();
    $.ajax({
      url: '/orders/new?format=json',
      method: 'GET',
      data: {
        address: address
      },
      success: function(r) {
        if(r['address']) {
          $(".name-address").val(r['address']['name']);
          $(".phone-address").val(r['address']['phone']);
          $(".current-address").val(r['address']['address']);
        } else {
          $(".name-address").val('');
          $(".phone-address").val('');
          $(".current-address").val('');
        }
      }
    });
  });

  $(document).on("change", ".payment-method", function(){
    var payment = $(this).val();
    const form_payment = $('#form-payment');
    if(payment == "card") {
      var $div_card = $("<div>", {"class": "card"});
      var $div_card_body = $("<div>", {"class": "card-body"});
      var $div_card_element = $("<div>", {"id": "card-element"});
      var $div_card_errors = $("<div>", {"id": "card-errors", "role": "alert"});

      $div_card.append($div_card_body);
      $div_card_body.append($div_card_element, $div_card_errors);
      form_payment.append($div_card);

      var stripe = Stripe('pk_test_51L2tJMHRTN8RwwVxmZ0NNwGprrfisF6kY1HFnCEwlno7ARt9eINbGCX4AdMFIKwjOGGULdqqg72jWlgEcToVD2XZ00IWYVhNvR');
      // Set up Stripe.js and Elements to use in checkout form
      var elements = stripe.elements();
      var style = {
        base: {
          color: "#32325d",
        }
      };
    
      var card = elements.create("card", { style: style });
      card.mount("#card-element");
    
      card.on('change', function(event) {
        var displayError = document.getElementById('card-errors');
        if (event.error) {
          displayError.textContent = event.error.message;
        } else {
          displayError.textContent = '';
        }
      });
    
      var form = document.getElementById('payment-form');
      form.addEventListener('submit', function(event) {
        event.preventDefault();
    
        stripe.createToken(card).then(function(result) {
          if (result.error) {
            // Inform the customer that there was an error.
            var errorElement = document.getElementById('card-errors');
            errorElement.textContent = result.error.message;
          } else {
            // Send the token to your server.
            console.log(result.token)
            stripeTokenHandler(result.token);
          }
        });
      });
    
      function stripeTokenHandler(token) {
        // Insert the token ID into the form so it gets submitted to the server
        var form = document.getElementById('payment-form');
        var hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'stripeToken');
        hiddenInput.setAttribute('value', token.id);
        form.appendChild(hiddenInput);
    
        // Submit the form
        form.submit();
      }
    } else {
      form_payment.empty();
    }
  });

  $('#card-number').keyup(function() {
    cc = $(this).val().split(" ").join("");
    cc = cc.match(new RegExp('.{1,4}$|.{1,4}', 'g')).join(" ");
    $(this).val(cc);
  });

  $('#expiration-date').keyup(function() {
    cc = $(this).val().split("/").join("");
    cc = cc.match(new RegExp('.{1,2}$|.{1,2}', 'g')).join("/");
    $(this).val(cc);
  });
});
