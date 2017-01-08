<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	</script>
</head>
<body>
	<h3><s:property value="%{#session.sysUser.name + ' 您好, 歡迎登入!'}"/></h3>
<%-- 	<s:set var="nameSpace" value="%{'/researchPlan'}"/> --%>
<%-- 	<s:set var="actioinName" value="%{'init'}"/> --%>
<%-- 	<h2><s:property value="#nameSpace"/></h2> --%>
<%-- 	<h2><s:property value="#actioinName"/></h2> --%>
<%-- 	<h2><s:property value="%{'#session.sysUser.hasAuth('+#nameSpace+','+#actioinName+')' }"/></h2> --%>
<%-- 	<h2><s:property value="%{#session.sysUser.hasAuth(#nameSpace, #actioinName) }"/></h2> --%>
</body>
</html>