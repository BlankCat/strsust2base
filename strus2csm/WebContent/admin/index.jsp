<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>点睛听课平台</title>
<style>
body
{
  scrollbar-base-color:#C0D586;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:DEEFC6;
}
</style>
<script language="JavaScript">
document.oncontextmenu=new Function("event.returnValue=false;");
document.onselectstart=new Function("event.returnValue=false;");
</script>

</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame  src="${ctx}/admin/DjTop.do" name="topFrame" scrolling="no">
  <frameset cols="180,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
  	<!-- 如果当前管理员是【超级管理员】，显示【组织&角色】菜单 -->
    	<frame src="menu1.jsp" noresize name="menu" scrolling="yes">
    	 <frame src="main.jsp" noresize name="main" scrolling="yes">
    <!-- 如果当前管理员是【系统管理员,财务/市场管理员】，显示【会员&订单】菜单 -->
    	<frame src="menu2.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【课程管理员】，显示【课程&选课】菜单 -->
    	<frame src="menu4.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【面授管理员】，显示【面授】菜单 -->
    	<frame src="menu8.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【律所管理员】，显示【学习统计】菜单 -->
    	<frame src="menu5.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【律所管理员】，显示【学习统计】菜单 -->
    	<frame src="menu6.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【律所管理员】，显示【学习统计】菜单 -->
    	<frame src="menu7.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【律所管理员】，显示【学习统计】菜单 -->
    	<frame src="menu9.jsp" noresize name="menu" scrolling="yes">
    <!-- 如果当前管理员是【充值卡管理员】，显示【充值卡管理】菜单 -->
    	<frame src="menu10.jsp" noresize name="menu" scrolling="yes">
     <!-- 如果当前管理员是【商城管理员】，显示【商城管理员】菜单 -->
		<frame src="menu14.jsp" noresize name="menu" scrolling="yes">
		<frame src="menu12.jsp" noresize name="menu" scrolling="yes">
		<frame src="menu13.jsp" noresize name="menu" scrolling="yes">
   
   </frameset>
</frameset>
<noframes>
	<body>您的浏览器不支持框架！</body>
</noframes>
</html>