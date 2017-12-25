<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyCart信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyCart/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyCart/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="cartId" id="cartId" value="%{model.cartId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">收藏人 account_id</td>	
				<td><s:property value="%{model.ownAccout}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课id</td>	
				<td><s:property value="%{model.specsId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">收藏时间</td>	
				<td><s:property value="%{model.addTimeString}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>