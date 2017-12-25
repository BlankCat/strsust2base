$(function(){
	
	
	/*lessonTabsConstructor(
		0,默认加载选中第一个页签
		function(tabIndex){点击页签回调函数}
	);*/
	
	$('.togo-audio').mouseenter(function(){
		var ofst = $(this).offset();
		$('#gotoAudioMsg').css({left: ofst.left - 5 + 'px', top: ofst.top - 26 + 'px'}).show();
	}).mouseleave(function(){
		$('#gotoAudioMsg').hide();
	});
	
	countDown({
		box: '#countDown',
		D: '.num_D',
		h: '.num_h',
		m: '.num_m',
		s: '.num_s',
		lastTime: $('#countDown').attr('endTime')
	});
});

//tab页签加载函数
function lessonTabsConstructor(selectedIndex,callback){
	var lessonTabList = $('#lessonTabList');
	var lessonTabListTab = $('#lessonTabList li a');
	var lessonTabContents = $('#lessonTabContent .lessonTabContent');
	
	//添加normal class
	lessonTabList.find('li a:not(.normal):not(.selected)').addClass('normal');
	
	//默认选中加载
	if (selectedIndex >= 0) {
		changeTabSelect(selectedIndex,callback);
	}
	
	//tab点击事件绑定
	lessonTabListTab.unbind('click').bind({
		'click': function(){
			changeTabSelect($(this).parent().index(),callback);
		}
	});
	
	function changeTabSelect(s_i_v,callbackF){
		//初始化callback参数
		if (typeof callbackF != 'function') {
			callback = function(){};
		}
		//检查可执行性
		if (lessonTabListTab.eq(s_i_v).length > 0 && !lessonTabListTab.eq(s_i_v).hasClass('selected') && lessonTabContents.eq(s_i_v).length > 0) {
			lessonTabList.find('li a.selected').removeClass('selected normal').addClass('normal');
			lessonTabListTab.eq(s_i_v).addClass('selected');
			lessonTabContents.hide();
			lessonTabContents.eq(s_i_v).show();
			callbackF(s_i_v);
		}
	}
	
}

/*倒计时*/
function countDown(obj){
	obj = {
		box: $(obj.box),
		D: $(obj.box).find(obj.D),
		h: $(obj.box).find(obj.h),
		m: $(obj.box).find(obj.m),
		s: $(obj.box).find(obj.s),
		lastTime: obj.lastTime || '2013-07-01 12:00:00'
	};
	var datetime = obj.lastTime.split(' ');
	var d = datetime[0].split('-');
	var t = datetime[1].split(':');
	d[1] = parseInt(d[1]) - 1;
	var last = Date.UTC(d[0], d[1],d[2],t[0],t[0],t[0]);
	var setinterval = setInterval(runn, 500);
	function runn(){
		var now = Date.parse(new Date());
		var count_t = last - now;
		if (count_t <= 0) {
			clearInterval(setinterval);
		}
		count_t = {
				
			D: parseInt(count_t/(1000*60*60*24)),
			h: parseInt(count_t%(1000*60*60*24)/(1000*60*60)),
			m: parseInt(count_t%(1000*60*60)/(1000*60)),
			s: parseInt(count_t%(1000*60)/1000)
		};
		if (obj.D) obj.D.text(count_t.D);
		if (obj.h) obj.h.text(count_t.h);
		if (obj.m) obj.m.text(count_t.m);
		if (obj.s) obj.s.text(count_t.s);
		
	};
}
