<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DjSpecialty.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/admin/DjSpecialty/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td>
						<s:textfield label="专业前缀"    id="speNamePrefix" name="speNamePrefix" maxlength="100"  />
						<s:textfield label="专业名称"    id="speName" name="speName" maxlength="200"  />
						<s:textfield label="专业后缀"    id="speNameSuffix" name="speNameSuffix" maxlength="100"  />
					</td>
				</tr>	
				<tr>	
					<td>
					<s:select 
						label="所属行业"  
						list="#{'0':'律师学院','1':'司法鉴定','2':'金融学院','3':'公证学院','4':'企业学院','5':'高等院校','6':'司法考试','7':'事业社团','8':'政府法务','9':'公检法纪','10':'居民法务','11':'村民法务','12':'申请执业','13':'仲裁学院','14':'基层法工','15':'青少年'}"
						name="speDomain" 
						id = "speDomain"  >
					</s:select>
					</td>
				</tr>	
				<tr>	
					<td>
						<s:radio label="显示状态" 		
								 list="#{0:'隐藏',1:'展示'}" 
								 id="spe_display" 
								 name="spe_display" >	
						</s:radio>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialty/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/admin/DjSpecialty/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/admin/DjSpecialty/delete.do','items',document.forms.queryForm)"/>
		<div>
	</div>
	
	<div class="gridTable">
		共搜索到<font color="red" size="3">${totalRows}</font>条符合条件的记录。
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th>操作</th>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="spe_name_prefix" >专业前缀</th>
				<th sortColumn="spe_name" >专业名称</th>
				<th sortColumn="spe_name_suffix" >专业后缀</th>
				<th sortColumn="spe_lesson" >课时</th>
				<th sortColumn="spe_price" >价格</th>
				<!-- <th sortColumn="spe_synopsis" >简介</th> -->
				<!-- <th sortColumn="spe_content" >内容</th> -->
				<!-- <th sortColumn="spe_img" >图片</th> -->
				<!-- <th sortColumn="spe_status" >状态：前台是否需要展示，默认0不需要1展示</th>  -->
				<!-- <th sortColumn="spe_order" >排序</th>
				<th sortColumn="spe_addtime" >添加时间</th> -->
				<!-- <th sortColumn="spe_pre_title" >序言标题</th>
				<th sortColumn="spe_pre_content" >序言内容</th> -->
				<!-- <th sortColumn="spe_contents" >课程目录</th>
				<th sortColumn="spe_posc_title" >后记标题</th>
				<th sortColumn="spe_posc_content" >后记内容</th>
				<th sortColumn="spe_browseCount" >浏览数</th>
				<th sortColumn="spe_collectionCount" >收藏数</th>
				<th sortColumn="spe_createName" >管理人</th>
				<th sortColumn="spe_firstSpell" >专业名称首字母拼音缩写</th>
				<th sortColumn="spe_fullSpell" >名称拼音</th>
				<th sortColumn="spe_historyClassSchoolId" >历史开班id</th>
				<th sortColumn="spe_historyClassSchoolInfo" >历史开班情况描述详情</th>
				<th sortColumn="spe_img_height" >图片高度</th>
				<th sortColumn="spe_img_width" >图片宽</th>
				<th sortColumn="spe_planLength" >计划时长或学期(天)学期，总时间（分钟）</th>
				<th sortColumn="spe_signupCount" >学过人数，报名数</th>
				<th sortColumn="spe_star" >星级</th>
				<th sortColumn="spe_synopsisInfo" >摘要</th>
				<th sortColumn="spe_teachersId" >师资id集合信息，多个id有逗号，隔开</th>
				<th sortColumn="spe_teachersInfo" >师资队伍信息描述</th> 
				<th sortColumn="spe_type" >专业所属类型id</th>
				<th sortColumn="spe_typeInfo" >所属类型专业所属类型名称</th>
				<th sortColumn="spe_cat_id" >专业课分类id，关联dj_specialty_cat的主键</th>-->
				<th sortColumn="spe_domain"> 所属行业</th>
				<!-- <th sortColumn="spe_comments_num" >评论次数</th>
				<th sortColumn="spe_love_num" >点赞数</th>
				<th sortColumn="spe_tj_order" >推荐专业课 >0表示推荐该专业课</th> -->
				<th sortColumn="spe_display" >显示状态</th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>
					<a href="${ctx}/admin/DjSpecialty/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/admin/DjSpecialty/edit.do?id=${item.id}&">修改</a>
					<a href="${ctx}/admin/DjSpecialtyGroup/list.do?specialtyId=${item.id}&">专业分组</a>
<!-- 					<a href="${ctx}/admin/DjSchoolclass/specialty/list.do?scSepecialtyId=${item.id}&">班次信息</a> -->
				</td>
				<td align="center">${page.thisPageFirstElementNumber + status.index}</td>
				<td align="center"><input type="checkbox" name="items" value="id=${item.id}&"></td>
				<td align="center"><c:out value='${item.speNamePrefix}'/>&nbsp;</td>
				<td align="center"><c:out value='${item.speName}'/>&nbsp;</td>
				<td align="center" ><c:out value='${item.speNameSuffix}'/>&nbsp;</td>
				<td align="center" ><c:out value='${item.speLesson}'/>&nbsp;</td>
				<td align="center" ><c:out value='${item.spePrice}￥'/>&nbsp;</td>
				<td align="center" >
					<c:if test="${item.speDomain == 0}">律师学院</c:if>
					<c:if test="${item.speDomain == 1}">司法鉴定</c:if>
					<c:if test="${item.speDomain == 2}">金融学院</c:if>
					<c:if test="${item.speDomain == 3}">公证学院</c:if>
					<c:if test="${item.speDomain == 4}">企业学院</c:if>
					<c:if test="${item.speDomain == 5}">高等院校</c:if>
					<c:if test="${item.speDomain == 6}">司法考试</c:if>
					<c:if test="${item.speDomain == 7}">事业社团</c:if>
					<c:if test="${item.speDomain == 8}">政府法务</c:if>
					<c:if test="${item.speDomain == 9}">公检法纪</c:if>
					<c:if test="${item.speDomain == 10}">居民法务</c:if>
					<c:if test="${item.speDomain == 11}">村民法务</c:if>
					<c:if test="${item.speDomain == 12}">申请执业</c:if>
					<c:if test="${item.speDomain == 13}">仲裁学院</c:if>
					<c:if test="${item.speDomain == 14}">基层法工</c:if>
					<c:if test="${item.speDomain == 15}">青少年</c:if>
					&nbsp;
				</td>
				<td align="center" >
					<c:if test="${item.speDisplay == 1}">显示</c:if>
					<c:if test="${item.speDisplay == 0}">隐藏</c:if>
					&nbsp;
				</td>
				<td>
					<a href="${ctx}/admin/DjSpecialty/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/admin/DjSpecialty/edit.do?id=${item.id}&">修改</a>
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

