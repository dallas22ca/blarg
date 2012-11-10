$ ->
	$.fn.setEditor()
	
	$(document).on 'page:change', () ->
		$.fn.setEditor()

$.fn.setEditables = () ->
	$(".rdr, .widget_text .text_content").attr "contenteditable", true
	
$.fn.setEditor = () ->
	$.fn.setEditables()
	
	$(".widget").live
		"mouseenter": () ->
			id = $(this).data("id")
			$("#widget_controls").remove()
			$(this).addClass "hover"
			$("""
<div id="widget_controls">
	<a href="#" class="widget_handle">+</a>
	<a href="/widgets/#{id}" data-remote="true" data-confirm="Are you sure you want to delete this widget?" data-method="delete" class="remove_widget" rel="nofollow">x</a>
</div>
			""").appendTo $(this)
		"mouseleave": () ->
			$("#widget_controls").remove()
			$(this).removeClass "hover"
	
	$("html").live "click", (e) ->
		if !$(e.target).parents(".active").length && !$(e.target).hasClass("active")
			$(".active").removeClass "active"
	
	$(".rdr").live "focus", () ->
		$(this).parents(".widget").addClass "active"
	
	$(".rdr").live "blur", () ->
		$(this).parents(".widget").removeClass "active"
	
	$(".close_gallery").live "click", () ->
		$("#media_overlay").removeClass "open"
		$("body").css "overflow-y", "auto"
		false
	
	$(".rdr").live "blur", () ->
		url = $(this).data("url")
		$.post url,
			_method: "put"
			"section[html]": $(this).html()
	
	if $(".section").length
		$(".section").sortable
			items: ".widget"
			cancel: '[contenteditable]'
			connectWith: ".section"
			placeholder: "placeholder"
			forceHelperSize: true
			forcePlaceholderSize: true
			revert: 100
			handle: ".widget_handle"
			over: () ->
				$(".placeholder").show()
			start: (e, ui) ->
				ui.placeholder.html ui.item.html()
				ui.placeholder.addClass "temp_mover"
			stop: (event, ui) ->
				ui.item.removeClass "temp_mover"
				if ui.item.hasClass "draggable"
					stamp = new Date().getTime()
					url = $(ui.item).data("url")
					section_id = $(this).data("id")
					ordinal = ui.item.index()
					ui.item.replaceWith "<div id=\"new_widget_#{stamp}\" class=\"loading_widget widget\">Loading...</div>"
					$.post url,
						section_id: section_id
						ordinal: ordinal
						stamp: stamp
				if !$(this).find(".widget").length
					$(this).html("<p class=\"no_widgets\">This is a droppable area. Drag some widgets here.</p>")
			update: () ->
				section_id = $(this).data("id")
				url = $(this).data("url")
				$.post url + "?section_id=#{section_id}", $(this).sortable("serialize")
				if $(this).find(".widget").length
					$(this).find(".no_widgets").remove()
			
		$(".draggable").live "click", () ->
			false

		$(".draggable").draggable
			connectToSortable: ".section"
			helper: 'clone'
			revertDuration: 0