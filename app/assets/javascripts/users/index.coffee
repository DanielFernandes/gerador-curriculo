$(document).on 'turbolinks:load', ->
  $('select').material_select()
  $('.parallax').parallax()
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15
    });
