# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('select[name="story[state]"]').change ->
    console.log "changing"
    city_input = $('select[name="story[city]"]')

    $.getJSON '/cities/' + $(this).val(), (data) ->
      city_input.empty()
      $.each data, (i, el) ->
        opt = '<option value=' + el + '>' + el + '</option>'
        city_input.append opt
        return
      return
    return
