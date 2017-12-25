<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="catId" name="catId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="类型id（做扩展用）" key="typeId" value="%{model.typeId}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="父id" key="pid" value="%{model.pid}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="分类名称" key="catName" value="%{model.catName}" cssClass="" required="false" />
	
	
	<s:textfield label="分类图片路径" key="catIcon" value="%{model.catIcon}" cssClass="" required="false" />
	
	
	<s:textfield label="分类介绍" key="catIntro" value="%{model.catIntro}" cssClass="" required="false" />
	
	
	<s:textfield label="'0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务'," key="domain" value="%{model.domain}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="专业课数量" key="specsCount" value="%{model.specsCount}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="专业课总价格" key="specsPrice" value="%{model.specsPrice}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="专业课分类排序" key="specsSort" value="%{model.specsSort}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="状态  0：隐藏  1：展示" key="isDisplay" value="%{model.isDisplay}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="是否是默认创建0：默认 1:自定义" key="isDefault" value="%{model.isDefault}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="创建账号" key="createAccount" value="%{model.createAccount}" cssClass="validate-integer " required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			创建时间:
		</td>	
		<td>
		<input value="${model.createTimeString}" onclick="WdatePicker({dateFmt:'<%=DjSpecialtyCat.FORMAT_CREATE_TIME%>'})" id="createTimeString" name="createTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
