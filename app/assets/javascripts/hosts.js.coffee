# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.ping').bind 'ajax:success', (e, data)->
	$(@).find('.result').text data.respond_ms + ' ms'
.bind 'ajax:error', ->
	$(@).find('.result').text 'ERROR'