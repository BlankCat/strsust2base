<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.springframework.security.core.userdetails.*"  %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ include file="/commons/taglibs.jsp" %>	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>main</title>
<base target="_self">
<link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body leftmargin="8" topmargin='8'>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div style='float:left'> <img height="14" src="skin/images/frame/book1.gif" width="20" />&nbsp;欢迎使用点睛听课平台。 </div>
      <div style='float:right;padding-right:8px;'>
        <!--  //保留接口  -->
      </div></td>
  </tr>
  <tr>
    <td height="1" background="skin/images/frame/sp_bg.gif" style='padding:0px'></td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'><span>消息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>&nbsp;</td>
  </tr>
</table>
 
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
  <tr>
    <td colspan="2" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'>
    	<div style='float:left'><span>快捷操作</span></div>
    	<div style='float:right;padding-right:10px;'></div>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" colspan="2" align="center" valign="bottom"><table width="100%" border="0" cellspacing="1" cellpadding="1">
        <tr>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="85%" valign="bottom"><div class='icoitem'>
            <!--
            <div class='ico'><img src='skin/images/frame/addnews.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjCourse/list.do'><u>课程列表</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/menuarrow.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjStucourse/list.do'><u>选课管理</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjOrder/list.do'><u>订单管理</u></a></div>
            </div>
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjMember/list.do'><u>会员管理</u></a></div>
            </div>
            -->
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/refresh.jsp'><u>刷新权限资源缓存</u></a></div>
            </div></td>
        </tr>
      </table></td>
  </tr>  
</table>

<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
  <tr bgcolor="#EEF4EA">
    <td colspan="2" background="skin/images/frame/wbg.gif" class='title'><span>系统基本信息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" bgcolor="#FFFFFF">您的权限：</td>
    <td width="75%" bgcolor="#FFFFFF">
	</td>
  </tr> 
  <tr bgcolor="#FFFFFF">
    <td>软件版本信息：</td>
    <td>BlankCat 2017</td>
  </tr> 
 
  <tr bgcolor="#FFFFFF">
    <td width="25%" >在线课程数：</td> <td><s:property value="%{#us.getCourseCount()}"/>门&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" >&nbsp;</td> <td>&nbsp;</td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
  <tr bgcolor="#EEF4EA">
    <td colspan="2" background="skin/images/frame/wbg.gif" class='title'><span>**导航</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="32">**门户：</td>
    <td><a href="http://blankcat.top/myIndex/" target="_blank"><u>http://blankcat.top/myIndex/</u></a></td>
  </tr>
</table>
  
</body>
</html>