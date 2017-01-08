<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/contactUs")}'>
	<li><a href="#">客服信箱</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/contactUs", "init")}'>
				<li><a href="<s:url value="/contactUs/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/contactUs", "create")}'>
				<li><a href="<s:url value="/contactUs/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
