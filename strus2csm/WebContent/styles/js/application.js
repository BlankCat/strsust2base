function disableSubmit(finalResult,submitButtonId) {
	if(finalResult) {
		document.getElementById(submitButtonId).disabled = true;
		return finalResult;
	}else {
		return finalResult;
	}
}

function batchDelete(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm($('#deleteConfirmMessage').val() || '确认要删除吗')){
        form.action = action;
        form.submit();
    }                       
}
function batchRefuse(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm($('#refuseConfirmMessage').val() || '确认要拒绝吗')){
        form.action = action;
        form.submit();
    }                       
}
function batchActivityTj(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm($('#tjConfirmMessage').val() || '确认要推荐吗')){
        form.action = action;
        form.submit();
    }                       
}
function saveBannerGoods(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
		alert('请选择要操作的对象!');
		return;
	}
	if (confirm($('#deleteConfirmMessage').val() || '确认要加入到Banner中吗')){
		form.action = action;
		form.submit();
	}                       
}
function batchinfo(action,checkboxName,form,info){
	if (!hasOneChecked(checkboxName)){
		alert('请选择要操作的对象!');
		return;
	}
	if (confirm(info)){
		form.action = action;
		form.submit();
	}                       
}
function saveActivityGoods(action,checkboxName,form){
	if (hasOneChecked(checkboxName)){
		if (confirm($('#deleteConfirmMessage').val() || '确认要加入到活动中吗')){
			form.action = action;
			form.submit();
		} 
	}
}

function savePkGoods(action,checkboxName,form){
	if (hasOneChecked(checkboxName)){
		if (confirm($('#deleteConfirmMessage').val() || '确认要加入到该包中吗')){
			form.action = action;
			form.submit();
		} 
	}
}



function batchVerify(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行[审核]操作?')){
        form.action = action;
        form.submit();
    }
}

function hasOneChecked(name){
    var items = document.getElementsByName(name);
    if (items.length > 0) {
        for (var i = 0; i < items.length; i++){
            if (items[i].checked == true){
                return true;
            }
        }
    } else {
        if (items.checked == true) {
            return true;
        }
    }
    return false;
}

function setAllCheckboxState(name,state) {
	var elms = document.getElementsByName(name);
	for(var i = 0; i < elms.length; i++) {
		elms[i].checked = state;
	}
}

function getReferenceForm(elm) {
	while(elm && elm.tagName != 'BODY') {
		if(elm.tagName == 'FORM') return elm;
		elm = elm.parentNode;
	}
	return null;
}
function checkjs1(id, name) {

	if (id.value == "") {
		alert(name);
		return false;
	} else {
		return true;
	}
}