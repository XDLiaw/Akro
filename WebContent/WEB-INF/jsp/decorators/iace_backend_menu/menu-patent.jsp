<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/patent")}'>
	<li><a href="#">專利資料</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/patent", "init")}'>
				<li><a href="<s:url value="/patent/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/patent", "create")}'>
				<li><a href="<s:url value="/patent/create"/>">新增</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/patent", "batchImport")}'>	
				<li><a href="<s:url value="/patent/batchImport"/>">批次匯入</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>	
