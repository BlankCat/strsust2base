$(function() {
	loadDialog();
	var username = $("#csDetail_username").val();
	if(username!=null&&$.trim(username)){
		//评论框字数控制
		strLenCalc($("#c_textarea"), 'checklen', 200, 'beyond', 'send_btn');
		$("#c_textarea").keyup(function(){
			strLenCalc($(this), 'checklen', 200, 'beyond', 'send_btn');
		});
	}
	//分享按钮
	$('.share_box').bind({
		'mouseenter': function(){
			$(this).find('.icons').stop(true, false).animate({'width':'160px'});
		}
	});
	
	$('.float_box').unbind().bind({
		'mouseleave': function(){
			$(this).find('.icons').stop(true, false).animate({'width':'0px'});
		}
	});
	
	//评论
	comment();
	//赞
	liked();
	//收藏
	collect();
	//购买
	buyLesson();
	
	$('.intro_ctx_3 .intro_article [style]').attr('style','');
	$('.intro_ctx_2 .s_block [style]').attr('style','');
});

function loadDialog(){
	var courseid = $("#csDetail_id").val();
	//购买对话框
	$('#scoreDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '账户信息',
		width: 380,
		buttons: {
			"购买": function () {
		    	$(this).dialog("close");
		    	$('#buyingWindow').dialog('open');
				$.get(ctx+"/member/DjStucourse/saveByCsList.do",
					{
						courseid: courseid,
						type:$('.type').val(),
						time: new Date().getTime()
					},
					function(data){	
						$('#buyingWindow').dialog("close");
						if(data==1) {
							$("#buyLesson").attr("class","buy_lesson alreadyBuy_button");
							$("#buyLesson").unbind("click");
							$("#buyLesson").text("已购买");
							$('.collect').hide();
							$('#buySuccessDialogWindow').dialog('open');
						}
						if(data==0) {
							$('#buyFailDialogWindow').dialog('open');
						}	
					}
				);
		    },
		    "取消": function () {
		    	$(this).dialog("close");
		    }
	    }
	});

	//购买成功提示
	$('#buySuccessDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '购买成功',
		width: 380,
		buttons: {
		    "确定": function () {
		    	$(this).dialog("close");
		    }
	    }
	});
	
	//购买失败提示
	$('#buyFailDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '余额不足',
		width: 380,
		buttons: {
			"确定": function () {
				$(this).dialog("close");
			}
		}
	});
	
	//购买中提示
	$('#buyingWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '购买中',
		width: 380
	});
	
	//登陆提示
	$('#loginHintWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '请先登录',
		width: 380,
		buttons:{
			"确定": function () {
				$(this).dialog("close");
			}
		}
	});
	
	//收藏成功提示
	$('#collectSuccessWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '收藏成功',
		width: 380,
		buttons:{
			"确定": function () {
				$(this).dialog("close");
			}
		}
	});
		

	//评论成功提示
	$('#commentSuccessWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '评论成功',
		width: 380,
		buttons:{
			"确定": function () {
				var pageNumber =$('#pageNumber').val();	
				location.href="schoolLessonDetail.do?courseId="+courseid+"&pageNumber="+pageNumber;
				$(this).dialog("close");
			}
		}
	});
	//赞成功!
	$('#likeSuccessWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '赞',
		width: 380,
		buttons:{
			"确定": function () {
				$(this).dialog("close");
			}
		}
	});
	
	//取消赞成功!
	$('#likedSuccessWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '取消赞',
		width: 380,
		buttons:{
			"确定": function () {
				$(this).dialog("close");
			}
		}
	});
	
	//未填评论
	$('#commentEmptyWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '评论',
		width: 380,
		buttons:{
			"确定": function () {
				$('#c_textarea').focus();
				$(this).dialog("close");
			}
		}
	});
	//评论超过100字
	$('#commentLengthWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '评论',
		width: 380,
		buttons:{
			"确定": function () {
				$('#c_textarea').focus();
				$(this).dialog("close");
			}
		}
	});
}

