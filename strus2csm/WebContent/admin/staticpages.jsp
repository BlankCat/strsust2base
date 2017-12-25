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
	<%@ include file="/commons/meta.jsp" %>
</head>
<body leftmargin="8" topmargin='8'>
<%@ include file="/commons/messages.jsp" %>
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
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
  <tr>
    <td colspan="2" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'>
    	<div style='float:left'><span>静态化页面</span></div>
    	<div style='float:right;padding-right:10px;'></div>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" colspan="2" align="center" valign="bottom"><table width="100%" border="0" cellspacing="1" cellpadding="1">
        <tr>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>            
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>WxToHtml'><u>省市律协网校页面静态化</u></a></div>
            </div>
          </div>
          </td>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>   
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>html.do' target="_blank"><u>首页、排行榜、师资库页面静态化</u></a></div>
            </div>
          </div>
          </td>
        </tr>
      </table></td>
  </tr>  
</table>

<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
  <tr>
    <td colspan="2" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'>
    	<div style='float:left'><span>生成统计数据</span></div>
    	<div style='float:right;padding-right:10px;'></div>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" colspan="2" align="center" valign="bottom"><table width="100%" border="0" cellspacing="1" cellpadding="1">
        <tr>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>            
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjMemorg/memorgCountMaker.do'><u>组织学员数生成</u></a></div>
            </div>
          </div>
          </td>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>   
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjCscategory/courseCountMaker.do'><u>课程分类课程数生成</u></a></div>
            </div>
          </div>
          </td>
        </tr>
         <tr>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>            
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>updateOrgAllBelongs.do'><u>组织数据调整</u></a></div>
            </div>
          </div>
          </td>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>   
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>updateMemberOrgIds.do'><u>学员数据调整</u></a></div>
            </div>
          </div>
          </td>
        </tr>
         <tr>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>            
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'><a href='<%=basePath %>admin/DjStucourse/deleteRepeatSelectedCourse.do'><u>重复选课记录清理</u></a></div>
            </div>
          </div>
          </td>
          <td width="15%" height="31" align="center"><img src="skin/images/frame/qc.gif" width="90" height="30" /></td>
          <td width="35%" valign="bottom">
          <div class='icoitem'>   
            <div class='icoitem'>
              <div class='ico'><img src='skin/images/frame/manage1.gif' width='16' height='16' /></div>
              <div class='txt'></div>
            </div>
          </div>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<div style="margin-left: 20px; color: red;">
说明：<br/>
1、组织学员数生成：生成各个组织下的学员人数。<br/>
2、课程分类课程数生成：生成各个课程分类下的课程数量。<br/>
3、组织数据调整：生成组织表中各个组织的上属组织。<br/>
4、学员数据调整：生成DjMember中各个学员所属组织及上属组织。
</div>


</body>
</html>