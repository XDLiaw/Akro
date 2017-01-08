<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/faq")}'>
	<li><a href="#">常問集</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/faq", "init")}'>
				<li><a href="<s:url value="/faq/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/faq", "create")}'>
				<li><a href="<s:url value="/faq/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
