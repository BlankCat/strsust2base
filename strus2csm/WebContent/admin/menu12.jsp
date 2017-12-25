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
        <dt onClick='showHide("items1_1")'><b>专业教室</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyCat/list.do' target='main'>专业分类</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialty/list.do' target='main'>专业列表</a></div>
              </div>
            </li> 
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyGroup/list.do' target='main'>专业分组</a></div>
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyStore/list.do' target='main'>分组课程</a></div>
              </div>
            </li>                          
            <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyCart/list.do' target='main'>专业收藏</a></div>
              </div>
            </li>
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyLove/list.do' target='main'>专业点赞</a></div>
              </div>
            </li>     
             <li>
              <div class='items'>
                <div class='fllct'><a href='<%=basePath %>/admin/DjSpecialtyComments/list.do' target='main'>专业评论审核</a></div>
              </div>
            </li>                                  
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>admin/DjSchoolclass/specialty/create.do'>添加班次</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjSchoolclass/specialty/list.do' target='main'>班次发布</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjSignup/specialty/list.do' target='main'>学员报名表</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjMyschoolclass/specialty/list.do' target='main'>开班列表</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--               <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjNotebook/specialty/create.do?userId=' target='main'>记笔记</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjNotebook/specialty/list.do?userId=' target='main'>我的笔记</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--               <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjProblemrecord/specialty/create.do?userId=' target='main'>提问题</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjProblemrecord/specialty/list.do?userId=' target='main'>我的问题</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--               <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjExam/create.do?userId=' target='main'>创建试卷</a></div> -->
<!--               </div> -->
<!--             </li>  -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjExam/list.do?userId=' target='main'>试卷管理</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjExamStudentHistory/extension/list.do' target='main'>我的成绩</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjFacetoface/specialty/list.do?userId=' target='main'>面授公告</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjFaceSignup/specialty/list.do' target='main'>面授签到</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjStudyinfo/specialty/list.do' target='main'>学习进度</a></div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li> -->
<!--               <div class='items'> -->
<!--                 <div class='fllct'><a href='<%=basePath %>/admin/DjCompletelicences/specialty/list.do' target='main'>结业管理</a></div> -->
<!--               </div> -->
<!--             </li> -->
           </ul>
        </dd>
      </dl>
     
	  </td>
  </tr>
</table>
</body>
</html>