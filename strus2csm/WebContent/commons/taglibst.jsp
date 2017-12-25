<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="zfwxPath" value="http://www.zfwx.com/zfwx"/>
<c:set var="zfwxaPath" value="http://admin.zfwx.com:8088/zfwx"/>
<c:set var="casPath" value="http://cas.zfwlxt.com:8280/casServer"/>
<c:set var="bbsPath" value="http://bbs.zfwx.com:8080/jeebbs2"/>
<c:set var="wqPath" value="http://wq.zfwx.com/admin/index.do"/>
<c:set var="nowtime" value="<%=System.currentTimeMillis()%>"></c:set>
<c:set var="nowdate" value="<%=new Date()%>"></c:set>
<sec:authentication property="name" var="userName"/>
<c:if test="${userName eq 'anonymousUser'}">
	<c:set var="userName" value=""/>
</c:if>
<script type="text/javascript">
//<!--
var ctx ="${ctx}";
var zfwxPath ="${zfwxPath}";
var wqPath ="${wqPath}";
var casPath ="${casPath}";
var bbsPath ="${bbsPath}";
var zfwxaPath ="${zfwxaPath}";
//-->
</script>



