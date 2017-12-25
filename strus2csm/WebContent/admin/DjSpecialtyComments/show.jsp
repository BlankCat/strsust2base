<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialtyComments信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialtyComments/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialtyComments/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="commentId" id="commentId" value="%{model.commentId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel">评论类型 （扩充字段）</td>	
				<td><s:property value="%{model.type}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课id</td>	
				<td><s:property value="%{model.specsId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">评论者账号ID</td>	
				<td><s:property value="%{model.ownAccount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">回复某条评论id</td>	
				<td><s:property value="%{model.replyId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">评论的标题</td>	
				<td><s:property value="%{model.commentTitle}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">评论的内容</td>	
				<td><s:property value="%{model.commentContent}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">评论时间</td>	
				<td><s:property value="%{model.commentTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">ip地址</td>	
				<td><s:property value="%{model.commentIp}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">审核状态- 0：未审核  1：审核通过  2 审核未通过</td>	
				<td><s:property value="%{model.checkState}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>