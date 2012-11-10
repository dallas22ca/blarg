$ ->
	$(".img").live "click", (e) ->
		url = $(this).data("url")
		alt = $(this).attr("alt")
		href = $(this).parents("a").attr("href")
		src = $(this).attr("src")
		
		$("#selected_img img").attr "src", src
		$(".widget_fields").hide()
		$("#image_fields").show()
		$(this).addClass "active_img"
		
		$("#style").val "section_image"
		$("#save_image").attr "action", url
		
		$("#alt").val alt
		
		if href != "" && href != "#"
			$("#href").val href
		else
			$("#href").val ""
			
		$.fn.openGallery()
		
		e.preventDefault()
	
	$(".widget_image").live "click", () ->
		url = $(this).data("url")
		alt = $(this).find("img").attr("alt")
		href = $(this).find("a").attr("href")
		src = $(this).find("img").attr("src")
		
		$("#selected_img img").attr "src", src
		$(".widget").removeClass "active"
		$(this).addClass "active"
		
		$(".widget_fields").hide()
		$("#image_fields").show()
		
		$("#style").val "image"
		$("#save_image").attr "action", url
		
		$("#alt").val alt
		
		if href != "" && href != "#"
			$("#href").val href
		else
			$("#href").val ""
			
		$.fn.openGallery()

	$(".widget_gallery").live "click", () ->
		url = $(this).data("url")
		html = $(this).html()
		$(".widget").removeClass "active"
		$(this).addClass "active"
		$.fn.openGallery()
		$(".widget_fields").hide()
		$("#gallery_fields").show()
		$("#style").val "gallery"
		$("#gallery_fields .html").html html
		$("#save_image").attr "action", url

	$(".widget_text").live "blur", () ->
		url = $(this).data("url")
		$.post url,
			_method: "put"
			"widget[html]": $(this).html()
			
	$(".widget a").live "click", (e) ->
		e.preventDefault()