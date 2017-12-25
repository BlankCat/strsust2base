<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="状态 ： -1 取消点赞  1 点赞" key="state" value="%{model.state}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="专业课类型，扩充字段" key="specsType" value="%{model.specsType}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="点赞人账号id" key="ownAccout" value="%{model.ownAccout}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="专业课id" key="specsId" value="%{model.specsId}" cssClass="validate-integer " required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			创建时间:
		</td>	
		<td>
		<input value="${model.createTimeString}" onclick="WdatePicker({dateFmt:'<%=DjSpecialtyLove.FORMAT_CREATE_TIME%>'})" id="createTimeString" name="createTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
