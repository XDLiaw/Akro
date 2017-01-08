<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/consulting")}'>
	<li><a href="#">諮詢服務表</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/consulting", "init")}'>
				<li><a href="<s:url value="/consulting/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/consulting", "create")}'>
				<li><a href="<s:url value="/consulting/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
