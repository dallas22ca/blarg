$ ->
	$("#sitemap").nestedSortable
		items: 'li'
		toleranceElement: '> div'
	
	$(".save_sitemap").live "click", () ->
		url = $(this).attr "href"
		$.post url, $("#sitemap").nestedSortable("serialize")
		false