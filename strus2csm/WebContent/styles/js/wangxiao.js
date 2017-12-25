jQuery(function($) {

 $(".col_tit b").first("").addClass("hover")
 $("#tab_bot02").hide();
	$("#tab_tit01").click(function(){
		$(this).addClass("hover")
     $("#tab_tit02").removeClass("hover");
		$("#tab_bot01").show();
		$("#tab_bot02").hide();
		})
	$("#tab_tit02").click(function(){
		$(this).addClass("hover")
     $("#tab_tit01").removeClass("hover");
		$("#tab_bot02").show();
		$("#tab_bot01").hide();
		})
 
});
