//var closeFlag = 1;
$(function(){
	//msg提示信息关闭按钮事件
	/*$('.icon_close').mouseenter(function(){
		$(this).removeClass('normal');
		$(this).addClass('hover');
	}).mouseleave(function(){
		$(this).removeClass('hover');
		$(this).addClass('normal');
	}).click(function(){
		$('.s_msgbox').fadeOut(200);
		closeFlag = 0;
	});*/
	//定时监听msg
	queryMsg();
	setInterval(queryMsg, 300000);
});
//监听msg函数
