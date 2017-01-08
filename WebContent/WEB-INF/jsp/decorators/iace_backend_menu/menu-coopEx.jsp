<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/coopEx")}'>
	<li><a href="#">產學合作案例</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/coopEx", "init")}'>
				<li><a href="<s:url value="/coopEx/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/coopEx", "create")}'>
				<li><a href="<s:url value="/coopEx/create"/>">新增</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>