function collect(){
	var courseid = $("#csDetail_id").val();
	var username = $("#csDetail_username").val();
	
		$(".collect_button").click(function(){
			if(username==null||$.trim(username)==""){
				$("#loginHintWindow").dialog("open");
			}else{
				$.get(ctx+"/member/DjShoppingcart/addToShoppingCart.do", { courseid: courseid, time: new Date().getTime() },
					function(data){
						$("#collectSuccessWindow").dialog("open");
						$(".collect_button").attr("class","collect collected_button hidden").unbind("click").text("已收藏");
				});
			}
	});
	
}

function buyLesson(){
	var courseid = $("#csDetail_id").val();
	//购买按钮
	$(".buy_button").click(function(){
		var username = $("#csDetail_username").val();
		if(username==null||$.trim(username)==""){
			$("#loginHintWindow").dialog("open");
		}else{
			$.get(ctx+"/member/DjUser/getMoney.do", {time: new Date().getTime(),type:2 },function(data){
				//获取信息后展示账户余额和本科需要的钱
				
				var s = $('.buy_button').attr("class");
				var money = data.split(",");
				if(-1 !=s.indexOf("jifen") ){
					var price = $(".csPrice").text();
					$(".amount").html(money[1]);
					$(".score_info").hide();
					$(".price").html(price);
					$(".type").val(1);
					$(".warninfo").hide();
				}else{ 
					if(money[0]==0){
						var price = $(".csPrice").text();
						$(".amount").html(money[1]);
						$(".score_info").hide();
						$(".price").html(price);
						$(".type").val(1);
						$(".warninfo").hide();
					}else{
						var price = $(".price").text();
						$(".amount").html(money[0]);
						$(".score_info1").hide();
						$(".type").val("0");
						if(money[0]-price>0){
							$(".warninfo").hide();
						}
					}
				}$('#scoreDialogWindow').dialog('open');
				});
		}
	});
}






function comment(){
	$('#send_btn').click(function(){
		var content = $('#c_textarea').val();
		var courseId = $('#courseId').val();
		var pageNumber =$('#pageNumber').val();
		if(content==null||$.trim(content)==""){
			$("#commentEmptyWindow").dialog("open");
			$('#c_textarea').focus();
		}else if(content.length>100){
			$('#commentLengthWindow').dialog("open");
			$('#c_textarea').focus();
		}else{
			$.post('ajaxmember/o_comment.do',{'content':content,'courseId':courseId},function(data){
				//$("#commentSuccessWindow").dialog("open");
				location.href="schoolLessonDetail.do?courseId="+courseId+"&pageNumber="+pageNumber;
			});
		}
	});
}

function liked(){
	var courseId = $("#csDetail_id").val();
	var likedValue = $("#liked").val();
	if(likedValue=="true"){
		$('.priase_link').hide();
		$('.priase_link_liked').show();
	}else if(likedValue=="false"){
		$('.priase_link').show();
		$('.priase_link_liked').hide();
	}
	$('.priase_link').click(function(){
		//赞
		$.post('ajaxmember/o_like.do',{'csId':courseId},function(data){
			$('.liked_num').text($('.like_num').text()*1+1);
			$('.like_num').text($('.like_num').text()*1+1);
			$('.priase_link').hide();
			$('.priase_link_liked').show();
			//$('#likeSuccessWindow').dialog("open"); 弹窗
		});
	});
	
	$('.priase_link_liked').click(function(){
		//取消赞
		$.post('ajaxmember/o_unlike.do',{'csId':courseId},function(data){
			$('.like_num').text($('.liked_num').text()*1-1);
			$('.liked_num').text($('.liked_num').text()*1-1);
			$('.priase_link').show();
			$('.priase_link_liked').hide();
			//$('#likedSuccessWindow').dialog("open"); 弹窗
		});
	});
}



function userImgError(img){
	if(img!=null){
		img.src=ctx+"/styles/images/noavatar_middle.png";
		img.onerror=null;
	}
}


function csImgError(csImg){
	if(csImg!=null){
		csImg.src=ctx+"/styles/images/courseDefault.png?i="+Math.random();
		csImg.onerror=null;
	}
}

