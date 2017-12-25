<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp" %>
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
	  <!-- 如果是【超级管理员或者系统管理员】 显示【会员管理】菜单 -->
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>会员管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
           <%--  <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/create.do' target='main'>新建会员</a></div>
              </div>
            </li> --%>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/list.do' target='main'>会员列表</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/addMember.do' target='main'>开通个人VIP</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/orgOpenVip.do' target='main'>组织开通个人VIP</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/addGroupMember.do' target='main'>开通团体会员</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/orgOpenGroupVip.do' target='main'>组织开通团体会员</a></div>
              </div>
            </li>
           <%--  <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/import.jsp' target='main'>导入用户</a></div>
              </div>
            </li> --%>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjMember/changeUser.jsp' target='main'>切换用户</a></div>
              </div>
            </li>
 
          </ul>
        </dd>
      </dl>
      <!-- Item 1 End -->
      
      <!-- Item 2 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>订单管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
           
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjShoppingcart/list.do' target='main'>收藏夹</a></div>
              </div>
              </li>
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjOrder/list.do' target='main'>订单列表</a></div>
              </div>
              </li>
              
          </ul>
        </dd>
      </dl>
	  </td>
  </tr>
</table>
</body>
</html>