<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/member")}'>
	<li><a href="#">會員</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/member", "init")}'>
				<li><a href="<s:url value="/member/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/member", "create")}'>
				<li><a href="<s:url value="/member/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
