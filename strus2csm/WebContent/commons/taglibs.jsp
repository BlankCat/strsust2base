<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%//用于实现jsp模板的继承关系,请查看:http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="requestpath" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="basePath" value="http://base.zfwlxt.com:9090/base"/>
<c:set var="zfwxPath" value="http://www.zfwx.com/zfwx"/>
<c:set var="sfjdPath" value="http://sfjd.zfwx.com/zfwx"/>
<c:set var="zfwxaPath" value="http://admin.zfwx.com:8088/zfwx"/>
<c:set var="casPath" value="http://cas.zfwlxt.com:8280/cas"/>
<c:set var="bbsPath" value="http://bbs.zfwx.com:8280/jeebbs2"/>
<c:set var="wqPath" value="http://wq.zfwx.com"/>
<c:set var="nowtime" value="<%=System.currentTimeMillis()%>"></c:set>
<c:set var="nowdate" value="<%=new Date()%>"></c:set>
<sec:authentication property="name" var="userName"/>
<c:if test="${userName eq 'anonymousUser'}">
	<c:set var="userName" value=""/>
</c:if>
<script type="text/javascript">

var nowtime = "${nowtime}";
var ctx ="${ctx}";
var zfwxPath ="${zfwxPath}";
var wqPath ="${wqPath}";
var casPath ="${casPath}";
var basePath ="${basePath}";
var bbsPath ="${bbsPath}";
var zfwxaPath ="${zfwxaPath}";
var sfjdPath ="${sfjdPath}";
var requestpath="${requestpath}";
</script>



