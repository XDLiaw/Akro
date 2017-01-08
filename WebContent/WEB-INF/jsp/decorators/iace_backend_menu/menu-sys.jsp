<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/sys")}'>
	<li><a href="#">系統管理</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/sysLog", "init")}'>
				<li><a href="<s:url value="/sysLog/init"/>">系統Log</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/sysUser", "init")}'>
				<li><a href="<s:url value="/sysUser/init"/>">系統使用者</a></li>
			</s:if>	
			<s:if test='%{#session.sysUser.hasAuth("/sysRole", "init")}'>
				<li><a href="<s:url value="/sysRole/init"/>">系統角色 </a></li>
			</s:if>	
			<s:if test='#session.sysUser.sysRole.name == "系統開發人員"'>
				<li><a href="<s:url value="/developerFunc/init"/>">開發人員專屬功能</a></li>
			</s:if>
		</ul>
	</li>
</s:if>