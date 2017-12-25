<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>menu</title>
<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language='javascript'>
	var curopenItem = '1';
</script>
<script language="javascript" type="text/javascript"
	src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
	<table width='99%' height="100%" border='0' cellspacing='0'
		cellpadding='0'>
		<tr>
			<td style='padding-left:3px;padding-top:8px' valign="top">
				<!-- Item 1 Strat -->
				<dl class='bitem'>
					<dt onClick='showHide("items1_1")'>
						<b>面授活动</b>
					</dt>
					<dd style='display:block' class='sitem' id='items1_1'>
						<ul class='sitemu'>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='<%=basePath%>admin/DjActivity/activity/create.do'>发布面授</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='<%=basePath%>admin/DjActivity/activity/list.do'>活动列表</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityOrder/activity/list.do'
												target='main'>订单列表</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityTicket/activity/list.do'
												target='main'>电子票</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityDiscuss/activity/list.do'
												target='main'>讨论信息</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='<%=basePath%>admin/DjRecommand/activity/list.do'
												target='main'>推荐课程</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityDianke/activity/list.do'
												target='main'>点课列表</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityDianke/activity/listfanzhuan.do'
												target='main'>我要点课</a>
										</div>
									</div>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a
												href='<%=basePath%>admin/DjActivityDianke/activity/listcollection.do'
												target='main'>课程收集</a>
										</div>
									</div>
								</li>
						</ul>
					</dd>
				</dl>
				<!-- 机构面授动态审核 -->
				<!-- Item 2 Strat -->
				<dl class='bitem'>
					<dt onClick='showHide("items1_2")'>
						<b>机构面授审核</b>
					</dt>
					<dd style='display:block' class='sitem' id='items1_2'>
						<ul class='sitemu'>
							<li>
								<div class='items'>
									<div class='fllct'>
										<a href='<%=basePath%>admin/DjActivitySH/activity/list.do'>面授审核</a>
									</div>
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