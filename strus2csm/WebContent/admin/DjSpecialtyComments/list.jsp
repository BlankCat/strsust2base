<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DjSpecialtyComments.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/admin/DjSpecialtyComments/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td>
						<s:textfield label="专业课id"    id="specsId" name="specsId" maxlength="19"  />
						<s:textfield label="评论者账号ID"    id="ownAccount" name="ownAccount" maxlength="19"  />
					</td>
				</tr>	
				<tr>	
					<td>
						<s:radio label="审核状态" 		list="#{0:'未审核',1:'审核通过',2:' 审核未通过'}" id="checkState" name="checkState" >	</s:radio>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyComments/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyComments/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/admin/DjSpecialtyComments/delete.do','items',document.forms.queryForm)"/>
			<input type="button" class="stdButton" style="width:80px" value="批量通过" onclick="batchVerify('${ctx}/admin/DjSpecialtyComments/plupapprov.do','items',document.forms.queryForm)"/>
			<input type="button" class="stdButton" style="width:80px" value="批量拒绝" onclick="batchVerify('${ctx}/admin/DjSpecialtyComments/pldownapprov.do','items',document.forms.queryForm)"/>
		
		<div>
	</div>
	
	<div class="gridTable">
		共搜索到<font color="red" size="3">${totalRows}</font>条符合条件的记录。
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
			<!-- 	<th sortColumn="type" >评论类型 （扩充字段）</th> -->
				<th sortColumn="specs_id" >专业课id</th>
				<th sortColumn="own_account" >评论者账号ID</th>
				<!-- <th sortColumn="reply_id" >回复某条评论id</th> -->
			<!-- 	<th sortColumn="comment_title" >评论的标题</th> -->
				<th sortColumn="comment_content" >评论的内容</th>
				<th sortColumn="comment_time" >评论时间</th>
			<!-- 	<th sortColumn="comment_ip" >ip地址</th> -->
				<th sortColumn="check_state" >审核状态- 0：未审核  1：审核通过  2 审核未通过</th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="commentId=${item.commentId}&"></td>
				
			<%-- 	<td><c:out value='${item.type}'/>&nbsp;</td> --%>
				<td><c:out value='${item.specsId}'/>&nbsp;</td>
				<td><c:out value='${item.ownAccount}'/>&nbsp;</td>
				<%-- <td><c:out value='${item.replyId}'/>&nbsp;</td>
				<td><c:out value='${item.commentTitle}'/>&nbsp;</td> --%>
				<td><c:out value='${item.commentContent}'/>&nbsp;</td>
				<td><c:out value='${item.commentTimeString}'/>&nbsp;</td>
			<%-- 	<td><c:out value='${item.commentIp}'/>&nbsp;</td> --%>
				<td  align="center">
					<c:if test="${item.checkState == 0}">未审核</c:if>
					<c:if test="${item.checkState == 1}">通过</c:if>
					<c:if test="${item.checkState == 2}">拒绝</c:if>
				</td>
				<td align="center">
					<a href="${ctx}/admin/DjSpecialtyComments/show.do?commentId=${item.commentId}&">查看</a>&nbsp;/
					<a href="${ctx}/admin/DjSpecialtyComments/edit.do?commentId=${item.commentId}&">修改</a>&nbsp;/
					<a href="${ctx}/admin/DjSpecialtyComments/update.do?commentId=${item.commentId}&checkState=1">通过</a>&nbsp;/
					<a href="${ctx}/admin/DjSpecialtyComments/update.do?commentId=${item.commentId}&checkState=2">拒绝</a>
				</td>
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

