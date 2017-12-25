function aMessageContainInvoke(obj) {
	//初始化参数
	var pObj = {
		isStatic : obj.isStatic ? true : false,/*静态内容,默认值为true,如异步则设置为false.*/
		content : obj.content || '',/*如使用静态提示信息,则设置为其内容,默认值为'',若为动态,则无需忽略此属性*/
		autoClose : obj.autoClose || true,/*自动关闭,默认为true*/
		url : obj.url || '',/*ajax异步请求提示信息路径*/
		data : obj.data || {},/*ajax请求提交数据*/
		type : obj.type || 'POST',/*ajax请求提交方式*/
		time : obj.time || 10000,/*若自动关闭开启,则此数字毫秒后,将关闭信息提示,默认值为3000.*/
		callback : obj.callback || function () {},/*回调函数,若使用异步请求提示信息时,将在ajax请求成功后执行此函数,并且此函数要求返回需要显示的html代码*/
		showBtn : obj.showBtn || true,/*是否显示,默认值为true*/
		timeout : null,/*延时对象*/
		enable : true
	};
	pObj.lnlMboxStyle = function(){
		var contain = $('#lnlContain');
		var leftarea = $('#leftarea');
		var containHeight = contain.height();
		leftarea.height(containHeight);
		$('#lnlContain a').hover(function(){$(this).removeClass('default').addClass('hover');},function(){$(this).removeClass('hover').addClass('default');});
	};
	/**
	 * 获取数据
	 * */
	if (typeof pObj.callback == 'function' && !pObj.isStatic) {/*POST请求数据*/
		$.ajax({
			url: pObj.url,
			data: pObj.data,
			type: pObj.type,
			async: false,
			success: function(data) {
				if (data) {
					pObj.content = pObj.callback(data);
					pObj.enable = true;
				} else {
					pObj.enable = false;
				}
			}
		});
	}
	if (pObj.enable) {
		/*把容器写入页面*/
		//$('body:first').append('<div class="lnl-mbox"><div class="lnl-mbox-container"></div>' + (pObj.showBtn ? '<span class="lnl-mbox-close">X</span>' : '') + '</div>');
		$('body:first').append('<div class="lnl-msg-box lnl-mbox"><div class="lnl-l"><div id="leftarea" class="lnl-l-content"></div></div><div class="lnl-r"><div id="lnlContain" class="lnl-r-content">' + (pObj.showBtn ? '<span class="lnl-mbox-close">X</span>' : '') + '</div></div><span class="aim-point"></span></div>');
		/*初始化对象*/
		pObj.own = $('.lnl-mbox:last');
		if (pObj.showBtn) pObj.cancelBtn = pObj.own.find('.lnl-mbox-close');
		pObj.container = pObj.own.find('#lnlContain');
//		pObj.container = pObj.own.find('.lnl-mbox-container');
		/*关闭方法*/
		pObj.cancel = function() {
			if (pObj.timeout) clearTimeout(pObj.timeout);/*清楚延时*/
			if (pObj.own) pObj.own.slideUp(function(){
				$(this).remove();
			});/*隐藏并移出提示信息*/
			clearTimeout(pObj.timeout);
		};
		/*将数据写入提示信息容器*/
		if (pObj.content && pObj.content != '') {
			pObj.container.append(pObj.content);
		} else {
			pObj.container.append('-×-×-×-请设置提示信息！-×-×-×-');
		}
		/*将提示信息显示出来*/
		pObj.own.slideDown();
		pObj.lnlMboxStyle();
		/*延时自动关闭*/
		if (pObj.autoClose && (typeof pObj.time == 'number')) {
			pObj.timeout = top.setTimeout(pObj.cancel, pObj.time);
		}
		/*按钮事件*/
		if (pObj.showBtn) {
			pObj.cancelBtn.unbind('mouseenter mouseleave click').bind({
				'mouseenter' : function() {$(this).css({'background':'#f8d080','color':'#bf5707'})},
				'mouseleave' : function() {$(this).css({'background':'none','color':'#777'})},
				'click' : pObj.cancel
			});
		}
	}
}
