# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	characters = 140
	text = 'You have 140 characters remaining'
	$('#counter').text(text)
	$('#SwitInput').keyup ->
	    if $(this).val().length > characters
	      $(this).val $(this).val().substr(0, characters)
	    remaining = characters - ($(this).val().length)
	    $('#counter').html 'You have ' + remaining + ' characters remaining'
	    return
	  return