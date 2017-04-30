// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(function(){ $(document).foundation(); });
  $(window).trigger('load.zf.sticky');

  jQuery(function ($) {
    var show_error, stripeResponseHandler;
    $("#new_membership").submit(function (event) {
      var $form;
      $form = $(this);
      $form.find("input[type=submit]").prop("disabled", true);
      Stripe.card.createToken($form, stripeResponseHandler);
      return false;
    });

    stripeResponseHandler = function (status, response) {
      var $form, token;
      $form = $("#new_membership");
      if (response.error) {
        show_error(response.error.message);
        $form.find("input[type=submit]").prop("disabled", false);
      } else {
        token = response.id;
        $form.append($("<input type=\"hidden\" name=\"membership[card_token]\" />").val(token));
        $("[data-stripe=number]").remove();
        $("[data-stripe=cvc]").remove();
        $("[data-stripe=exp-year]").remove();
        $("[data-stripe=exp-month]").remove();
        $("[for=Card_Number]").remove();
        $("[for=Verification_Number]").remove();
        $("[for=Expiry_Month]").remove();
        $("[for=Expiry_Year]").remove();
        $form.get(0).submit();
      }
      return false;
    };

    show_error = function (message) {
      $("#flash-messages").html('<div class="callout warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
      $('.alert').delay(5000).fadeOut(3000);
      return false;
    };
  });

  var optionIndex = document.getElementById('membership_membership_option_id').selectedIndex;
  document.getElementById('membership_prices').selectedIndex = optionIndex;
  var price_text = $("#membership_prices option:selected").text();
  $("#membership_price > h3").first().text("Price: £" + price_text);
 
  document.getElementById('membership_membership_option_id').onchange = function() {
    document.getElementById('membership_prices').selectedIndex = this.selectedIndex;
    var price_text = $("#membership_prices option:selected").text();
    $("#membership_price > h3").first().text("Price: £" + price_text);
    return false
  };
});
