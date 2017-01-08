<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/news")}'>
	<li><a href="#">公告訊息</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/news", "init")}'>
				<li><a href="<s:url value="/news/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/news", "create")}'>
				<li><a href="<s:url value="/news/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>
