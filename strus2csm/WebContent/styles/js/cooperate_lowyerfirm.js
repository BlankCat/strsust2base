$(function(){

	tabsFun();
	commentsPlay();
	
	$('.nav1').addClass('selected');
	
	$('#lowfirmCooperateForm').validationEngine();
	// Dialog Link
	$('#lowfirmCooperateDialog').click(function () {
    	$('#lowfirmCooperateDialogWindow').dialog('open');
		return false;
	});
	
	// Dialog Simple
	$('#lowfirmCooperateDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '律所合作申请',
		width: 600,
		closable:true,
		buttons: {
			"提交": function () {
				if ($('#lowfirmCooperateForm').validationEngine('validate')) {
					var aidentity=$('#aidentity').val();
					var aorganization=$('#aorganization').val();
					var acontact=$('#acontact').val();
					var atel=$('#atel').val();
					var aemail=$('#aemail').val();
					var anumber=$('#anumber').val();
					var anote=$('#anote').val();
					var action=$('#lowfirmCooperateForm').attr('action');
					$.post(action,{'aidentity':aidentity,'aorganization':aorganization,'acontact':acontact,
						'atel':atel,'aemail':aemail,'anumber':anumber,'anote':anote},function(){
							$("#reset").click();//触发reset按钮 } 
							alert('申请成功！');
						});
					$('#lowfirmCooperateForm').validationEngine("hide");
					$(this).dialog("close");
				}
		    },
		    "取消": function () {
		    	$('#lowfirmCooperateForm').validationEngine("hide");
		    	$("#reset").click();//触发reset按钮 } 
		    	$(this).dialog("close");
		    }
	    },
		close: function(event, ui){
			$('#lowfirmCooperateForm').validationEngine('hide');
			$("#reset").click();//触发reset按钮 } 
	    	$(this).dialog("close");
		}

	});
	
	var menuList = $('#tabsList');
	var menuImages = $('#tabs .pic_view img');
	
	function player(){
		var selectedEle = menuList.find('.selected');
		var nextEle = selectedEle.next();
		if (nextEle.length > 0) {
			selectedEle.removeClass('selected');
			nextEle.addClass('selected');
			menuImages.hide().eq(nextEle.index()).show();
			$('#tabs').css('background-color','#'+nextEle.attr('bgclr'));
		} else {
			selectedEle.removeClass('selected');
			menuList.find('li:eq(0)').addClass('selected');
			menuImages.hide().eq(0).show();
			$('#tabs').css('background-color','#'+menuList.find('li:eq(0)').attr('bgclr'));
		}
	}
	var stoPlay = setInterval(player, 2222);
	$('#tabsList').hover(function(){
		clearInterval(stoPlay);
	},function(){
		stoPlay = setInterval(player, 2222);
	});
	
});
function tabsFun() {
	var tab = $('#tabsList li');
	var tabs = $('#tabs');
	var pics = tabs.find('.pic_view');
	tab.eq(0).addClass('selected');
	tabs.css({'background-color':'#'+tab.eq(0).attr('bgclr')});
	pics.find('img:first').show();
	tab.unbind().bind({
		'mouseenter' : function(){
			tab.removeClass('selected');
			$(this).addClass('selected');
			tabs.css('background-color','#'+$(this).attr('bgclr'));
			pics.find('img:visible').hide();
			pics.find('img').eq($(this).index()).show();
		}
	});
}

function commentsPlay(){
	var btnLf = $('#toLeft');
	var btnRt = $('#toRight');
	var commentsList = $('#commentsList');
	btnLf.hide();
	if (commentsList.find('.comment_li').length == 1) btnRt.hide();
	commentsList.find('.comment_li:first').addClass('selected').fadeIn();
	
	btnLf.unbind().bind({
		'click':function(){
			goPlay(-1);
		}
	});
	btnRt.unbind().bind({
		'click':function(){
			goPlay(1);
		}
	});
	
	function goPlay(flag) {
		var total = commentsList.find('.comment_li').length;
		var oldselectedcomment = commentsList.find('.comment_li.selected').removeClass('selected');
		var selectedcomment = commentsList.find('.comment_li').eq(oldselectedcomment.index()+flag).addClass('selected');
		if (flag == -1) {
			oldselectedcomment.animate({'margin-left':'640px'});
			selectedcomment.css({'margin-left':'-640px'}).fadeIn(300).animate({'margin-left':'0'},300,function(){
				oldselectedcomment.hide().css({'margin-left':'0'});
			});
			if (selectedcomment.index() == 0) {
				btnLf.hide();
			}
			btnRt.show();
		} else {
			oldselectedcomment.animate({'margin-left':'-640px'});
			selectedcomment.css({'margin-left':'640px'}).fadeIn(300).animate({'margin-left':'0'},300,function(){
				oldselectedcomment.hide().css({'margin-left':'0'});
			});
			if (selectedcomment.index() == total - 1) {
				btnRt.hide();
			}
			btnLf.show();
		}
	}
}