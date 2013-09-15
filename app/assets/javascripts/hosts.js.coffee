# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
	$('a.edit').on 'click', (e)->
		e.preventDefault()
		e.stopPropagation()
		$('span.delete').toggleClass('show')

	$('.item').on 'ajax:success', (e)->
		$(@).parent().remove()