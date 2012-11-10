$ ->
	$("html").live "keyup", (e) ->
		if e.keyCode == 27
			$("#media_overlay").removeClass "open"
	
	$("#media img").live "click", () ->
		if $("#style").val() == "image"
			$("#media img").removeClass "selected"
			$(this).addClass "selected"
			$("#selected_media img").attr "src", $(this).data("original")
			$.fn.updateHTML()
		else if $("#style").val() == "section_image"
			$("#selected_media img").attr "src", $(this).data("original")
			$.fn.updateHTML()
		else if $("#style").val() == "gallery"
			img = $(this).clone()
			img.attr "src", img.data("original")
			img.appendTo $("#gallery_fields .html")
			$.fn.updateHTML()
		false
	
	$("#alt, #href").live "keyup", () ->
		$.fn.updateHTML()

	$("#new_medium").fileupload
		dataType: "script"
	
	$("#save_image").live "submit", () ->
		$.fn.closeGallery()
	
$.fn.openGallery = () ->
	$("#media_overlay").addClass "open"
	$("body").css "overflow-y", "hidden"
	$("#widget_controls").remove()
	$.fn.updateHTML()
	$("#gallery_fields").sortable
		items: "a, img"
		placeholder: "placeholder"
		
$.fn.closeGallery = () ->
	$("#media_overlay").removeClass "open"
	$("body").css "overflow-y", "auto"
	
$.fn.updateHTML = () ->
	style = $("#style").val()
	
	if style == "image"
		src = $("#selected_media img").attr("src")
		alt = $("#alt").val()
		href = $("#href").val()
		img = "<img src=\"#{src}\" alt=\"#{alt}\" />"
		
		if href == ""
			$("#widget_html").val img
		else
			$("#widget_html").val "<a href=\"#{href}\">#{img}</a>"
	else if style == "section_image"
		src = $("#selected_media img").attr("src")
		alt = $("#alt").val()
		href = $("#href").val()
		
		$("#media img").removeClass "selected"
		$(this).addClass "selected"
		$("#selected_media img").attr "src", src
		$("#widget_html").val "#{src},#{href},#{alt}"
		
	else if style == "gallery"
		html = $("#gallery_fields .html").html()
		$("#widget_html").val html