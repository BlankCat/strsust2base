<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%   
response.setHeader("Pragma","No-cache");    
response.setHeader("Cache-Control","no-cache");    
response.setDateHeader("Expires", -10);   
%>   
<rapid:override name="head">
	<title><%=DjSpecialty.TABLE_ALIAS%>编辑</title>
<script type="text/javascript" src="<c:url value="/widgets/ueditor/editor_config.js"/>"></script>
<script type="text/javascript" src="<c:url value="/widgets/ueditor/editor_all_min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/widgets/ueditor/themes/default/ueditor.css"/>">
<script>
$(function(){
   $(".b_btn").click(function(){
   var str=ue.getAllHtml();
	var start = str.indexOf("<body >");
	var end = str.indexOf("</body>");
    $("#activityspeSynopsis").val(str.substring(start+7,end));
     // 获取 canvas DOM 对象 
    
	var hasimg = document.getElementById("hasimg");
	if(hasimg!="0"){
		var canvas = document.getElementById("myCanvas");
	 
		// 获取Base64编码后的图像数据，格式是字符串 
		// "data:image/png;base64,"开头,需要在客户端或者服务器端将其去掉，后面的部分可以直接写入文件。 
		var dataurl = canvas.toDataURL("image/bmp,image/png,image/gif,image/jpeg,image/jpg"); 
		// 为安全 对URI进行编码 
		// data%3Aimage%2Fpng%3Bbase64%2C 开头 
		var imagedata = encodeURIComponent(dataurl); 
		$("#aimagedata").val(imagedata);
	}
    document.form.action = ctx+"/admin/DjSpecialty/save.do";
	document.form.target="_self";
	document.form.submit();
  })
});

// 参数，最大高度 
var MAX_HEIGHT = 200; 
// 渲染 
function render(src){ 
// 创建一个 Image 对象 
var image = new Image(); 
// 绑定 load 事件处理器，加载完成后执行 
image.onload = function(){ 
// 获取 canvas DOM 对象 
var canvas = document.getElementById("myCanvas"); 
// 如果高度超标 
if(image.height > MAX_HEIGHT) { 
// 宽度等比例缩放 *= 
image.width *= MAX_HEIGHT / image.height; 
image.height = MAX_HEIGHT; 
} 
// 获取 canvas的 2d 环境对象, 
// 可以理解Context是管理员，canvas是房子 
var ctx = canvas.getContext("2d"); 
// canvas清屏 
ctx.clearRect(0, 0, canvas.width, canvas.height); 
// 重置canvas宽高 
canvas.width = image.width; 
canvas.height = image.height; 
// 将图像绘制到canvas上 
ctx.drawImage(image, 0, 0, image.width, image.height); 
// !!! 注意，image 没有加入到 dom之中 
}; 
// 设置src属性，浏览器会自动加载。 
// 记住必须先绑定事件，才能设置src属性，否则会出同步问题。 
image.src = src; 
}; 
// 加载 图像文件(url路径) 
function loadImage(src){ 
// 过滤掉 非 image 类型的文件 
if(!src.type.match(/image.*/)){ 
if(window.console){ 
console.log("选择的文件类型不是图片: ", src.type); 
} else { 
window.confirm("只能选择图片文件"); 
} 
return; 
} 
$("#hasimg").val(1);
// 创建 FileReader 对象 并调用 render 函数来完成渲染. 
var reader = new FileReader(); 
// 绑定load事件自动回调函数 
reader.onload = function(e){ 
// 调用前面的 render 函数 
render(e.target.result); 
}; 
// 读取文件内容 
reader.readAsDataURL(src); 
}; 

function init(){ 
// 获取DOM元素对象 
var target = document.getElementById("drop-target"); 
// 阻止 dragover(拖到DOM元素上方) 事件传递 
target.addEventListener("dragover", function(e){e.preventDefault();}, true); 
// 拖动并放开鼠标的事件 
target.addEventListener("drop", function(e){ 
// 阻止默认事件，以及事件传播 
e.preventDefault(); 
// 调用前面的加载图像 函数，参数为dataTransfer对象的第一个文件 
loadImage(e.dataTransfer.files[0]); 
}, true); 

}; 
window.addEventListener("DOMContentLoaded", function() { 
// 
init(); 
},false); 
</script> 
</rapid:override>
<rapid:override name="content">
	<s:form method="post" id="form" name="form">
		<input id="submit" name="submit" type="submit" value="提交" class="b_btn"/>
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialty/list.do'"/>
		<input type="submit" value="预览" class="c_btn" />
		<s:hidden id="activityspeSynopsis" name="activityspeSynopsis" value=""/>
		<s:hidden id="hasimg" name="hasimg" value="0"/>
		<s:hidden id="aimagedata" name="aimagedata" value=""/>

		<table class="formTable">
		<%@ include file="form_include.jsp" %> 
		</table>
	</s:form>


	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>
<%@ include file="base.jsp" %>
