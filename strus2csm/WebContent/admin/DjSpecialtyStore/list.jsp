<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DjSpecialtyStore.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/admin/DjSpecialtyStore/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td>
						<s:textfield label="课程id"    id="courseId" name="courseId" maxlength="19"  />
						<s:textfield label="所属专业"    id="speId" name="speId" maxlength="19"  />
						<s:textfield label="所属分组"    id="groupId" name="groupId" maxlength="19"  />
						<s:textfield label="在分组中的排序"    id="courseOrder" name="courseOrder" maxlength="10"  />
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyStore/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyStore/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/admin/DjSpecialtyStore/delete.do','items',document.forms.queryForm)"/>
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
				<th sortColumn="course_id" >课程id</th>
				<th sortColumn="spe_id" >所属专业</th>
				<th sortColumn="group_id" >所属分组</th>
				<th sortColumn="course_order" >在分组中的排序</th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="storeId=${item.storeId}&"></td>
				
				<td><c:out value='${item.courseId}'/>&nbsp;</td>
				<td><c:out value='${item.speId}'/>&nbsp;</td>
				<td><c:out value='${item.groupId}'/>&nbsp;</td>
				<td><c:out value='${item.courseOrder}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/admin/DjSpecialtyStore/show.do?storeId=${item.storeId}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/admin/DjSpecialtyStore/edit.do?storeId=${item.storeId}&">修改</a>
					<a href="${ctx}/admin/DjNotebook/specialty/list.do?courseId=${item.courseId}&">学习笔记</a>
					<a href="${ctx}/admin/DjProblemrecord/specialty/list.do?courseId=${item.courseId}&">我的问题</a>
					<a href="${ctx}/admin/DjExam/list.do?courseId=${item.courseId}&">模拟测试</a>
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

