<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<%--<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.beans.factory.FactoryBean"%>
<%@page import="org.springframework.security.intercept.web.FilterSecurityInterceptor"%>
<%@page import="org.springframework.security.intercept.web.FilterInvocationDefinitionSource"%>
<%
    ApplicationContext ctx =  WebApplicationContextUtils.getWebApplicationContext(application);
    FactoryBean factoryBean = (FactoryBean) ctx.getBean("&filterInvocationDefinitionSource");
    FilterInvocationDefinitionSource fids = (FilterInvocationDefinitionSource) factoryBean.getObject();
    FilterSecurityInterceptor filter = (FilterSecurityInterceptor) ctx.getBean("filterSecurityInterceptor");
    filter.setObjectDefinitionSource(fids);
%>
--%><script type="text/javascript">
<!--
alert("刷新资源缓存！");
window.location = "main.jsp";
//-->
</script>
