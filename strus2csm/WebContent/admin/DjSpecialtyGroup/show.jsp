<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyGroup信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyGroup/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyGroup/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">分组名称</td>	
				<td><s:property value="%{model.groupName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">排序字段</td>	
				<td><s:property value="%{model.groupOrder}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">分组所属专业</td>	
				<td><s:property value="%{model.specialtyId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>