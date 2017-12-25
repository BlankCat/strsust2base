<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="storeId" name="storeId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="课程id" key="courseId" value="%{model.courseId}" cssClass="required validate-integer " required="true" />
	
	
	<s:textfield label="所属专业" key="speId" value="%{model.speId}" cssClass="required validate-integer " required="true" />
	
	
	<s:textfield label="所属分组" key="groupId" value="%{model.groupId}" cssClass="required validate-integer " required="true" />
	
	
	<s:textfield label="在分组中的排序" key="courseOrder" value="%{model.courseOrder}" cssClass="validate-integer max-value-2147483647" required="false" />
	
