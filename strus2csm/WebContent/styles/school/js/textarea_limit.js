/**
 * how to use
 * 
 * $(function() {
 * 	$("textarea").keyup(function(){
 * 		strLenCalc($(this), 'checklen', 80, 'beyond');
 * 	});
 * });
 *
 **/
function strLenCalc(obj, checklen, maxlen, beyondClass, submitBtnId) {
	var v = obj.val()
	, charlen = 0
	, maxlen = !maxlen ? 200 : maxlen
	, curlen = maxlen
	, len = v.length;
	for(var i = 0; i < v.length; i++) {
		if(v.charCodeAt(i) < 0 || v.charCodeAt(i) > 255) {
			curlen -= 1;
		}
	}
	if(curlen >= len) {
		$('#'+checklen).html('<span>还可以输入</span><strong>' + Math.floor((curlen-len)/2) + '</strong><span>字</span>');
		$('#'+submitBtnId).prop('disabled', false).removeClass('nosend_btn').addClass('send_btn');
	} else {
		$('#'+checklen).html('<span>已超出</span><strong class="' + beyondClass + '">' + Math.ceil((len-curlen)/2) + '</strong><span>字</span>');
		$('#'+submitBtnId).prop("disabled", true).removeClass('send_btn').addClass('nosend_btn');
	}
}