$(function(){
	
	linkHover('._hover_y','h_color_y');
	linkHover('._hover_r','h_color_r');
	linkHover('._hover_opacity','h_filter');
	linkHover('._hover_line','h_line');
	linkHoverPrivate('.main_nav_link.lsuo','lsuo_h','lsuo');
	linkHoverPrivate('.main_nav_link.lshi','lshi_h','lshi');
	linkHoverPrivate('.main_nav_link.lxie','lxie_h','lxie');
	linkHoverPrivate('.main_nav_link.bban','bban_h','bban');

	imagePlayer();
	cardPlayer();
	
	// Dialog Link
	$('#lowfirmCooperateDialog').click(function () {
    	$('#lowfirmCooperateDialogWindow').dialog('open');
		return false;
	});
	$('#lowfirmCooperateForm').validationEngine();
	// Dialog Simple
	$('#lowfirmCooperateDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '讲师申请',
		width: 600,
		buttons: {
			"提交": function () {
			if ($('#lowfirmCooperateForm').validationEngine('validate')) {
				var aidentity=$('#aidentity').val();
				var acontact=$('#acontact').val();
				var atel=$('#atel').val();
				var aemail=$('#aemail').val();
				var anote=$('#anote').val();
				var action=$('#lowfirmCooperateForm').attr('action');
				$.post(action,{'aidentity':aidentity,'acontact':acontact,
					'atel':atel,'aemail':aemail,'anote':anote},function(){
					$("#reset").click();//触发reset按钮 } 
					alert('申请成功！');
				});
				$('#lowfirmCooperateForm').validationEngine('hide');
		    	$(this).dialog("close");
			}
		    },
		    "取消": function () {
		    	$('#lowfirmCooperateForm').validationEngine('hide');
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
	$('.block2 .left .content li:odd').css({'padding-bottom':'8px'});
	
	
});

function linkHover(selector,classStr){
	$(selector).hover(
		function(){
			$(this).addClass(classStr);
		},
		function(){
			$(this).removeClass(classStr);
		}
	);
}
function linkHoverPrivate(selector,classStr1,classStr2){
	$(selector).hover(
		function(){
			$(this).removeClass(classStr2).addClass(classStr1);
		},
		function(){
			$(this).removeClass(classStr1).addClass(classStr2);
		}
	);
}
function imagePlayer(){
	var imagePlayerBox = $('#imagePlayerBox')
	,	imagePlayerBody = $('#imagePlayerBody')
	,	img = imagePlayerBody.find('img')
	,	btn = imagePlayerBody.find('li')
	,	selectedNum = 0
	,	s_i_v = new Object;
	btn.click(function(){
	}).mouseenter(function(){
		selectedNum = $(this).index();
		player();
		clearInterval(s_i_v);
	}).mouseleave(function(){
		s_i_v = setInterval(play, 3000);
	});
	player();
	s_i_v = setInterval(play, 3000);
	function player(){
		imagePlayerBox.css({'background-color':'#'+img.eq(selectedNum).attr('themecolor')});
		imagePlayerBody.find('li.high_light').removeClass('high_light');
		btn.eq(selectedNum).addClass('high_light');
		img.hide();
		img.eq(selectedNum).show();
	}
	function play(){
		var max = $("li[id^=ad]").length;
		selectedNum++;
		if(selectedNum == max){
			selectedNum = 0;
		}
		player();
		if (img.length-1 == selectedNum) {
			selectedNum = -1;
		}
	}
}

function cardPlayer(){
	var goLeft = $('#goLeft')
	,	goRight = $('#goRight')
	,	cardUl = $('#cardList').find('ul')
	,	cardObj = {c0:cardUl.eq(0),c1:cardUl.eq(1),c2:cardUl.eq(2)}
	,	m = 560
	,	t = 300
	,	s_i_v = new Object;
	cardObj.c0.css('margin-left','-650px');
	cardObj.c2.css('margin-left','650px');
	s_i_v = setInterval(goRightFun, 3000);
	goLeft.click(goLeftFun).mouseenter(function(){
		clearInterval(s_i_v);
	}).mouseleave(function(){
		s_i_v = setInterval(goRightFun, 3000);
	});
	goRight.click(goRightFun).mouseenter(function(){
		clearInterval(s_i_v);
	}).mouseleave(function(){
		s_i_v = setInterval(goRightFun, 3000);
	});
	function defauleSort(n){
		if (n > 0) {
			var jo = cardObj.c2;
			cardObj.c2 = cardObj.c1;
			cardObj.c1 = cardObj.c0;
			cardObj.c0 = jo;
		} else {
			var jo = cardObj.c0;
			cardObj.c0 = cardObj.c1;
			cardObj.c1 = cardObj.c2;
			cardObj.c2 = jo;
		}
	}
	function goLeftFun(){
		cardObj.c0.animate({marginLeft:m},t);
		cardObj.c1.animate({marginLeft:-m},t,function(){$(this).hide();});
		cardObj.c2.show().animate({marginLeft:0},t);
		defauleSort(-1);
	}
	function goRightFun(){
		cardObj.c0.show().animate({marginLeft:0},t);
		cardObj.c1.animate({marginLeft:m},t,function(){$(this).hide();});
		cardObj.c2.animate({marginLeft:-m},t);
		defauleSort(1);
	}
	
}