$(function(){
	
	//主导航定位
	$('.nav2').addClass('selected');
	
	commentsPlay();
	
	$('#copperUserFormt').validationEngine();
	$('#silverUserFormy').validationEngine();
	$('#copperUserFormj').validationEngine();
	
	// Dialog Link
	$('#copperUserDialog').click(function () {
		var t =$('#copperUserDialogWindow').dialog('isOpen');
		var y =$('#silverUserDialogWindow').dialog('isOpen');
		var j =$('#goldenUserDialogWindow').dialog('isOpen');
		if(t || y || j ){
		return false;
		}
    	$('#copperUserDialogWindow').dialog('open');
		return false;
	});
	// Dialog Link
	$('#silverUserDialog').click(function () {
		var t =$('#copperUserDialogWindow').dialog('isOpen');
		var y =$('#silverUserDialogWindow').dialog('isOpen');
		var j =$('#goldenUserDialogWindow').dialog('isOpen');
		if(t || y || j ){
		return false;
		}
		$('#silverUserDialogWindow').dialog('open');
		return false;
	});
	// Dialog Link
	$('#goldenUserDialog').click(function () {
		var t =$('#copperUserDialogWindow').dialog('isOpen');
		var y =$('#silverUserDialogWindow').dialog('isOpen');
		var j =$('#goldenUserDialogWindow').dialog('isOpen');
		if(t || y || j ){
		return false;
		}
		$('#goldenUserDialogWindow').dialog('open');
		return false;
	});
	
	// Dialog Simple
	$('#copperUserDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '铜牌会员申请',
		width: 600,
		buttons: {
			"提交": function () {
				if ($('#copperUserFormt').validationEngine('validate')) {
				var aidentity=$('#aidentityt').val();
				var acontact=$('#acontactt').val();
				var atel=$('#atelt').val();
				var aemail=$('#aemailt').val();
				var arank=$('#arankt').val();
				var anote=$('#anotet').val();
				var action=$('#copperUserFormt').attr('action');
				$.post(action,{'aidentity':aidentity,'acontact':acontact,
					'atel':atel,'aemail':aemail,'anote':anote,'arank':arank},function(){
					$("#resett").click();//触发reset按钮 } 
					alert('申请成功！');
				});
				$('#copperUserFormt').validationEngine("hide");
		    	$(this).dialog("close");
				}
		    },
		    "取消": function () {
		    	$('#copperUserFormt').validationEngine("hide");
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
	// Dialog Simple
	$('#silverUserDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '银牌会员申请',
		width: 600,
		buttons: {
			"提交": function () {
				if ($('#copperUserFormy').validationEngine('validate')) {
				var aidentity=$('#aidentityy').val();
				var acontact=$('#acontacty').val();
				var atel=$('#ately').val();
				var aemail=$('#aemaily').val();
				var arank=$('#aranky').val();
				var anote=$('#anotey').val();
				var action=$('#copperUserFormy').attr('action');
				$.post(action,{'aidentity':aidentity,'acontact':acontact,
					'atel':atel,'aemail':aemail,'anote':anote,'arank':arank},function(){
					$("#resety").click();//触发reset按钮 } 
					alert('申请成功！');
				});
				$('#copperUserFormy').validationEngine("hide");
				$(this).dialog("close");
				}
			},
			"取消": function () {
				$('#copperUserFormy').validationEngine("hide");
				$("#resety").click();//触发reset按钮 } 
				$(this).dialog("close");
			}
		},
		close: function(event, ui){
			$('#copperUserFormy').validationEngine('hide');
			$("#resety").click();//触发reset按钮 } 
	    	$(this).dialog("close");
		}

	});
	// Dialog Simple
	$('#goldenUserDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '金牌会员申请',
		width: 600,
		buttons: {
			"提交": function () {
				if ($('#copperUserFormj').validationEngine('validate')) {
				var aidentity=$('#aidentityj').val();
				var acontact=$('#acontactj').val();
				var atel=$('#atelj').val();
				var aemail=$('#aemailj').val();
				var arank=$('#arankj').val();
				var anote=$('#anotej').val();
				var action=$('#copperUserFormj').attr('action');
				$.post(action,{'aidentity':aidentity,'acontact':acontact,
					'atel':atel,'aemail':aemail,'anote':anote,'arank':arank},function(){
					$("#resetj").click();//触发reset按钮 } 
					alert('申请成功！');
				});
				$('#copperUserFormj').validationEngine("hide");
				$(this).dialog("close");
				}
			},
			"取消": function () {
				$('#copperUserFormj').validationEngine("hide");
				$("#resetj").click();//触发reset按钮 } 
				$(this).dialog("close");
			}
		},
		close: function(event, ui){
			$('#copperUserFormj').validationEngine('hide');
			$("#resetj").click();//触发reset按钮 } 
	    	$(this).dialog("close");
		}

	});

});


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