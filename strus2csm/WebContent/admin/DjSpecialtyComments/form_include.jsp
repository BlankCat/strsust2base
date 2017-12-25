<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="commentId" name="commentId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="评论类型 （扩充字段）" key="type" value="%{model.type}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="专业课id" key="specsId" value="%{model.specsId}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="评论者账号ID" key="ownAccount" value="%{model.ownAccount}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="回复某条评论id" key="replyId" value="%{model.replyId}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="评论的标题" key="commentTitle" value="%{model.commentTitle}" cssClass="" required="false" />
	
	
	<s:textfield label="评论的内容" key="commentContent" value="%{model.commentContent}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			评论时间:
		</td>	
		<td>
		<input value="${model.commentTimeString}" onclick="WdatePicker({dateFmt:'<%=DjSpecialtyComments.FORMAT_COMMENT_TIME%>'})" id="commentTimeString" name="commentTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="ip地址" key="commentIp" value="%{model.commentIp}" cssClass="" required="false" />
	
	
	<s:textfield label="审核状态- 0：未审核  1：审核通过  2 审核未通过" key="checkState" value="%{model.checkState}" cssClass="validate-integer max-value-2147483647" required="false" />
	
