<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyLove信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyLove/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyLove/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">状态 ： -1 取消点赞  1 点赞</td>	
				<td><s:property value="%{model.state}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课类型，扩充字段</td>	
				<td><s:property value="%{model.specsType}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">点赞人账号id</td>	
				<td><s:property value="%{model.ownAccout}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课id</td>	
				<td><s:property value="%{model.specsId}" /></td>
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