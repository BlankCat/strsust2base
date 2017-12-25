$(function() {
	
	//调用已选答案绑定事件函数
	checkedClick($('.answer_checked'));
	//调用未选答案绑定事件函数
	noCheckedClick($('.answer_nochecked'));
	var timeLimit = $("#timeLimit").val();
	countDown(timeLimit+":00");
	
	//为右侧交卷按钮绑定事件
	$('.right_submit').unbind('mouseenter mouseleave click').bind({
		'mouseenter': function() {
			$(this).removeClass('right_submit').addClass('right_submit_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('right_submit_hover').addClass('right_submit');
		},
		'click': submitExam //单击调用交卷函数
	});
	
	//为右侧保存试卷按钮绑定事件
	$('.right_save').unbind('mouseenter mouseleave click').bind({
		'mouseenter': function() {
			$(this).removeClass('right_save').addClass('right_save_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('right_save_hover').addClass('right_save');
		},
		'click': saveExam //单击调用保存试卷函数
	});
	
	//为下方交卷按钮绑定事件
	$('#submit_exam').unbind('mouseenter mouseleave click').bind({
		'mouseenter': function() {
			$(this).removeClass('save_exam').addClass('save_exam_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('save_exam_hover').addClass('save_exam');
		},
		'click': submitExam //单击调用交卷函数
	});
	
	//为下方返回按钮绑定事件
	$('#return_exam').unbind('mouseenter mouseleave click').bind({
		'mouseenter': function() {
			$(this).removeClass('return_exam').addClass('return_exam_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('return_exam_hover').addClass('return_exam');
		},
		'click': returnExam //单击调用返回考试函数
	});
	
	//为试题上下文li绑定事件
	$('.questions_list_li').unbind('mouseenter mouseleave').bind({
		'mouseenter': function() {
			$(this).removeClass('questions_list_li').addClass('questions_list_li_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('questions_list_li_hover').addClass('questions_list_li');
		}
	});
	
});

//交卷函数
function submitExam() {
	var hasEmpty = 0;
	$.each($('.answer_checkbox_content'), function() {
		if ($(this).find('input:checkbox:checked').size() == 0) {
			$(this).parent().parent().css('background-color','#fcc');
			hasEmpty ++;
		}
	});
	if (hasEmpty == 0) {
		$("#examform").submit();
	} else {
		alert('请检查试卷，您有未答题目，不可提交！')
	}
}

//保存试卷函数
function saveExam() {
	$("#examform").submit();
}

//返回考试函数
function returnExam() {
	window.location.href = 'examQuestions.html';
}

//为已选答案绑定事件函数
function checkedClick(jqueryObj, checkedLength) {
	jqueryObj.unbind('mouseenter mouseleave click').bind({
		'click': function() {
			//改变答案选中状态
			$(this).removeClass('answer_checked').addClass('answer_nochecked');
			//调用试题chackbox赋值函数
			clickChangeCheckboxVal($(this), false);
			//调用为未选答案绑定事件函数
			noCheckedClick($(this));
		}
	});
}

//为未选答案绑定事件函数
function noCheckedClick(jqueryObj, checkedLength) {
	jqueryObj.unbind('mouseenter mouseleave click').bind({
		'mouseenter': function() {
			$(this).removeClass('answer_nochecked').addClass('answer_hover');
		},
		'mouseleave': function() {
			$(this).removeClass('answer_hover').addClass('answer_nochecked');
		},
		'click': function() {
			//获取习题类型标记checkedLength：1-单选，2~4-最多选中个数
			var checkedLength = $(this).parent().parent().find('.checkedCount').val();
			//以选中个数
			var checkedCount = $(this).parent().find('.answer_checked').length;
			if (checkedLength == 1) {
				//单选
				if ($(this).parent().find('.answer_checked').length > 0) {
					var otherCheckedAnswerElement = $(this).parent().find('.answer_checked').removeClass('answer_checked').addClass('answer_nochecked');
					clickChangeCheckboxVal(otherCheckedAnswerElement, false);
					noCheckedClick(otherCheckedAnswerElement);
				}
				$(this).removeClass('answer_nochecked answer_hover').addClass('answer_checked');
				clickChangeCheckboxVal($(this), true)
				checkedClick($(this));
			} else if (checkedLength > 1 && checkedCount == checkedLength) {
				//选择个数过多
				alert('本题最多可选择' + checkedCount + '个选项');
			} else {
				//多选
				$(this).removeClass('answer_nochecked answer_hover').addClass('answer_checked');
				clickChangeCheckboxVal($(this), true)
				checkedClick($(this));
			}
			$(this).parents('li').css('background-color','#fff');
		}
	});
}

//试题chackbox赋值函数
function clickChangeCheckboxVal(jqueryObj, checkedVal) {
	jqueryObj.hasClass('list_a') ? jqueryObj.parent().parent().find('.checkbox_a').attr('checked', checkedVal) : (jqueryObj.hasClass('list_b') ? jqueryObj.parent().parent().find('.checkbox_b').attr('checked', checkedVal) : (jqueryObj.hasClass('list_c') ? jqueryObj.parent().parent().find('.checkbox_c').attr('checked', checkedVal) : jqueryObj.parent().parent().find('.checkbox_d').attr('checked', checkedVal)));
}

//改变倒计时秒表图片
function changeTimePic(timeObj) {
	$('#mlt').attr('src','styles/exam/images/time/lt' + timeObj.minutesFirst + '.png');
	$('#mlb').attr('src','styles/exam/images/time/lb' + timeObj.minutesFirst + '.png');
	$('#mrt').attr('src','styles/exam/images/time/rt' + timeObj.minutesLast + '.png');
	$('#mrb').attr('src','styles/exam/images/time/rb' + timeObj.minutesLast + '.png');
	$('#slt').attr('src','styles/exam/images/time/lt' + timeObj.secondsFirst + '.png');
	$('#slb').attr('src','styles/exam/images/time/lb' + timeObj.secondsFirst + '.png');
	$('#srt').attr('src','styles/exam/images/time/rt' + timeObj.secondsLast + '.png');
	$('#srb').attr('src','styles/exam/images/time/rb' + timeObj.secondsLast + '.png');
}

//倒计时函数
function countDown(times) {

	//获取倒计时时间
	var minutes = times.split(':')[0];
	var seconds = times.split(':')[1];
	//调用改变时间函数，初始化倒计时秒表
	changeTime();
	
	//开始倒计时
	setInterval(changeTime, 1000);
	
	//改变时间函数
	function changeTime() {
		changeTimePic({
			minutesFirst: (minutes < 10 ? 0 : minutes.charAt(0)),
			minutesLast: (minutes < 10 ? minutes : minutes.charAt(1)),
			secondsFirst: (seconds < 10 ? 0 : seconds.charAt(0)),
			secondsLast: (seconds < 10 ? seconds : seconds.charAt(1))
		})
		if (seconds > 0) {
			seconds -= 1;
			seconds += '';
		} else if (minutes > 0) {
			minutes -= 1;
			minutes += '';
			seconds = '59';
		} else {
			//时间结束执行此代码
		}
	}
}
