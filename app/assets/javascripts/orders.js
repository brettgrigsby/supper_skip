$(document).ready ( function () {

  function hideAll() {
    $('div#accordian.panel-group').addClass('hidden');
  }

  function showAll() {
    $('div#accordian.panel-group').removeClass('hidden');
  }

  $("button.all").click(function() {
    showAll();
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
