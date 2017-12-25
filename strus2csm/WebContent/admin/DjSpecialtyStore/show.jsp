<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyStore信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyStore/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyStore/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="storeId" id="storeId" value="%{model.storeId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">课程id</td>	
				<td><s:property value="%{model.courseId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">所属专业</td>	
				<td><s:property value="%{model.speId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">所属分组</td>	
				<td><s:property value="%{model.groupId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">在分组中的排序</td>	
				<td><s:property value="%{model.courseOrder}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>