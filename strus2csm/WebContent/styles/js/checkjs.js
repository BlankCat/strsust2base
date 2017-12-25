
/**
 * 非空验证
 * @param {} id 组件名称
 * @param {} name 提示消息内容
 * @return {Boolean}
 */
function checkjs(id, name) {

	if (id.value == "") {
		alert(name);
		return false;
	} else {
		return true;
	}
}

/**
 * 验证邮箱
 * @param {} mail 邮箱名称
 * @return {Boolean}
 */
function ismail(mail) {
	if(mail.value!=""){
	 var filter  = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
	 if (filter.test(mail.value)) 
		 return true;
	 else {
	 alert('您的电子邮件格式不正确');
	 return false;
	 }
	 return true;
		}
	} 
/**
 * 
 * 验证电话或者手机
 * @param {} phone 电话名称
 * @param {} name 提示消息内容
 * @return {Boolean}
 */
function checkphone(phone,name){
	
	var filter=/^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|((\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))|((\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))))$/;
	 if (!phone.value.match(filter)) 
	 {
	 alert(name);
	 return false;
	}
	return true;

}
		/**
		 * 验证邮政编码
		 * @param {} code 邮政编码名称
		 * @param {} name 提示消息内容
		 * @return {Boolean}
		 */
function checkcode(code,name){

var filter=/^(\d{6})$/;
 if (!code.value.match(filter)) 
 {
 alert(name);
 return false;
}
return true;

}