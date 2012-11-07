# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	setConcluidaMessage = (form)->
		console.log(form)
		form = $(form)
		form.find(".concluida").toggle(form.find(".submit-checkbox").is(":checked"))
	
	$(".form-tarefa").each (i, form)->
		setConcluidaMessage(form)
		
  $(".submit-checkbox").change ->
    $(this).closest("form").find("input[type=submit]").click()

	$(".form-tarefa").bind("ajax:success", (evt, data, status, xhr)->
		$(this).find(".error").hide()
		setConcluidaMessage(this)
	)
	.bind("ajax:error", (evt, data, status, xhr)->
		$(this).find(".error").show()
	)
