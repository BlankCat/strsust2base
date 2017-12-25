<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyCat信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyCat/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyCat/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="catId" id="catId" value="%{model.catId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">类型id（做扩展用）</td>	
				<td><s:property value="%{model.typeId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">父id</td>	
				<td><s:property value="%{model.pid}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">分类名称</td>	
				<td><s:property value="%{model.catName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">分类图片路径</td>	
				<td><s:property value="%{model.catIcon}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">分类介绍</td>	
				<td><s:property value="%{model.catIntro}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">'0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务',</td>	
				<td><s:property value="%{model.domain}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课数量</td>	
				<td><s:property value="%{model.specsCount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课总价格</td>	
				<td><s:property value="%{model.specsPrice}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课分类排序</td>	
				<td><s:property value="%{model.specsSort}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">状态  0：隐藏  1：展示</td>	
				<td><s:property value="%{model.isDisplay}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">是否是默认创建0：默认 1:自定义</td>	
				<td><s:property value="%{model.isDefault}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">创建账号</td>	
				<td><s:property value="%{model.createAccount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">创建时间</td>	
				<td><s:property value="%{model.createTimeString}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>