<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DjSpecialtyCat.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/admin/DjSpecialtyCat/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td>
						<s:textfield label="分类名称"    id="catName" name="catName" maxlength="50"  />
					</td>
				</tr>	
				<tr>	
					<td>
						<s:select label="所属行业"  list="#{'0':'律师学院','1':'司法鉴定','2':'金融学院','3':'公证学院','4':'企业学院','5':'高等院校','6':'司法考试','7':'事业社团','8':'政府法务','9':'公检法纪','10':'居民法务','11':'村民法务','12':'申请执业','13':'仲裁学院','14':'基层法工','15':'青少年'}"
						  name="domain" id = "domain"  ></s:select>
					</td>
				</tr>	
				<tr>	
					<td>
						<s:radio label="分类状态" 		list="#{0:'隐藏',1:'展示'}" id="isDisplay" name="isDisplay" >	</s:radio>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyCat/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialtyCat/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/admin/DjSpecialtyCat/delete.do','items',document.forms.queryForm)"/>
		<div>
	</div>
	
	<div class="gridTable">
		共搜索到<font color="red" size="3">${totalRows}</font>条符合条件的记录。
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th> 序号</th>
				<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<!-- <th sortColumn="type_id" >类型id（做扩展用）</th>
				<th sortColumn="pid" >父id</th> -->
				<th sortColumn="cat_name" >分类名称</th>
				<th sortColumn="cat_icon" >icon</th>
				<!-- <th sortColumn="cat_intro" >分类介绍</th> -->
				<th sortColumn="domain" >所属行业</th>
				<th sortColumn="specs_count" >专业课总数量</th>
				<th sortColumn="specs_price" >专业课总价格</th>
				<!-- <th sortColumn="specs_sort" >排序</th> -->
				<th sortColumn="is_display" >显示状态</th>
				<!-- <th sortColumn="is_default" >是否是默认创建0：默认 1:自定义</th>
				<th sortColumn="create_account" >创建账号</th>
				<th sortColumn="create_time" >创建时间</th> -->
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td align="center" >${page.thisPageFirstElementNumber + status.index}</td>
				<td align="center" ><input type="checkbox" name="items" value="catId=${item.catId}&"></td>
				<td align="center"><c:out value='${item.catName}'/>&nbsp;</td>
				<td align="center" title="<c:out value='${item.catIcon}'/>">
					<img src="http://www.zfwx.com/<c:out value='${item.catIcon}'/>" height="20px" >&nbsp;
				</td>
				<td align="center">
					<c:if test="${item.domain == 0}">律师学院</c:if>
					<c:if test="${item.domain == 1}">司法鉴定</c:if>
					<c:if test="${item.domain == 2}">金融学院</c:if>
					<c:if test="${item.domain == 3}">公证学院</c:if>
					<c:if test="${item.domain == 4}">企业学院</c:if>
					<c:if test="${item.domain == 5}">高等院校</c:if>
					<c:if test="${item.domain == 6}">司法考试</c:if>
					<c:if test="${item.domain == 7}">事业社团</c:if>
					<c:if test="${item.domain == 8}">政府法务</c:if>
					<c:if test="${item.domain == 9}">公检法纪</c:if>
					<c:if test="${item.domain == 10}">居民法务</c:if>
					<c:if test="${item.domain == 11}">村民法务</c:if>
					<c:if test="${item.domain == 12}">申请执业</c:if>
					<c:if test="${item.domain == 13}">仲裁学院</c:if>
					<c:if test="${item.domain == 14}">基层法工</c:if>
					<c:if test="${item.domain == 15}">青少年</c:if>
					&nbsp;
				</td>	
				<td align="center">
				<c:out value='${item.specsCount}'/>&nbsp;
				</td>
				<td align="center"><c:out value='${item.specsPrice}'/>&nbsp;</td>
				<td align="center">
					<c:if test="${item.isDisplay == 1}">显示</c:if>
					<c:if test="${item.isDisplay == 0}">隐藏</c:if>
					&nbsp;
				</td>	
				<td align="center">
					<a href="${ctx}/admin/DjSpecialtyCat/show.do?catId=${item.catId}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/admin/DjSpecialtyCat/edit.do?catId=${item.catId}&">修改</a>
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

