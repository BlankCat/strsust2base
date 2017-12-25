<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>您已经退出，请重新登录！</title>
<style type="text/css">
	A {	COLOR: #007ab7; TEXT-DECORATION: none}
	A:hover {COLOR: #007ab7; TEXT-DECORATION: none}
	A:hover {COLOR: #de1d6a}
	.hidehr {DISPLAY: none}
	.show12 {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 5px 0px; PADDING-TOP: 0px}
	.show13 {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 5px 0px; PADDING-TOP: 0px}
	.show12 A {	BORDER-RIGHT: #bfdeed 1px solid; PADDING-RIGHT: 6px; BORDER-TOP: #bfdeed 1px solid; DISPLAY: inline-block; PADDING-LEFT: 6px; BACKGROUND: #d8ebf4; PADDING-BOTTOM: 2px; OVERFLOW: hidden; BORDER-LEFT: #bfdeed 1px solid; LINE-HEIGHT: 17px; PADDING-TOP: 2px; BORDER-BOTTOM: #bfdeed 1px solid; HEIGHT: 16px}
	.show13 A {	BORDER-RIGHT: #bfdeed 1px solid; PADDING-RIGHT: 6px; BORDER-TOP: #bfdeed 1px solid; DISPLAY: inline-block; PADDING-LEFT: 6px; BACKGROUND: #d8ebf4; PADDING-BOTTOM: 2px; OVERFLOW: hidden; BORDER-LEFT: #bfdeed 1px solid; LINE-HEIGHT: 17px; PADDING-TOP: 2px; BORDER-BOTTOM: #bfdeed 1px solid; HEIGHT: 16px}
	.show12 A:hover {	BORDER-RIGHT: #ea5e96 1px solid; BORDER-TOP: #ea5e96 1px solid; BACKGROUND: #fce8f0; BORDER-LEFT: #ea5e96 1px solid; COLOR: #de1d6a; BORDER-BOTTOM: #ea5e96 1px solid; TEXT-DECORATION: none}
	.show13 A:hover {	BORDER-RIGHT: #ea5e96 1px solid; BORDER-TOP: #ea5e96 1px solid; BACKGROUND: #fce8f0; BORDER-LEFT: #ea5e96 1px solid; COLOR: #de1d6a; BORDER-BOTTOM: #ea5e96 1px solid; TEXT-DECORATION: none}
	.show12 A {	FONT-WEIGHT: normal; FONT-SIZE: 12px}
	.show13 A {	BORDER-RIGHT: #ed268c 1px solid; BORDER-TOP: #ed268c 1px solid; BACKGROUND: #dd137b; BORDER-LEFT: #ed268c 1px solid; COLOR: #fff; BORDER-BOTTOM: #ed268c 1px solid}
	.img404 {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(<c:url value="/styles/images/photoback.gif"/>) no-repeat left top; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 80px; PADDING-TOP: 0px; POSITION: relative; HEIGHT: 90px}
	H2 {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 16px; FLOAT: left; PADDING-BOTTOM: 25px; MARGIN: 0px; WIDTH: 80%; LINE-HEIGHT: 0; PADDING-TOP: 25px; BORDER-BOTTOM: #ccc 1px solid; POSITION: relative}
	H3.wearesorry {	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 10px; LEFT: 117px; PADDING-BOTTOM: 0px; MARGIN: 0px; COLOR: #ccc; LINE-HEIGHT: 10px; PADDING-TOP: 0px; POSITION: absolute; TOP: 70px}
	.content {	CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 13px; LEFT: 80px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 80%; LINE-HEIGHT: 19px; PADDING-TOP: 0px; POSITION: relative; TOP: -30px}
	.content UL {PADDING-RIGHT: 35px; PADDING-LEFT: 35px; PADDING-BOTTOM: 20px; MARGIN: 0px; PADDING-TOP: 10px}
	.show12 UL {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px 0px 0px 20px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none}
	.show14 UL LI {	MARGIN-BOTTOM: 5px}
</style>
</head>

<body>
<h1 class=hidehr></h1>
<div class=img404>　</div>
<h2>抱歉，您已经退出学习系统，请重新登录听课！</h2>
<h3 class=wearesorry></h3>
<div class=content>我们发现您已经从点睛学习平台注销。最可能的原因是： 
  <ul>
	  <li>您点击了"安全退出"链接，从系统注销。</li>
	  <li>您长时间没有进行操作、系统已经自动退出。</li>
	  <li>您已从其他浏览器进行登录、此浏览器的账号自动退出。</li>
  </ul>
<strong>点击以下链接继续浏览点睛网的其它内容</strong>（<a href="http://www.zfwx.com/" target="_blank">http://www.zfwx.com/</a>）： 
<div class=show14>
<ul>
  <li><a title=返回点睛网首页 href="${ctx }/index.html">返回听课平台首页</a> </li>
  <li><a title=去律师网群看看 href="http://wq.zfwlxt.com/">去律师网群看看</a></li>
</ul></div>
<a href="<%= basePath%>login.jsp" target=_self>重新登录</a>~~ </div>
<span 
style="VISIBIliTY: hidden"></span>

</body>
</html>