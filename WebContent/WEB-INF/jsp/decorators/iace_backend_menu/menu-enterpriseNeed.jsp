<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/enterpriseNeed")}'>
	<li><a href="#">企業需求單</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/enterpriseNeed", "init")}'>
				<li><a href="<s:url value="/enterpriseNeed/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/enterpriseNeed", "create")}'>
				<li><a href="<s:url value="/enterpriseNeed/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>