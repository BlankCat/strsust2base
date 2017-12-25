<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="${ctx }/admin/skin/css/base.css" rel="stylesheet" type="text/css">
<title>top</title>
<script language='javascript'>
var preFrameW = '206,*';
var FrameHide = 0;
var curStyle = 1;
var totalItem = 12;
function ChangeMenu(way){
	var addwidth = 10;
	var fcol = top.document.all.btFrame.cols;
	if(way==1) addwidth = 10;
	else if(way==-1) addwidth = -10;
	else if(way==0){
		if(FrameHide == 0){
			preFrameW = top.document.all.btFrame.cols;
			top.document.all.btFrame.cols = '0,*';
			FrameHide = 1;
			return;
		}else{
			top.document.all.btFrame.cols = preFrameW;
			FrameHide = 0;
			return;
		}
	}
	fcols = fcol.split(',');
	fcols[0] = parseInt(fcols[0]) + addwidth;
	top.document.all.btFrame.cols = fcols[0]+',*';
}


function mv(selobj,moveout,itemnum)
{
   if(itemnum==curStyle) return false;
   if(moveout=='m') selobj.className = 'itemsel';
   if(moveout=='o') selobj.className = 'item';
   return true;
}

function changeSel(itemnum)
{
  curStyle = itemnum;
  for(i=1;i<=totalItem;i++){
     if(document.getElementById('item'+i)) document.getElementById('item'+i).className='item';
  }
  document.getElementById('item'+itemnum).className='itemsel';
}

</script>
<style>
body { padding:0px; margin:0px; }
#tpa {
	color: #009933;
	margin:0px;
	padding:0px;
	float:right;
	padding-right:10px;
}

#tpa dd {
	margin:0px;
	padding:0px;
	float:left;
	margin-right:2px;
}

#tpa dd.ditem {
	margin-right:8px;
}

#tpa dd.img {
  padding-top:6px;
}

div.item
{
  text-align:center;
	background:url(${ctx }/admin/skin/images/frame/topitembg.gif) 0px 3px no-repeat;
	width:82px;
	height:26px;
	line-height:28px;
}

.itemsel {
  width:80px;
  text-align:center;
  background:#226411;
	border-left:1px solid #c5f097;
	border-right:1px solid #c5f097;
	border-top:1px solid #c5f097;
	height:26px;
	line-height:28px;
}

*html .itemsel {
	height:26px;
	line-height:26px;
}

a:link,a:visited {
 text-decoration: underline;
}

