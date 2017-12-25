<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="cartId" name="cartId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="收藏人 account_id" key="ownAccout" value="%{model.ownAccout}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="专业课id" key="specsId" value="%{model.specsId}" cssClass="validate-integer " required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			收藏时间:
		</td>	
		<td>
		<input value="${model.addTimeString}" onclick="WdatePicker({dateFmt:'<%=DjSpecialtyCart.FORMAT_ADD_TIME%>'})" id="addTimeString" name="addTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
