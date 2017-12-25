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
      <!-- Item 2 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>统计分析</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/MemList/list.jsp' target='main'>学员统计</a></div>
              </div>
              </li>
              <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/CouList/list.jsp' target='main'>课程统计</a></div>
              </div>
              </li>
              <!-- <li>
                yangshuai 2014-1-3 该功能无法正常使用已屏蔽 -->
              <%-- <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/MorgList/list.jsp' target='main'>组织统计</a></div>
              </div> 

              </li>
              --%>
          </ul>
        </dd>
      </dl>
      <!-- Item 2 End -->
       <!-- Item 3 Start -->

    <dl class='bitem'>
        <dt onClick='showHide("items2_3")'><b>客户沟通</b></dt>
        <dd style='display:block' class='sitem' id='items2_3'>
          <ul class='sitemu'>                             
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/Message/sendMessage.jsp' target='main'>消息推送</a></div>
              </div>
          </li>  
               <li>
	              <div class='items'>
	                <div class='fllct'><a href='<%=basePath %>admin/DjQuestionText/list.do' target='main'>文字反馈</a></div>
	              </div>
	           </li>
	           <li>
	              <div class='items'>
	                <div class='fllct'><a href='<%=basePath %>admin/DjQuestionVoice/list.do' target='main'>语音反馈</a></div>
	              </div>
              </li>
              <li>
				  <div class='items'>
					<div class='fllct'><a href='<%=basePath %>admin/DjComment/list.do' target='main'>评论管理</a></div>
				  </div>
              </li>
                
              <li>
				  <div class='items'>
					<div class='fllct'><a href='<%=basePath %>admin/Message/Management.jsp' target='main'>消息管理</a></div>
				  </div>
              </li>             
              <li>
				  <div class='items'>
					<div class='fllct'><a href='<%=basePath %>admin/DjApply/list.do' target='main'>申请管理</a></div>
				  </div>
              </li> 
 
              <li>
				  <div class='items'>
					<div class='fllct'><a href='<%=basePath %>admin/DjTjApplyOrg/list.do' target='main'>机构推广</a></div>
				  </div>
              </li> 

            <li>
              <div class='items'>
					<div class='fllct'><a href='<%=basePath %>admin/DjSuggest/list.do' target='main'>在线建议</a></div>
              </div>
            </li>  
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='<%=basePath%>admin/DjSmpReport/list.do' target='main'>简报管理</a>
										</div>
									</div>
								</li>
	     </ul>
	  </dd>
    </dl>
    <!-- Item 3 End -->
     <dl class='bitem'>
        <dt onClick='showHide("items2_4")'><b>问题反馈</b></dt>
        <dd style='display:block' class='sitem' id='items2_4'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjOrgQuestion/list.do'>待处理的反馈</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjOrgQuestion/list.do?status=1'>已处理的反馈</a></div>
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