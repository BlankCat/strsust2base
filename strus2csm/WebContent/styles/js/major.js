$(function(){
	//主导航定位
	$('.nav4').addClass('selected');
	//初始化左侧菜单选中
	$('#leftMenuList li:first').removeClass('selected').addClass('selected');
	//初始化课程页面（加载第一专业）
	loadPage(0);
	//左侧菜单点击
	$('#leftMenuList li a').click(function(){
		$('#leftMenuList li.selected').removeClass('selected');
		var selectingMenu = $(this).parent().addClass('selected');
		$('#contentsParagraph1DialogWindow').remove();
		$('#contentsParagraph2DialogWindow').remove();
		loadPage(selectingMenu.index());
	});
	//专业子页面load函数
	function loadPage(index){
		$('#mainContainer').load('major/major'+index+'.html',function(){
		/*load Callback Fun*/
			//教师名片特效
			$('.teacher_list li .card_wrapper').bind('mouseover mouseout',function(event){
				if (event.type == 'mouseover') {
					$(this).addClass('hover');
				} else {
					$(this).find('.lawyer_work').scrollTop(0);
					$(this).removeClass('hover');
				}
			});
			//tab页
			changeTab(0);
			$('.tab_list a').unbind().bind({
				'mouseenter': function(){
					changeTab($(this).parent().index());
				}
			});
			if ($('#contentsParagraph1').length > 0) {
				//序言全文dialog初始化
				$('#contentsParagraph1DialogWindow').dialog({
					autoOpen: false,
					resizable: false,
					width: 400,
					height: 400,
					buttons: {
						'关闭':function(){
							$(this).dialog('close');
						}
					}
				});
				//序言全文dialog弹出控制
				$('#contentsParagraph1').click(function(){
					if(!$('#contentsParagraph1DialogWindow').dialog('isOpen')){
						$('#contentsParagraph1DialogWindow').dialog('open');
					}
				});
			}
			if ($('#contentsParagraph2').length > 0) {
				//后记全文dialog初始化
				$('#contentsParagraph2DialogWindow').dialog({
					autoOpen: false,
					resizable: false,
					width: 400,
					height: 400,
					buttons: {
						'关闭':function(){
							$(this).dialog('close');
						}
					}
				});
				//后记全文dialog弹出控制
				$('#contentsParagraph2').click(function(){
					if(!$('#contentsParagraph2DialogWindow').dialog('isOpen')){
						$('#contentsParagraph2DialogWindow').dialog('open');
					}
				});
			}
			//专业主图放大
			var sto0;
			$('.major_img').mouseenter(function(){
				sto0 = setTimeout(showImg, 1000);
				function showImg(){
					$('#majorMainPicBig').stop(false,true).show();
				}
			}).mouseleave(function(){
				clearTimeout(sto0);
			});
			$('#majorMainPicBig').mouseleave(function(){
				clearTimeout(sto0);
				$(this).stop(false,true).hide();
			});
			
			$('.majorDialog').click(function () {
				$('#majorDialogWindow').dialog('isOpen');
		    	$('#majorDialogWindow').dialog('open');
		    	return false;
			});
			
		});
	}
	
	var isXp = systemIsXp;
	if (isXp) {
		$('body').prepend('<style type="text/css">.important_info .buy_now{margin: 15px 140px 15px 361px;}</style>');
	}
	
	$('#majorFormt').validationEngine();
	$('#majorDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '专业课程购买申请',
		width: 600,
		buttons: {
			"提交": function () {
				if ($('#majorFormt').validationEngine('validate')) {
				var aidentity=$('#aidentity').val();
				var acontact=$('#acontact').val();
				var atel=$('#atel').val();
				var aemail=$('#aemail').val();
				var anote=$('#anote').val();
				var action=$('#majorFormt').attr('action');
				$.post(action,{'aidentity':aidentity,'acontact':acontact,
					'atel':atel,'aemail':aemail,'anote':anote},function(){
					$("#resett").click();//触发reset按钮 } 
					alert('申请成功！');
				});
				$('#majorFormt').validationEngine("hide");
		    	$(this).dialog("close");
				}
		    },
		    "取消": function () {
		    	$('#majorFormt').validationEngine("hide");
		    	$("#resett").click();//触发reset按钮 } 
		    	$(this).dialog("close");
		    }
	    },
		close: function(event, ui){
			$('#copperUserFormt').validationEngine('hide');
			$("#resett").click();//触发reset按钮 } 
	    	$(this).dialog("close");
		}

	});
});

//tab页切换函数
function changeTab(index){
	var selectedEle = $('.tab_list a.selected');
	var selectedIndex = selectedEle.parent().index();
	if (selectedIndex != index) {
		selectedEle.removeClass('selected');
		$('#'+selectedEle.attr('contentid')).hide();
		var selectingEle = $('.tab_list li:eq('+index+') a').addClass('selected');
		$('#'+selectingEle.attr('contentid')).show();
	}
}