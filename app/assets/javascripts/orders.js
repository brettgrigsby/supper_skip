$(document).ready ( function () {
  function hideAll() {
    $('div#accordian.panel-group').addClass('hidden');
  }
  $("button.all").click(function() {
    hideAll();
    $('div.all').removeClass('hidden');
  });
  $("button.paid").click(function() {
    hideAll();
    $('div.paid').removeClass('hidden');
  });
  $("button.ready_for_prep").click(function() {
    hideAll();
    $('div.ready_for_prep').toggleClass('hidden');
  });
  $("button.cancelled").click(function() {
    hideAll();
    $('div.cancelled').toggleClass('hidden');
  });
  $("button.in_preparation").click(function() {
    hideAll();
    $('div.in_preparation').toggleClass('hidden');
  });
  $("button.ready_for_delivery").click(function() {
    hideAll();
    $('div.ready_for_delivery').toggleClass('hidden');
  });
  $("button.out_for_delivery").click(function() {
    hideAll();
    $('div.out_for_delivery').toggleClass('hidden');
  });
  $("button.delivered").click(function() {
    hideAll();
    $('div.delivered').toggleClass('hidden');
  });
});

// $(document).ready(function () {
//
//   var deliveryAddress = $('#delivery-address');
//   var paymentInformation = $('#payment-info');
//
//   $('input[name="order_type"]').on('change', function () {
//     var status = this.value;
//
//     if (status === 'pickup') {
//       deliveryAddress.addClass('hidden');
//     }
//
//     if (status === 'delivery') {
//       deliveryAddress.removeClass('hidden');
//     }
//
//   });
//
//   $('input[name="payment_type"]').on('change', function () {
//     var status = this.value;
//
//     if (status === 'pay_in_store') {
//       paymentInformation.addClass('hidden');
//     }
//
//     if (status === 'pay_online') {
//       paymentInformation.removeClass('hidden');
//     }
//
//   });
// });
