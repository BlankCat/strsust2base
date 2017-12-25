<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>menu</title>
<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language='javascript'>var curopenItem = '1';</script>
<script language="javascript" type="text/javascript" src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">	
	<!-- Item 1 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>组织管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMemorg/list.do' target='main'>组织列表</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMemorg/import.jsp' target='main'>导入组织</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjOrgset/list.do' target='main'>组织考核</a></div>
              </div>
            </li>    
          	<li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCooperator/list.do' target='main'>合作单位</a></div>
              </div>
              </li>    
 
              </ul>                
            </dd>
            </dl>
            <dl class='bitem'>
	        <dt onClick='showHide("items1_10")'><b>机构网校</b></dt>
	        <dd style='display:block' class='sitem' id='items1_10'>
       		 <ul class='sitemu'>       
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjWx/lswxlist.do' >推荐网校</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCourse/lswxlist.do' >推荐课程</a></div>
              </div>
            </li>
			<li>
				<div class='items'>
					<div class='fllct'><a href='<%=basePath%>admin/DjActivitySH/activity/list.do'>面授审核</a></div>
				</div>
			</li>            
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjNotice/lswxlist.do' >培训动态</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjAdvertising/list.do?adPosition=7' >面授广告</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjAdvertising/list.do?adPosition=3' >动态广告</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjApply/lswxlist.do' >合作申请</a></div>
              </div>
            </li>
              </ul>                
            </dd>
            </dl>
            <dl class='bitem'>
           	<dt onClick='showHide("items1_2")'><b>网校管理</b></dt>
       		 <dd style='display:block' class='sitem' id='items1_2'>  
       		 <ul class='sitemu'>       
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjWx/list.do' >网校列表</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjWx/create.do' >添加网校</a></div>
              </div>
            </li>
            <%-- 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/staticpages.jsp'>页面静态</a></div>
              </div>
            </li>
            --%> 
	         <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjNoticeCategory/list.do' target='main'>公告分类</a></div>
              </div>
              </li>
               <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjNotice/list.do' target='main'>公告列表</a></div>
              </div>
              </li> 
            </ul>
             </dd>
            </dl>
             <dl class='bitem'>
           <dt onClick='showHide("items1_3")'><b>排行榜管理</b></dt>
       		 <dd style='display:block' class='sitem' id='items1_3'>  
       		 <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjTkphbDay/list.do' >日排行榜</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjTkphbWeek/list.do' >周排行榜</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjTkphbWeekTj/list.do' >周排行榜推广</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjTkphbMonth/list.do' >月排行榜</a></div>
              </div>
            </li>                
          </ul>
	        </dd>
	      </dl>
      <!-- Item 1 End -->
      <!-- Item 2 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>角色管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
         	 <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjResc/list.do' >系统资源</a></div>
              </div>
              </li>
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjRole/create.do' >新建角色</a></div>
              </div>
              </li>
               <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjRole/list.do' >角色列表</a></div>
              </div>
              </li>
          </ul>
        </dd>
      </dl>
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>公告审核</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>     
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjWx/list.do' >网校推荐</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjWx/create.do' >添加网校</a></div>
              </div>
            </li>
            <%-- 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/staticpages.jsp'>页面静态</a></div>
              </div>
            </li>
            --%> 
	         <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjNoticeCategory/list.do' target='main'>公告分类</a></div>
              </div>
              </li>
               <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjNotice/list.do' target='main'>公告列表</a></div>
              </div>
              </li> 
            </ul>
             </dd>
            </dl>
      <!-- Item 2 End -->
	  </td>
  </tr>
</table>
</body>
</html>