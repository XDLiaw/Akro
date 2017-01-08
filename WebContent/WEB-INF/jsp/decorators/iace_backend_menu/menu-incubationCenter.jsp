<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/incubationCenter")}'>
	<li><a href="#">育成中心</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/incubationCenter", "init")}'>
				<li><a href="<s:url value="/incubationCenter/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/incubationCenter", "batchImport")}'>
				<s:if test="#session.sysUser.sysRole.name == '系統開發人員'">
					<li><a href="<s:url value="/incubationCenter/batchImport"/>">批次匯入</a></li>
				</s:if>	
			</s:if>
		</ul>
	</li>
</s:if>