$(function(){
	
	$('.rt_menu_li').unbind().bind({
		'mouseenter': function(){
			var sonMenu = $(this).find('.son_menu_list');
			if (sonMenu.length) {
				sonMenu.slideDown();
			}
		},
		'mouseleave': function(){
			var sonMenu = $(this).find('.son_menu_list');
			if (sonMenu.length) {
				sonMenu.stop(true, false).slideUp();
			}
		}
	});
	
});