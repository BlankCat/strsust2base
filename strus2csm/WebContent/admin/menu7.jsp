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
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>日志管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjOnlineuser/list.do' target='main'>在线用户</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjOnlineuser/loginList.do' target='main'>登录日志</a></div>
              </div>
            </li>
            <!-- 如果是【超级管理员】 显示【操作日志】菜单 -->
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjLoginfo/list.do' target='main'>活动日志</a></div>
              </div>
            </li><li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjUserlogs/list.do' target='main'>操作日志</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjAppDeviceInfos/list.do' target='main'>设备信息</a></div>
              </div>
            </li> 
          </ul>
        </dd>
      </dl>
      <!-- 如果是【超级管理员】 显示【数据字典和系统参数】菜单 -->

      <!-- Item 3 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>系统管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>         
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjDictdata/list.do' target='main'>数据字典</a></div>
              </div>
              </li>
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjSysprop/list.do' target='main'>系统参数</a></div>
              </div>
              </li>
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjAdvertising/list.do' target='main'>广告管理</a></div>
              </div>
              </li> 

              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjBrandcourse/list.do' target='main'>品牌课程</a></div>
              </div>
              </li>            
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjTag/list.do' target='main'>适应人群</a></div>
              </div>
              </li>             
	     	  <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjRecommand/activity/list.do' target='main'>推荐课程</a></div>
              </div>
             </li>
	     	  <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjService/list.do' target='main'>协会菜单配置</a></div>
              </div>
             </li>
	     	  <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjUserMenu/list.do' target='main'>开通账户信息</a></div>
              </div>
             </li>
	     <li>
              <div class='items'>
                <div class='fllct'><a href="http://admin.zfwx.com:80/admin/DjSmpReport/list.do" target="main">简报管理</a></div>
              </div>
             </li>
          </ul>
        </dd>
      </dl>
      <dl class='bitem'>
        <dt onClick='showHide("items3_1")'><b>计划管理</b></dt>
        <dd style='display:block' class='sitem' id='items3_1'>
          <ul class='sitemu'> 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjPlan/list.do' target='main'>每周计划</a></div>
              </div>
            </li>  
          </ul>
       
          <ul class='sitemu'> 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjDailySum/list.do' target='main'>每天日报</a></div>
              </div>
            </li>  
          </ul>
        </dd>
      </dl>
      <dl class='bitem'>
        <dt onClick='showHide("items4_1")'><b>首读跟读</b></dt>
        <dd style='display:block' class='sitem' id='items4_1'>
          <ul class='sitemu'> 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCsShare/list.do' target='main'>首读跟读</a></div>
              </div>
            </li>  
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCsShareRecord/list.do' target='main'>分享记录</a></div>
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