.item a:link, .item a:visited {
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

.itemsel a:hover {
	color: #ffffff;
	font-weight: bold;
	border-bottom:2px solid #E9FC65;
}

.itemsel a:link, .itemsel a:visited {
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

.itemsel a:hover {
	color: #ffffff;
	border-bottom:2px solid #E9FC65;
}

.rmain {
  padding-left:10px;
  /* background:url(skin/images/frame/toprightbg.gif) no-repeat; */
}
</style>
</head>
 <script type="text/javascript">
	function operationTip(a,b,c){
	if(confirm(a)){
	window.open(b,c);
	}}</script>
<body bgColor='#ffffff'>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="${ctx }/admin/skin/images/frame/topbg.gif">
  <tr>
    <td width='20%' height="60"><font style="font-size: 20">**听课平台</font>&nbsp;${orgname}</td>
    <td width='80%' align="right" valign="bottom">
    	<table width="1200" border="0" cellspacing="0" cellpadding="0">      
      <tr>
      <td align="right" height="26" style="padding-right:10px;line-height:26px;">
        	您好： *** <span class="username"><sec:authentication property="name"/></span>，欢迎使用**听课平台！
        	[<a href="http://blankcat.top/myIndex/" target="_blank">**前台</a>]
        	[<a href="http://blankcat.top/myIndex/" target="_blank">**首页</a>]
        	[<a href="http://blankcat.top/myIndex/" target="_blank">**网群</a>]
<!--         	[<a href="http://blankcat.top/myIndex/" target="_blank">网站地图</a>] -->
        	[<a href="http://blankcat.top/myIndex/" target="_blank">帮助</a>]
  			[<a href="javascript:operationTip('确认退出吗','<%=basePath %>j_spring_security_exit_user','_top')">注销退出</a>]&nbsp;
  			[<a href="javascript:operationTip('确认退出吗','<%=basePath %>j_spring_cas_security_logout','_top')">注销退出</a>]&nbsp;
        	<%-- [<a href="javascript:operationTip('确认退出吗','<%=basePath%>j_spring_security_logout','_top')">
        	注销退出</a>]&nbsp; --%>
        	
      </td>
      </tr>
      <tr>
        <td align="right" height="34" class="rmain">
		<dl id="tpa">
		<dd class='img'><a href="javascript:ChangeMenu(-1);"><img vspace="5" src="${ctx }/admin/skin/images/frame/arrl.gif" border="0" width="5" height="8" alt="缩小左框架"  title="缩小左框架" /></a></dd>
		<dd class='img'><a href="javascript:ChangeMenu(0);"><img vspace="3" src="${ctx }/admin/skin/images/frame/arrfc.gif" border="0" width="12" height="12" alt="显示/隐藏左框架" title="显示/隐藏左框架" /></a></dd>
		<dd class='img' style="margin-right:10px;"><a href="javascript:ChangeMenu(1);"><img vspace="5" src="${ctx }/admin/skin/images/frame/arrr.gif" border="0" width="5" height="8" alt="增大左框架" title="增大左框架" /></a></dd>
		<%-- 
		<!-- 如果当前管理员是【超级管理员】，显示【组织&角色】菜单 -->
		<dd><div class='item' id='item12' onMouseMove="mv(this,'m',12);" onMouseOut="mv(this,'o',12);"><a href="${ctx}/admin/menu12.jsp" onclick="changeSel(12)" target="menu">专业教室管理</a></div></dd>
		 --%>
			<dd>
			<div class='item' id='item1' onMouseMove="mv(this,'move',1);" onMouseOut="mv(this,'o',1);">
				<a href="${ctx}/admin/menu1.jsp" onclick="changeSel(1)" target="menu">组织&角色</a>
			</div>
			</dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员，市场财务管理员】 显示【会员&订单】菜单 -->
			<dd><div class='item' id='item2' onMouseMove="mv(this,'m',2);" onMouseOut="mv(this,'o',2);">
			<a href="${ctx}/admin/menu2.jsp" onclick="changeSel(2)" target="menu">会员&订单</a></div></dd>
			<!-- 如果当前管理员是【超级管理员，系统管理员】，显示【电子卡】菜单 -->
			<%-- <dd><div class='item' id='item7' onMouseMove="mv(this,'m',7);" onMouseOut="mv(this,'o',7);">
			<a href="${ctx}/admin/menu3.jsp" onclick="changeSel(7)" target="menu">充值管理</a></div></dd> --%>
		<!-- 如果当前管理员是【超级管理员，系统管理员，课程管理员】，显示【课程&选课】菜单 -->
			<dd><div class='item' id='item3' onMouseMove="mv(this,'m',3);" onMouseOut="mv(this,'o',3);">
			<a href="${ctx}/admin/menu4.jsp" onclick="changeSel(3)" target="menu">课程&选课</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员，课程管理员，文库管理员】，显示【文库管理】菜单 -->
			<%-- <dd><div class='item' id='item12' onMouseMove="mv(this,'m',12);" onMouseOut="mv(this,'o',12);">
			<a href="${ctx}/admin/menu13.jsp" onclick="changeSel(12)" target="menu">文库管理</a></div></dd> --%>
		<!-- 如果当前管理员是【超级管理员，系统管理员，律所管理员】，显示【统计分析】菜单 -->
			<dd><div class='item' id='item4' onMouseMove="mv(this,'m',4);" onMouseOut="mv(this,'o',4);">
			<a href="${ctx}/admin/menu5.jsp" onclick="changeSel(4)" target="menu">统计&反馈</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员，课程管理员】，显示【教师管理】菜单-->
			<dd><div class='item' id='item5' onMouseMove="mv(this,'m',5);" onMouseOut="mv(this,'o',5);">
			<a href="${ctx}/admin/menu6.jsp" onclick="changeSel(5)" target="menu">教师管理</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员】，显示【系统设置】菜单 -->
			<dd><div class='item' id='item6' onMouseMove="mv(this,'m',6);" onMouseOut="mv(this,'o',6);">
			<a href="${ctx}/admin/menu7.jsp" onclick="changeSel(6)" target="menu">系统设置</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员】，显示【面授课程】菜单 -->
			<dd><div class='item' id='item8' onMouseMove="mv(this,'m',8);" onMouseOut="mv(this,'o',8);">
			<a href="${ctx}/admin/menu8.jsp" onclick="changeSel(8)" target="menu">面授活动</a></div></dd>
			<dd><div class='item' id='item14' onMouseMove="mv(this,'m',14);" onMouseOut="mv(this,'o',14);">
			<a href="${ctx}/admin/menu14.jsp" onclick="changeSel(14)" target="menu">商城管理</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员】，显示【问题反馈】菜单 -->
			<dd><div class='item' id='item9' onMouseMove="mv(this,'m',9);" onMouseOut="mv(this,'o',9);">
			<a href="${ctx}/admin/menu9.jsp" onclick="changeSel(9)" target="menu">专业教室</a></div></dd>
		<!-- 如果当前管理员是【充值卡管理员】，显示【充值卡】菜单 -->
			<dd><div class='item' id='item10' onMouseMove="mv(this,'m',10);" onMouseOut="mv(this,'o',10);">
			<a href="${ctx}/admin/menu10.jsp" onclick="changeSel(10)" target="menu">实体卡管理</a></div></dd>

		<!-- -->
			<dd><div class='item' id='item11' onMouseMove="mv(this,'m',11);" onMouseOut="mv(this,'o',11);">
			<a href="${ctx}/admin/menu11.jsp" onclick="changeSel(11)" target="menu">邀请管理</a></div></dd>
		<!-- 如果当前管理员是【超级管理员，系统管理员】，显示【问题反馈】菜单 -->
			<dd><div class='item' id='item12' onMouseMove="mv(this,'m',12);" onMouseOut="mv(this,'o',12);">
			<a href="${ctx}/admin/menu12.jsp" onclick="changeSel(12)" target="menu">老专业教室</a></div></dd>
		</dl>
		</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>