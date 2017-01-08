<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/about")}'>
	<li><a href="#">關於</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/about", "init")}'>
				<li><a href="<s:url value="/about/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/about", "create")}'>
				<li><a href="<s:url value="/about/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
