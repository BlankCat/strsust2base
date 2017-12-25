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
        <dt onClick='showHide("items2_1")'><b>课程管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCscategory/list.do' target='main'>课程分类</a></div>
              </div>
           </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCourse/create.do' target='main'>新建课程</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCourse/list.do' target='main'>课程列表</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjCourse/recopyselectcs.jsp' target='main'>批量迁移</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjExam/list.do' target='main'>考试列表</a></div>
              </div>
         </li>

               <li>
              <div class='items'>
               <div class='fllct'><a href='<%=basePath %>admin/DjExamQuestion/list.do' target='main'>试题列表</a></div> 
              </div>
             
              </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucw/editTimes.jsp' target='main'>听课次数调整</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucw/editTimes_first.jsp' target='main'>批量次数调整</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjComment/list.do' target='main'>课程评论审核</a></div>
              </div>
          </li>
          </ul>
        </dd>
      </dl>
                  
      <!-- Item 2 End -->
      <sec:authorize ifAnyGranted="ROLE_KCGL,ROLE_XADMIN,ROLE_ALL,ROLE_KEFUCHAOGUAN">
      <!-- Item 4 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>审核管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjLisrea/list.do?isUpload=1&lisreaStatus=-1' target='main'>点读文章审核</a></div>
              </div>
          </li>
          <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjVerifyUser/list.do' target='main'>点读审核管理</a></div>
              </div>
          </li>
          </ul>
        </dd>
      </dl>
      <!-- Item 4 End -->
      </sec:authorize>
      <sec:authorize ifAnyGranted="ROLE_KCGL,ROLE_XADMIN,ROLE_ALL,ROLE_KEFUCHAOGUAN"> 
      <!-- Item 3 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>开课管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>           
          	<li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucourse/list.jsp' target='main'>开课列表</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucourse/batchSelectCourseForMembers.do' target='main'>批量开课</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjOrgcourse/list.do' target='main'>组织开课</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucourse/toProfessional.do' target='main'>分类课程开课</a></div>
              </div>
           </li>
           <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>admin/DjStucourse/toSpefessional.do' target='main'>专业课程开课</a></div>
              </div>
           </li>
          </ul>
        </dd>
      </dl>
     </sec:authorize>
      <!-- Item 3 End -->
	  </td>
  </tr>

</table>
</body>
</html>