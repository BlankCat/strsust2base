$(function(){
	var username = $('#username');
	var csDetail = $("#csDetail_id",top.document.body);
	if(csDetail.size()){
		//是课程详情页面
		if(username.size()!=0){
			//已登录
		}else{
			//未登录
			$('.buy_button',top.document.body).show();
			$('.alreadyBuy_button',top.document.body).hide();
			$('.collect_button',top.document.body).show();
			$('.login',top.document.body).hide();
			$('.notLogin',top.document.body).show();
			$('.notFinish',top.document.body).hide();
			$('.collected_button',top.document.body).hide();
			$('.join_lesson',top.document.body).show();
		}
	}
});